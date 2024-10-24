{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
module Week02Problems where

import Week02

{------------------------------------------------------------------------------}
{- TUTORIAL QUESTIONS                                                         -}
{------------------------------------------------------------------------------}

{- In the questions below, replace 'undefined' with your answers. Use
   GHCi to test them.-}

{- 1. Write a function that counts the number of occurrences of an
      element in list: -}

popCount :: Eq a => a -> [a] -> Int
popCount x []     = 0
popCount x (y:ys) 
  | x == y    = 1 + popCount x ys
  | otherwise = popCount x ys

{-    (popCount is short for "population count"). Examples:

         popCount 2 [1,2,5,2,7,2,9] == 3
         popCount 9 [1,2,5,2,7,2,9] == 1
         popCount 0 [1,2,5,2,7,2,9] == 0
-}


{- 2. Write a version of 'insert' that only inserts into a sorted list
      if the element is not already there. Examples:

         insertNoDup 2 [1,3,4]   == [1,2,3,4]
         insertNoDup 2 [1,2,3,4] == [1,2,3,4]
-}

insertNoDup :: Ord a => a -> [a] -> [a]
insertNoDup x [] = [x]
insertNoDup x (y:ys)
  | x == y    = y : ys
  | x < y     = x : y : ys
  | otherwise = y : insertNoDup x ys


{- 3. Write a version of 'remove' that removes all copies of an element
      from a sorted list, not just the first one. Examples:

         removeAll 2 [1,2,2,3] == [1,3]
         removeAll 2 [1,3]     == [1,3]
-}

removeAll :: Ord a => a -> [a] -> [a]
removeAll x [] = []
removeAll x (y:ys)
  | x == y    = removeAll x ys
  | x > y     = y:removeAll x ys
  | otherwise = y:ys


{- 4. Rewrite 'treeFind' and 'treeInsert' to use 'compare' and 'case'
      expressions. -}

treeFind2 :: Ord k => k -> KV k v -> Maybe v
treeFind2 x Leaf = Nothing
treeFind2 x (Node lTree (k,v) rTree) = 
  case compare x k of
    EQ -> Just v
    LT -> treeFind2 x lTree
    GT -> treeFind2 x rTree

treeInsert2 :: Ord k => k -> v -> KV k v -> KV k v
treeInsert2 newK newV Leaf = Node Leaf (newK,newV) Leaf
treeInsert2 newK newV (Node lTree (k,v) rTree) =
  case compare newK k of
    EQ -> Node lTree (newK,newV) rTree
    LT -> Node (treeInsert2 newK newV lTree) (k,v) rTree
    GT -> Node lTree (k,v) (treeInsert2 newK newV rTree)


{- 5. MergeSort is another sorting algorithm that works in the following
      way:

      - If the list to be sorted is zero length, then it is already
        sorted.

      - If the list to be sorted has one element, then it is already
        sorted.

      - Otherwise, split the list into two, one with the even elements
        and one with the odd elements. Sort the two lists by calling
        'mergeSort' recursively. Then merge the two lists together
        maintaining the ordering.

      Write this function in three parts: -}

{-    'split' splits the input into two lists: one with the odd numbered
      elements and one with the even numbered elements. For example:

        > split [45,12,89,29,93]
        ([45,89,93],[12,29])

      HINT: you can pattern match on multiple elements at the head of
      a list with 'x1:x2:xs', and you can use the '(odds,evens) = ...'
      syntax in a 'where' clause. -}

split :: [a] -> ([a], [a])
split []         = ([],[])
split [x]        = ([x],[])
split (x1:x2:xs) = (x1:odds,x2:evens)
   where (odds, evens) = split xs

{-    'merge' merges two sorted lists into one sorted list. Examples:

          merge [1,3,5] [2,4,6]  = [1,2,3,4,5,6]
          merge [1,3,5] [7,9,11] = [1,3,5,7,9,11]
-}

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] y  = y
merge x []  = x
merge (x:xs) (y:ys) 
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys


{-    'mergeSort' uses 'split' and 'merge' to implement the merge sort
      algorithm described above. -}

mergeSort :: Ord a => [a] -> [a]
mergeSort []     = []
mergeSort [x]    = [x]
mergeSort xs  = merge (mergeSort xs1) (mergeSort xs2)
  where (xs1,xs2) = split xs


