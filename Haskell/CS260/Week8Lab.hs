import Data.Char 

instance Show(a->b) where 
    show f = "function"

getInt = do x <- getLine
            return (read x::Int) -- basic function for casting string to int, will fail if no parse exists 

{-1) Define helloWorld, an IO function which prints "hello world" to the terminal. (It's only taken us 9 weeks!) -}

helloWorld = undefined

{-2a) Define sumInts which takes in a series of values from the user and returns their sum. Your code should terminate and return the sum when a user supplies a value of 0.-}

sumInts =undefined
         
          
{-2b) Redefine sumInts as sumInts2 which takes a list of integers as input returning their sum. -}

getInts = undefined

{-2c) Define ioToUpper which takes a string from the user and returns the string converted to upper case. Note that the Char module has been imported, you can use the toUpper function to convert characters to upper case.-}

ioToUpper = undefined

{-2d) Using ioToUpper and sumInts define chooseFunc which lets users decide which of the two functions they would like to carry out. You should base the choice on a string supplied by the user.-}

chooseFunc = undefined
                                           


{-3) Below is the List type. Give an instance of the Functor typeclass.-} 

data List a = Cons a (List a) | Empty 
  deriving Show 




{-4) Consider the following type.-}

data MkOdd a = Con1 (MkOdd a) | Con2 a (MkOdd a)  | Con3 (a,a) (MkOdd a) | Done a 
 deriving Show 

--Give a functor instance for this type 


--As this type holds tuple values it's a little bit tricky, but not impossible, to define a foldable instance. Assuming both elements of the tuple type should be folded over give an instance of foldable for MkOdd

