-- | A simple parser combinator library.
module ParserCombinators where

import           Result
import           Control.Applicative (Alternative (..))
import           Data.Char (isNumber, digitToInt, isAlpha, isAlphaNum)

{- This is the code for the parser combinators you should use to
   implement your parsers. You may want to consult this code to help
   you write your parser, but do not modify it. -}

-- | A parser for values of type @a@.
newtype Parser a = MkParser (String -> Result (a, String))

-- | Runs a parser on a string, returning the parsed result and left
-- over input, or an 'Error' if the parse was unsuccessful.
runParser :: Parser a -> String -> Result (a, String)
runParser (MkParser f) = f

-- | Runs a parser on a string, returning the parsed result. Checks
-- that there is no left over input remaining, returning an error if
-- this is the case.
completeParse :: Parser a -> String -> Result a
completeParse (MkParser f) s =
  case f s of
    Error msg  -> Error msg
    Ok (a, "") -> Ok a
    Ok (_, rest) -> Error ("Trailing input: " ++ show rest)

instance Monad Parser where
  p >>= k =
    MkParser (\s -> case runParser p s of
                      Error msg  -> Error msg
                      Ok (a, s') -> runParser (k a) s')

instance Functor Parser where
  fmap f p =
    do x <- p
       return (f x)

instance Applicative Parser where
  pure x = MkParser (\s -> Ok (x,s))

  pf <*> pa = do f <- pf; a <- pa; return (f a)

instance Alternative Parser where
  empty = failParse "parse failed, and no error message provided"
  (<|>) = orElse

-- | A parser that tries the first parser first. If that fails, it
-- tries the second parser. If both fail, the error message from the
-- second one is returned.
orElse :: Parser a -> Parser a -> Parser a
orElse p1 p2 =
  MkParser (\input ->
              case runParser p1 input of
                Ok (a,input1) -> Ok (a,input1)
                Error _       -> runParser p2 input)

-- | A parser that always fails with the given error message, no
-- matter what the input is.
failParse :: String -> Parser a
failParse msg = MkParser (\_ -> Error msg)

-- | A parser that expects at least one character to be in the input
-- and returns that. Errors if the input is empty.
char :: Parser Char
char =
  MkParser
  (\input ->
      case input of
        []     -> Error "unexpected end of input was found"
        (c:cs) -> Ok (c, cs))

-- | A parser that checks for a given character at the current point
-- in the input.
isChar :: Char -> Parser ()
isChar expected =
  do seen <- char
     if expected == seen then
       return ()
     else
       failParse ("Expecting " ++ show expected ++ ", got " ++ show seen)

-- | A parser that checks for a character satisfying a given
-- predicate. The string argument is a human-readable name for the
-- predicate that is used in the error message. For example,
--
-- > satisfies "a digit" isDigit
satisfies :: String -> (Char -> Bool) -> Parser Char
satisfies p_description p = do
  c <- char
  if p c then return c
    else failParse ("Expecting " ++ p_description ++ ", got " ++ show c)

-- | A parser that expects the given string at the current position in
-- the input. For example,
--
-- > stringLiteral "True"
--
-- Expects the string @"True"@. An error mentioning the expected
-- string is returned if there is something else in the input.
stringLiteral :: String -> Parser ()
stringLiteral expected =
  mapM_ isChar expected
  `orElse`
  failParse ("Expecting '" ++ expected ++ "'")

-- | Parser for characters that may appear in a quoted string,
-- decoding any escaped characters.
quotedStringChar :: Parser Char
quotedStringChar =
  do c <- char
     case c of
       '"'  -> failParse ""
       '\\' -> char
       _    -> return c

-- | Parser for quoted strings, handling escaped quotes. For example,
--
-- > "Hello\"World\""
quotedString :: Parser String
quotedString =
  do isChar '"'
     cs <- zeroOrMore quotedStringChar
     isChar '"'
     return cs

-- | A parser for individual digits (i.e. @'0'@ ... @'9'@) and returns
-- them as integers.
digit :: Parser Integer
digit = do
  c <- char
  if isNumber c then
    return (toInteger (digitToInt c))
  else
    failParse "Expecting a digit"

-- | A parser that parses one or more repetitions of the given
-- parser. For example,
--
-- > oneOrMore digit
--
-- parses one or more digits, returning a list of digits.
oneOrMore :: Parser a -> Parser [a]
oneOrMore p =
  do x  <- p
     xs <- zeroOrMore p
     return (x:xs)

-- | A parser that parsers zero or more repetitions of the given
-- parser. For example,
--
-- > zeroOrMore digit
--
-- parses zero or more digits, returning a list of the parsed digits.
zeroOrMore :: Parser a -> Parser [a]
zeroOrMore p =
  do x <- p
     xs <- zeroOrMore p
     return (x:xs)
  `orElse`
  return []

-- | Parses positive integers (including '0') in base 10.
number :: Parser Integer
number =
  foldl (\l r -> l*10+r) 0 <$> oneOrMore digit
  `orElse`
  failParse "Expecting a positive number"

-- | Parser for individual white space characters.
whitespace :: Parser ()
whitespace = do _ <- satisfies "a space character" (\c -> c == ' ' || c == '\n' || c == '\t')
                return ()

-- | Parser for zero or more spaces.
whitespaces :: Parser ()
whitespaces = do _ <- zeroOrMore whitespace
                 return ()

-- | Parser for newline sequences (either "\\n" or "\\r\\n").
newline :: Parser ()
newline = isChar '\n' `orElse` stringLiteral "\r\n"



-- | Parser for "identifier" names, similar to the rules for variable
-- names in most programming languages. Starts with an alphabetic
-- character, and the rest must be alphannumeric. An identifier always
-- has at least one character in it.
identifier :: Parser String
identifier =
  do c  <- satisfies "alphabetic character" isAlpha
     cs <- zeroOrMore (satisfies "alphanumeric character" isAlphaNum)
     return (c:cs)
  `orElse`
  failParse "Expecting an identifier"

-- | A parser that parses zero or more things, separated by the parser
-- given in the first argument. For example,
--
-- > sepBy space identifier
--
-- Parses zero or more 'identifier's separated by 'space's.
sepBy :: Parser () -> Parser a -> Parser [a]
sepBy sep p =
  do x  <- p
     xs <- zeroOrMore (do sep; p)
     return (x:xs)
  `orElse`
  return []
