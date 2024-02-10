{-Assingment 1
-------------------------------------------
Submit you answers using the myplace link as  <Your name>.hs file. For all questions you may not change the type of the function. You may define helper functions for any question. You may use any functions within the Haskell prelude unless otherwise specified but you should not import any other libraries. Solutions must be submitted via the myplace link by 01/03/24 17:00. Partial solutions may still attract marks. If your code fails to compile your mark will be capped at 50%. You can check that your code compiles by loading it into ghci using the :l <yourfilename> command.   -}

  
{- 
1) Define buildSquare which builds the list of numbers whose square is less than a given value. e.g. buildSquare 50 = [1,2,3,4,5,6,7] , buildSquare 10 = [1,2,3] (2 marks)
-}

buildSquare :: Int -> [Int]
buildSquare s = [x | x <- [1..s], x*x < s]

{-
2) Define longerList which takes 2 lists and returns True if the first is longer than the second and False otherwise. (2 marks)
-}

longerList :: [a] -> [a] -> Bool
longerList x y | getListLength x > getListLength y = True
               | otherwise                           = False

getListLength:: [a] -> Int 
getListLength [] = 0
getListLength (x:xs) = 1 + getListLength xs

{-
3a) Define allTrue which returns True only when every element in a list of Booleans is True. (2 marks)
-}

allTrue :: [Bool] -> Bool
allTrue []     = True
allTrue (x:xs) | x == True = allTrue xs
               | otherwise = False


{-
3b) Define smallerNumbers which takes an integer and a list of integers. smallerNumbers should then remove all elements of the list which are larger than the given integer. (2 marks)
-}

smallerNumbers :: Int -> [Int] -> [Int]
smallerNumbers x xs = undefined


{-
4a) Write a function insert that takes as its first argument a function f, as second argument an element x of a, and as third argument a list xs of type a, and inserts x just before the first element y of xs such that f y > f x (if such a y does not exist, x should be inserted at the end of the list). (2 marks)
-}

insert :: Ord b => (a -> b) -> a -> [a] -> [a]
insert = undefined

{-
4b) Use insert to define a function inssort that sorts a given list such that the sorted list satisfies the following condition: x occurs before y implies f x <= f y (3 marks)
-} 

inssort :: Ord b => (a -> b) -> [a] -> [a]
inssort = undefined

{-
5) Define runningSum which returns the sum of a list at every postion. For example runningSum [1,2,3,4,5] == [1, 3, 6, 10, 15]. (3 marks)
-}

runningSum :: [Int] -> [Int]
runningSum = undefined

----------------------------------
data Bit = O | I
 deriving (Show,Eq) 

{-
Here the Bit type has been declared as either an I value or a O value. We will use this type in some of the following questions, you can view it as being extremely similar to the Bool type. Treat I as the bit value 1 and O as 0. Here is an example of a not function. 
-}

myNot :: Bit -> Bit
myNot I = O 
myNOt O = I 

{-
6a) Define myAnd which applies logical and to two given Bit values. e.g myAnd I I = I, myAnd O I = O. (1 mark)
-}

myAnd :: Bit ->  Bit -> Bit
myAnd x y | x == I && y == I = I
          | otherwise        = O

{-
6b) We can use lists of bits to represent binary numbers. Using myAnd define bitwiseAnd which takes two lists of Bits and applies myAnd to the corresponding elements of each list. Your bitewiseAnd should manage lists of different lengths by discarding excess values.  (2 marks) 
-}

bitwiseAnd :: [Bit] -> [Bit] -> [Bit]
bitwiseAnd = undefined

{-
6c) Define bin2Int which converts a binary number, represented as a list of bits, to an integer. You must consider the place value of each Bit with the first element being the most significant and the last being the least significant. (3 marks)
    bit2Int [O,I] = 1
    bit2Int [I,O,I] = 5 
    bit2Int [I,I,I] = 7 
    bit2Int [I,O,O,O] = 8
-}

bit2Int :: [Bit] -> Int 
bit2Int = undefined


{-
7) Define substrings which, for a given string, returns every possible subset of the characters within a string. Your function should preserve the ordering of characters. substrings "cat" == ["cat","ca","ct","c","at","a","t",""] (the order of the result doesn't matter) (4 marks)
-}

substrings :: String -> [String]
substrings = undefined 

{-
8) Consider the following algorithm for reversing the digits of an integer.

 fun(x) {
    y = 0;
    while(x>0){
        z = x `mod` 10;
        y = y*10 + z;
        x = x `div` 10;
    }
    return y;
 }
 Implement a recursive version of this algorithm. Note that ending zeros will be dropped (1230 -> 321), this is fine. (3 marks)
 -}

revDig :: Int -> Int
revDig = undefined 

testDivHel x = revDig x == (read.reverse.show) x -- this will test all positive values of your solution.

{-
Here is a data structure for leaf-labelled ternary trees:
-}

data TTree a = Node (TTree a) (TTree a) (TTree a) | Leaf a
  deriving (Show)

{-
9) Write a function that returns the largest value stored in a ternary tree (3 marks)

largestValue (Node (Leaf 4) (Leaf 5) (Leaf 6)) == 6
largestValue (Node (Leaf 19) (Leaf 5) (Leaf 6)) == 19
-}

largestValue :: (Ord a) => TTree a -> a
largestValue = undefined


{-
Here is a data structure for key-value dictionaries with integer keys:
-}

newtype Dictionary k v = Dictionary [(k, v)]

{-
10a) A dictionary is valid if it does not contain the same key twice. Write a function that checks whether a dictionary is valid (3 marks) 

dictionaryValid (Dictionary [(1,True),(2,False),(3,False)]) == True
dictionaryValid (Dictionary [(1,True),(2,False),(3,False),(1,False)] == False
-}

dictionaryValid :: (Eq k) => Dictionary k v -> Bool
dictionaryValid = undefined

{-
10b) Write a function to insert a key-value pair into a dictionary, which fails if the given key is already used in the dictionary (2 marks) 
dictionaryValid (Dictionary [(1,True),(2,False),(3,False)]) 1 True == Nothing
dictionaryValid (Dictionary [(1,True),(2,False),(3,False)]) 4 False == Just (Dictionary [(1,True),(2,False),(3,False),(4,False)])
-}

dictionaryInsert :: (Eq k) => Dictionary k v -> k -> v -> Maybe (Dictionary k v)
dictionaryInsert = undefined


{-
10c) Write a Foldable instance for dictionaries (3 marks)
-}

-- data Foldable (Dictionary k) where
--   foldr = undefined

