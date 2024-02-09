{-Once you have downloaded and saved this file you should open a terminal and navigate to the correct folder. Once you are in the correct folder run ghci, you will then be able to load this file using :l Ex1.hs . Define the required functions in the file using the already provided names and types! Do not change the naming or typing of functions. When defining a function f replace the line f = undefined with your definition. -} 

-- 1) Define the following:
--(a) a checkSum function that takes input a, b and c evaluating to true when a + b = c
  
checkSum :: Int -> Int -> Int -> Bool
checkSum a b c = a + b == c 

--(b) Define a function notdivisible::Int -> Int -> Bool that evaluates to True on input a and b if and only if a is not divisible by b.
 
notDivisible :: Int -> Int -> Bool
notDivisible a b = a `mod` b /= 0

--2) Define evenFactorial which, for a value n, multiplies all of the even numbers less than or equal to n. For example evenFactorial 6 should return 6*4*2.

evenFactorial :: Int -> Int
evenFactorial n | n == 1         = 0
                | n == 2         = 2
                | n `mod` 2 == 1 = evenFactorial (n-1)
                | otherwise      = n * evenFactorial (n-2)


{-3)
  a)The Collatz function is defined as follows:
f(x) = { x/2,    if x is even
       { 3x + 1, if x is odd
Define this function in Haskell (you may want to use div instead of /). -}

collatz :: Int -> Int 
collatz n | n `mod` 2 == 0 = n `div` 2
          | otherwise      = 3*n +1

--b) The collatz conjecture states that for any integer n repeated application of the collatz function will eventually reduce n to 1. Write a function which will count the number of applications needed to return a value of 1. The first argument should count the number of applications while the second holds the current value of n

collatzApp :: Int -> Int -> Int
collatzApp c n | n == 1    = 0
               | otherwise = 1 + collatzApp c (collatz n)

--Note. The collatz conjecture has yet to be proven, despite its simple appearance. Here is some code that will return the number of needed applications for every number from 1 to 1000. 

testCollatz = map (collatzApp 0) [1..1000]

--4) Define fibonnaci, which calculates the nth number of the fibonacci sequence. Challenge: try to avoid using the standard recursive definition. 

fibonacci :: Int -> Int 
fibonacci x | x == 0    = 0
            | x == 1    = 1 
            | otherwise = fibonacci (x-1) + fibonacci (x-2)

--5) Defined the combinatorial function for numbers n and m given by n!/(m!*(n-m)!), this should return an error if n < m

comb :: Int -> Int -> Int 
comb n m = undefined

--6) Define leapYear which returns a String telling the user whether a supplied year is a leap yer.

leapYear :: Int -> String
leapYear x | x `mod` 4 == 0 = "Is a leap year"
           | otherwise      = "Not a leap year"

--7) Define the function prime which returns True if a given number n is prime. Remember that a number is prime if it is not divisible by any number other than 1 and itself. It may help to define a helper function

prime :: Int -> Bool 
prime = undefined 

--8) Define the function primeFactors which counts the number of prime factors of its input, ie. prime numbers which the input is divisible by (so for example, if the input is prime then primeFactors should return 1)

primeFactors :: Int -> Int
primeFactors = undefined

--9) Define the function solveLinear which, given the parameters m and c, will return the solution of the linear equation mx + c = 0

solveLinear :: Double -> Double -> Double
solveLinear = undefined

--10) Define the function keepOnly which will keep only the first n elements in a list and throw away everything after that. If there are less than n elements in the list then the function should return all of them.

keepOnly :: Int -> [Int] -> [Int]
keepOnly = undefined

--11) Define the function intersperse which will merge two lists by alternating elements between them. If one of the lists runs out of elements first then just end with all of the elements of the other one.

intersperse :: [Int] -> [Int] -> [Int]
intersperse = undefined

--12) Define the function everySecond which will remove every other element of a list, starting with keeping the first element and removing the second.

everySecond :: [Int] -> [Int]
everySecond [] = []

--13) Define the function dotProduct which, given two lists, will return their vector dot product, ie. (the product of the first elements) + (the product of the second elements) + ... If the lists don't have the same length, truncate the longer one (or treat the shorter one as padded out with zeroes, which is mathematically equivalent)

dotProduct :: [Double] -> [Double] -> Double
dotProduct = undefined
