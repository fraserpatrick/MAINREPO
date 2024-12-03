-- |
-- Module: JSONTransformer
-- Description: One-to-many JSON Transformation combinators
--
-- The design of these transformers is based on the design of the Jq
-- tool, and this paper on a Haskell-based Domain Specific Language
-- (DSL) for querying XML data:
--
--   "Haskell and XML: generic combinators or type-based translation?"
--   by Malcolm Wallace and Colin Runciman
--   https://dl.acm.org/doi/10.1145/317765.317794
--
-- Section 2 of the paper covers what we're doing. The 'CFilter' type
-- is what we called 'Transformer' here.

module JSONTransformer where

import JSON

-- | A converter from JSON values to zero or more JSON values.
type Transformer = JSON -> [JSON]

------------------------------------------------------------------------------
-- Transformers for constructing JSON values

-- | The @constant@ transformer is one that always outputs a fixed
-- value for all transformer inputs.
constant :: JSON -> Transformer
constant item _ = [item]

-- HINT: you can use 'constant' to implement the next four functions
-- more easily.

-- | A transformer that always generates a fixed string value.
string :: String -> Transformer
string str = constant (JsonString str)

-- | A transformer that always generates a fixed integer value.
integer :: Integer -> Transformer
integer int = constant (JsonInteger int)

-- | A transformer that always generates a fixed boolean value.
bool :: Bool -> Transformer
bool trueOrFalse = constant (JsonBoolean trueOrFalse)

-- | A transformer that always generates the null value.
jnull :: Transformer
jnull _ = [JsonNull]

-- | Filters the input using another transformer. If the transformer
-- argument returns a truthy value (as determined by 'JSON.isTruthy')
-- for the input, then return the input in a single element
-- list. Otheriwse, return the empty list.
--
-- For example, if the condition is always true, then you get back the
-- input:
-- >>> select (bool True) (JsonArray [JsonInteger 1, JsonInteger 2])
-- [JsonArray [JsonInteger 1,JsonInteger 2]]
--
-- If the condition is never true, then you get back the empty list:
-- >>> select (bool False) (JsonArray [JsonInteger 1, JsonInteger 2])
-- []
--
-- Selecting for the `"a"` field being `1`, when it is:
-- >>> select (binaryOp equal (getField "a") (integer 1)) (JsonObject [("a", JsonInteger 1)])
-- [JsonObject [("a", JsonInteger 1)]]
--
-- Selecting for the `"a"` field being `1`, when it isn't:
-- >>> select (binaryOp equal (getField "a") (integer 1)) (JsonObject [("a", JsonInteger 2)])
-- []
--
-- If the `equal` returns multiple values, then only one of them needs
-- to be `True` for it to select that thing, so we can check to see if
-- a certain element is in an array:
-- >>> select (binaryOp equal getElements (integer 1)) (JsonArray [JsonInteger 1, JsonInteger 3, JsonInteger 4])
-- [JsonArray [JsonInteger 1,JsonInteger 3,JsonInteger 4]]
--
-- Same test, but this time with an array that doesn't contain `1`:
-- >>> select (binaryOp equal getElements (integer 1)) (JsonArray [JsonInteger 3, JsonInteger 4])
-- []
--
-- The following example tests to see whether or not the @"a"@ field
-- of the input contains an array that contains the value @1@:
-- > select (binaryOp equal (pipe (getField "a") getElements) (integer 1))
--
-- In Jq syntax, this is @select(.a | .[] == 1)@
select :: Transformer -> Transformer
select func input =
  case any isTruthy (func input) of
    True  -> [input]
    False -> []

-- HINT: you'll need to check to see if the transformer argument
-- returns an isTruthy value at any point in its list for the
-- input. You can use the 'any' function (Week 05) to do this.