{- 6. Write another version of 'makeChange' that returns all the
      possible ways of making change as a list: -}

makeChangeAll :: [Coin] -> [Coin] -> Int -> [[Coin]]
makeChangeAll coins        used 0 = [used]
makeChangeAll []           used _ = []
makeChangeAll (coin:coins) used amount
  | amount >= coin = makeChangeAll coins (coin:used) (amount - coin) ++ makeChangeAll coins used amount
  | otherwise      = makeChangeAll coins used amount

{- HINT: you don't need a case expression, just a way of appending two
   lists of possibilities. -}

{- 7. This question involves converting between two datatypes. A 'Row'
      is a list of strings, such as you might find in a database: -}

-- | A row is a list of strings, one for each field. For example:
--
-- > ["Mount Snowden", "Wales"]
type Row = [String]

{-    Note that the names of the fields, which might be 'Mountain' and
      'Country' here, are implicit in this representation.

      The second type is a record, which is a list of pairs of field
      names with their data: -}

-- | A record is a list of fieldname / value pairs. For example:
--
-- > [("Mountain", "Mont Blanc"), ("Country", "France")]
type Record = [(String,String)]

{-    Implement the following functions on rows and records: -}

-- | Look up a field in a record, returning @Nothing@ if the field is
-- not in the record. For example,
-- > lookupField "a" [("a","1"),("b","2")]
-- returns @Just "1"@, but
-- > lookupField "c" [("a","1"),("b","3")]
-- returns @Nothing@.
lookupField :: String -> Record -> Maybe String
lookupField fieldname []  = Nothing
lookupField fieldname ((key,item) :records)
  | fieldname == key = Just item
  | otherwise        = lookupField fieldname records

-- | Given a header listing field names, like:
--
-- >  ["Mountain", "Country"]
--
-- and a row like:
--
-- >   ["Ben Nevis", "Scotland"]
--
-- turn it into a record like:
--
-- >   [("Mountain", "Ben Nevis"), ("Country", "Scotland")]
--
-- If the number of field names in the header does not match the
-- number of fields in the row, an @Nothing@ should be returned.
rowToRecord :: [String] -> Row -> Maybe Record
rowToRecord [] [] = Just []
rowToRecord (header:headers) (item:items) =
  case rowToRecord headers items of
    Just record -> Just ((header,item) : record)
    Nothing -> Nothing
rowToRecord _ _ = Nothing

-- | Given a header listing field names, and a list of rows, converts
-- each row into a record. See 'rowToRecord' for how individual rows
-- are converted to records.
rowsToRecords :: [String] -> [Row] -> Maybe [Record]
rowsToRecords headers [] = Just []
rowsToRecords headers (item:items) =
  case rowsToRecords headers items of
    Nothing -> Nothing
    Just records -> 
      case rowToRecord headers item of
        Nothing -> Nothing
        Just record -> Just (record:records)
    

-- | Given a header listing field names, like:
--
-- >   ["Mountain", "Country"]
--
-- and a record like:
--
-- >   [("Mountain", "Ben Nevis"), ("Country", "Scotland")]
--
-- turn it into a row like:
--
-- >   ["Ben Nevis", "Scotland"]
--
-- It does not matter what order the fields in the record are in, so the
-- record:
--
-- >   [("Country", "Scotland"), ("Mountain", "Ben Nevis")]
--
-- should result in the same row.
--
-- This function returns an @Nothing@ if any of the field names listed in
-- the header are not in the record.
recordToRow :: [String] -> Record -> Maybe Row
recordToRow [] record = Just []
recordToRow (header:headers) record =
  case lookupField header record of
    Nothing -> Nothing
    Just item ->
      case recordToRow headers record of
        Nothing -> Nothing
        Just items -> Just (item:items)

-- | Given a header listing field names, and a list of records,
-- converts each record into a row. See 'recordToRow' for how
-- individual records are converted to rows.
recordsToRows :: [String] -> [Record] -> Maybe [Row]
recordsToRows headers [] = Just []
recordsToRows headers (record:records) =
  case recordToRow headers record of
    Nothing -> Nothing
    Just item ->
      case recordsToRows headers records of
        Nothing -> Nothing
        Just items ->
          Just (item:items)
