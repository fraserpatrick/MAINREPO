-- |
-- Module: JSONOutput
-- Description: Conversion of JSON values to their string representations.
module JSONOutput where

import JSON
import Data.List (intersperse)

-- | Returns the JSON escaped version of a character.
--
-- Escaping is used to mark characters that would otherwise be
-- interpreted as control codes. Strings in JSON are begun and ended
-- by double-quotes, so if we want to put a double-quote in a string
-- then we need to mark it as special. JSON (and Haskell and Java and
-- ...) do this by putting a backslash in front of it. This means that
-- backslashes are also treated as special, so if we want to have a
-- backslash in a string, then we need to represent it with two
-- backslashes.
--
-- JSON also escapes common control characters such as newline, tabs,
-- carriage return, etc., and optionally non-ASCII unicode
-- characters. This function also escapes these. See the JSON
-- standards documentation for information on what characters to
-- escape.
--
-- Any character that is not escaped is return as-is in a one
-- character string.
escapeChar :: Char -> String
escapeChar  c
  | c == '"'  = "\\\""
  | c == '\n' = "\\n"
  | c == '\t' = "\\t"
  | c == '\\' = "\\\\"
  | otherwise = [c]

-- | Convert every character in a String to its escaped
-- representation and concatenate them all together.
--
-- For example:
-- >>> escapeString "Hello \"world\""
-- "Hello \\\"world\\\""
-- (note that both JSON and Haskell escaping are happening here!)
escapeString :: String -> String
escapeString = concatMap escapeChar

-- | Quote a string by placing double-quotation marks before and after.
quote :: String -> String
quote str = "\"" ++ str ++ "\""

-- | Render a string as its JSON representation by escaping every
-- character and placing double-quotes around it.
--
-- For example,
-- >>> renderString "Hello \"world\""
-- "\"Hello \\\"world\\\"\""
renderString :: String -> String
renderString str = quote (escapeString str)

-- | Put square brackets [ ] around a string.
sqbracket :: String -> String
sqbracket str = "[" ++ str ++ "]"

-- | Put curly brackets { } around a string.
curlybracket :: String -> String
curlybracket str = "{" ++ str ++ "}"

-- | Concatenate a list of items with a separator between each one.
concatWith :: Monoid m => m -> [m] -> m
concatWith space [] = mempty
concatWith space [x] = x
concatWith space (x:xs) = x <> space <> concatWith space xs

-- | Render a JSON-style object field as @"field name": <value>@.
--
-- For example,
-- >>> renderField ("myNull", JsonNull)
-- "\"myNull\":null"
renderField :: (String, JSON) -> String
renderField (fieldName, value) = renderString fieldName ++ ": " ++ renderJSON value

-- | Converts a JSON value into its string representation.
--
--
renderJSON :: JSON -> String
renderJSON (JsonString s) = renderString s
renderJSON (JsonInteger i) = show i
renderJSON (JsonBoolean True) = "true"
renderJSON (JsonBoolean False) = "false"
renderJSON JsonNull = "null"
renderJSON (JsonArray jsons) = sqbracket . concatWith ", " $ map renderJSON jsons
renderJSON (JsonObject fields) = curlybracket . concatWith ", " $ map renderField fields
