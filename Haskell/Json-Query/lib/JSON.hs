-- |
-- Module: JSON
-- Description: Representation of JSON values
--
-- This module implements a straightforward representation of JSON
-- values. For simplicity, we only allow integer numeric data and no
-- floating point nubers.
module JSON where

-- | Representation of JavaScript Object Notation (JSON) values.
--
-- See the JSON website for more information: https://www.json.org/json-en.html
--
-- And the RFC: https://www.rfc-editor.org/rfc/rfc8259
data JSON
  = JsonString  String
    -- ^ Constructor for JSON String values.
  | JsonInteger Integer
    -- ^ Constructor for JSON Number values (just integers for this
    -- simple program).
  | JsonBoolean Bool
    -- ^ Constructor for JSON Boolean values.
  | JsonNull
    -- ^ Constructor for JSON Null values
  | JsonArray   [JSON]
    -- ^ Constructor for Arrays of JSON values
  | JsonObject  [(String, JSON)]
    -- ^ Constructor for JSON objects, represented as lists of (name,value) pairs
  deriving (Show, Eq, Ord)

-- | An example piece of JSON, with the heights of some hills from
-- Britain and Ireland.
hillsExample :: JSON
hillsExample =
  JsonArray
  [ JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],
    JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)],
    JsonObject [("Name", JsonString "Iwerddon"),("Country", JsonString "W"),("Height", JsonInteger 583)],
    JsonObject [("Name", JsonString "Maolan Bui"),("Country", JsonString "I"),("Height", JsonInteger 968)]
  ]

-- | Determines "truthy" JSON values.
--
-- A truthy JSON value is one that is exactly @JSONBoolean
-- True@. Anything else is considered falsy.
--
-- “Truthy” and “Falsy” are concepts used languages that don't throw
-- errors when trying to use non-boolean values as truth values. Some
-- rule is needed to determine *for every type* which elements are
-- "true" and which are "false". This can be a great way to hide bugs
-- when the things being tested are mistaken for actual boolean values.
--
-- Python and JavaScript are examples of languages with "truthiness":
--   * https://docs.python.org/3/library/stdtypes.html#truth-value-testing
--   * https://developer.mozilla.org/en-US/docs/Glossary/Truthy
isTruthy :: JSON -> Bool
isTruthy (JsonBoolean True) = True
isTruthy _ = False

-- | Equality comparison on JSON values.
--
-- Returns @JsonBoolean True@ if the two values are equal, and
-- @JsonBoolean False@ otherwise.
--
-- Whether or not two JSON objects with the same fields in different
-- orders are considered equal is not specified.
equal :: JSON -> JSON -> JSON
equal json1 json2 = case compare json1 json2 of
  EQ -> (JsonBoolean True)
  _ -> (JsonBoolean False)

-- | Disequality comparison on JSON values.
--
-- Returns @JsonBoolean False@ if the two values are equal, and
-- @JsonBoolean True@ otherwise.
notEqual :: JSON -> JSON -> JSON
notEqual json1 json2 = case compare json1 json2 of
  EQ -> (JsonBoolean False)
  _ -> (JsonBoolean True)
