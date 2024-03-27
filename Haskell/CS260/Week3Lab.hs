--1) Defined the function addOne which adds 1 to each element in a list of integers.

addOne::[Int] -> [Int]
addOne []     = []
addOne (x:xs) = x+1 : addOne xs
--How many times will addOne be called on the list [1,2,3,4,5]?


--2) Define a function cycleinc::[Integer]->[Integer] that creates an infinite list by repeating a given finite list indefinitely, adding in each repetition 1 to each element of the original list.

-- Example:    cycleinc [1,2,3] = [1,2,3,2,3,4,3,4,5..]

cycleInc::[Int] -> [Int]
cycleInc [] = []
cycleInc x = x ++ cycleInc (addOne x)


--3) Write a function pythTriples which, for an integer n, returns all triples such that a^2 + b^2 = c^2 and  a,b,c <= n

pythTriples:: Int -> [(Int,Int,Int)]
pythTriples n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]


--4) Define a function threeStrikes which returns "You're Out!" if it finds three occurences of a given value in a list returning "all good" otherwise. Hint. you may want to define a helper function, also consider whether or not your function would work with infinite lists.

threeStrikes::Char -> String -> String 
threeStrikes = undefined 

--5) Define the function sumEven which sums the even values of a list

sumEven::[Int] -> Int
sumEven [] = 0
sumEven (x:xs) | x `mod` 2 == 0 = x + sumEven xs
               | otherwise      = sumEven xs

--6) Define a function occursTwice wich returns True if a character occurs twice in a row in a given string and False otherwise.

occursTwice::Char -> String -> Bool 
occursTwice = undefined 

--lift occursTwice to work on lists of strings.

otList::Char -> [String] -> [Bool]
otList = undefined 

--lift otList to work on lists of lists!

otListList::[[String]] -> Char -> [[Bool]]
otListList = undefined 

--7) Without using the maximum function define maxList which finds the maximum value in a list of integers.

maxList::[Int] -> Int 
maxList []     = 0

--Use this function to define sortList which sorts a list from smallest to largest.

sortList::[Int] -> [Int]
sortList [] = []
sortList (x:[]) = [x] 
sortList (x:y:xs) | x > y     = y:x : sortList (x:xs)
                  | otherwise = x: sortList (y:xs)

--8) Define findPos which returns the character at a given position in a string

findPos::Int -> String -> Char 
findPos = undefined 

--9) Define rev2 which reverses lists of length 2  and leaves all other lists unchanged 

rev2::[Int] -> [Int]
rev2 = undefined 

--10) The above functions can be made polymorphic using the correct typeclasses. Update  their types to make them more generic.
