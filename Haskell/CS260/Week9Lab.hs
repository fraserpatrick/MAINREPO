 
import Test.QuickCheck 
--instance Show(a->b) where 
 --  show f = "function"
 
 -- You may need to install QuickCheck before you can tackle these questions
 -- use the command  cabal install --lib QuickCheck   in terminal to install quickCheck

          
{-1a) Define quickCheck properties for the following functions. Note there will likely be many test cases for each function. You should not change any of the function defintions, try these functions out in terminal until you fully understand how they work.-}

keepEvens::[Int] -> [Int]
keepEvens [] = []
keepEvens (x:xs) | x `mod` 2 == 0 = x:keepEvens xs
                 | otherwise = keepEvens xs




remDups::String -> String
remDups [] = []
remDups [x] = [x]
remDups (x:y:xs) | x == y = y:remDups (xs)
                 | otherwise = x:y:remDups (xs)



addChar::Char -> String -> String
addChar c [] = [] 
addChar c (x:xs) | c == x = x:x:addChar c xs 
                 | otherwise = x:addChar c xs 
    


multiFun::[a] -> (a -> b) -> (a -> b) -> [b]
multiFun [] _ _ = []
multiFun (x:xs) f g | test `mod` 2 == 0 = (f x):multiFun xs g f
                    | otherwise = (g x):multiFun xs g f 
            where test = length xs 

{-1b) Define two quickCheck instances for filter. -}

{-1c) Using your testcases above write a short I/O function which allows the user to decide which tests to run, it should also allow the user to run all tests at once. It should terminate when the user enters "Done!" -} 

testHarness :: IO ()
testHarness = undefined