-- | Converts any binary operation (i.e. a two argument function) from
-- working on 'JSON' values to work on transformers. The same input is
-- fed to the two transformers and all pairs of their outputs are
-- combined using the operation.
--
-- >>> binaryOp JSON.equal (string "a") (string "a") JsonNull
-- [JsonBoolean True]
-- >>> binaryOp JSON.equal (string "a") (integer 5) JsonNull
-- [JsonBoolean False]
-- >>> binaryOp JSON.equal (integer 1) getElements (JsonArray [JsonInteger 1, JsonString "a"])
-- [JsonBoolean True,JsonBoolean False]
-- >>> binaryOp JSON.notEqual (integer 1) getElements (JsonArray [JsonInteger 1, JsonString "a"])
-- [JsonBoolean False,JsonBoolean True]
-- >>> binaryOp JSON.equal getElements getElements (JsonArray [JsonInteger 1, JsonString "a"])
-- [JsonBoolean True,JsonBoolean False,JsonBoolean False,JsonBoolean True]
binaryOp :: (JSON -> JSON -> JSON) -> Transformer -> Transformer -> Transformer
binaryOp oper trans1 trans2 input = concatMap (\x -> map (oper x) (trans2 input)) (trans1 input)

-- | Connects two transformers together, feeding the output of the
-- first into the input of the second, and then flattening all the
-- results.
--
-- A picture, where 'x' is the input, 'f' is the first transformer,
-- and 'g' is the second.
--
-- >
-- >           [v1,   --g--> [[x1,         [x1,
-- >                           x2],         x2,
-- >x  --f-->   v2,   --g-->  [x3,    -->   x3,
-- >                           x4],         x4,
-- >            v3]   --g-->  [x5,          x5,
-- >                           x6]]         x6]
-- >
--
-- Connecting 'getElements' to 'getElements' via a pipe "unwraps" two
-- levels of arrays.
-- >>> pipe getElements getElements (JsonArray [JsonArray [JsonInteger 1, JsonInteger 2], JsonArray [JsonInteger 3, JsonInteger 4]])
-- [JsonInteger 1,JsonInteger 2,JsonInteger 3,JsonInteger 4]
--
-- Connecting 'getElements' to @field "a"@ via a pipe takes everything
-- from an array, and then all the @"a"@ fields.
-- >>> pipe getElements (getField "a") (JsonArray [JsonObject [("a", JsonInteger 1)],JsonObject [("a", JsonInteger 2)], JsonObject []])
-- [JsonInteger 1,JsonInteger 2]
--
-- Connecting @field "a"@ to elements via a pipe will look up the
-- field @"a"@ in an object and then get all the elements from the
-- array stored in that field.
-- >>> pipe (getField "a") getElements (JsonObject [("a", JsonArray [JsonInteger 1, JsonString "abc", JsonNull])])
-- [JsonInteger 1,JsonString "abc",JsonNull]
pipe :: Transformer -> Transformer -> Transformer
pipe trans1 trans2 input = concatMap (trans2) (trans1 input)

-- HINT: this function is very similar to the 'o' function in the
-- paper linked above.

-- | Extracts the elements of a @JsonArray@. If the input is not an
-- array, then the empty list of results is returned.
--
-- >>> getElements (JsonArray [JsonInteger 1, JsonString "a"])
-- [JsonInteger 1, JsonString "a"]
-- >>> getElements (JsonObject [])
-- []
--
getElements :: Transformer
getElements (JsonArray xs) = xs
getElements _ = []

-- | Extracts the value of a named field from the input JSON, if it is
-- a 'JsonObject'. If the field does not exist, or the input is not an
-- object, then the empty list of results is returned.
--
-- Examples:
--
-- >>> getField "a" (JsonObject [("a", JsonInteger 5)])
-- [JsonInteger 5]
-- >>> getField "b" (JsonObject [("a", JsonInteger 5)]
-- []
-- >>> getField "a" (JsonArray [JsonInteger 1, JsonNull])
-- []
--
-- The behaviour when the same field appears multiple times is
-- unspecified.
getField :: String -> Transformer
getField field (JsonObject xs) = 
  case lookup field xs of
    Just value -> [value]
    Nothing -> []
getField _ _ = []

-- HINT: the 'lookup' function from the standard library will do the
-- lookup in the list of (name,value) pairs inside a JsonObject for
-- you.
