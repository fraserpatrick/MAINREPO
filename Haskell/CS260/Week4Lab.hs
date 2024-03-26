{-Today we will look at polymorphism, typeclasses and higher order functions..  -}

--1) The following maxVal function has an issue in that it assumes the largest value must be larger than zero. maxVal uses the maxHelper to carry out the heavy lifting

maxVal::[Int] -> Int
maxVal xs = maxHelper 0 xs

maxHelper::Int -> [Int] -> Int
maxHelper m [] = m                  
maxHelper m (x:xs) | m >= x = maxHelper m xs
                   | otherwise = maxHelper x xs

--Using the typeclass Bounded and any other typeclass you may need improve maxHelper and maxVal. Your final solution should not assume the largest value is greater than 0 and should have the most generic type possible. 

--2) Some typeclasses subsume the functionality of others. That is, some classes contain enough functionality to define functionality from other clases. Using only functionality from the Ord typeclass define a function equals whch for two values returns True when they are equivelant and false otherwise. You may not use (==).

equals::Ord a => a -> a -> Bool 
equals = undefined

--3) Define higher checksum which checks, for a function f and threee inputs a,b and c if f c = f a + f b

higherCheckSum::(Eq a,Num a) => (a -> a) -> a -> a -> a -> Bool 
higherCheckSum = undefined

--4) What is the type of map map? 

--5) Using filter define a function returnList which returns the same list as it was given.

returnList::[a] -> [a]
returnList = undefined

--6) Define numRange which takes a function as well as two numbers. The function should then apply the function to the range of values generated from the two values supplied. You may assume that the first integer is smaller than the second. 

numRange::(Int -> Int) -> Int -> Int -> [Int]
numRange = undefined

--7) Define mapFilter which maps only the elements which are not filtered out of the list. First define without using map or filter then using both. 

mapFilter::(a -> Bool) -> (a -> b) -> [a] -> [b]
mapFilter = undefined

--8a) Define composition which takes two functions and evaluates their composition

composition::(a -> b) -> (b -> c) -> a -> c
composition = undefined 

--8b) Defined doubleMap which maps two functions over a list 

doubleMap:: (a -> b) -> (b -> c) -> [a] -> [c]
doubleMap = undefined






