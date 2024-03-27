{- -----------READ BEFORE ATTEMPTING -------------------------------------}

{-If the file you submit does not compile, your mark will be capped at 50%. You can test your code by using :l before submitting.

If you want to submit an answer for partial marks that you know doesn't compile, please comment it out.

Make sure to submit your solutions by 5:00pm, late submissions will not be marked unless a valid reason is given. 

While the test is open book all solutions must be entirely your own work. Any suspected plagiarism will be investigated in line with the university's academic dishonesty policy. 

You may define helper functions and use any function from the Haskell prelude and the given imported libraries. Here are the docs for the libraries you have available:

https://hackage.haskell.org/package/base-4.19.1.0/docs/Prelude.html
https://hackage.haskell.org/package/base-4.19.1.0/docs/Data-List.html
https://hackage.haskell.org/package/base-4.19.1.0/docs/System-IO.html
https://hackage.haskell.org/package/QuickCheck-2.14.3/docs/Test-QuickCheck.html

You may not import any other libraries, if you do then your mark will be capped at 50%. IMPORTANT: Please note that some tools, including Haskell Language Server, can automatically add imports. Double check your import list before submission!

Questions are not ordered by difficulty. 

In this test you will be developing a small database application. We have provided you with a csv file, Films.csv. There are 4 columns: (1) A unique identifier, an integer, (2) The name of the film with whitespace removed, (3) RottenTomatoes score, an integer between 0 and 100 (inclusive), and (4) whether or not the film contains ninjas. None of the questions will ask you to write to the CSV file, so you don't need to worry about corrupting it. Download this csv to complete the questions below. 
-}

module ClassTest where

{- You may use any function from the following 3 libraries, but no others.
You may also comment out any of these imports if you don't want to use them
(all questions can be solved using only functions in Prelude) -}
import Data.List
import System.IO
import Test.QuickCheck

-- Here is a datatype representing a row of the database:

data Row = Row Int String Int Bool
  deriving (Show, Eq)

-- Q1: Write a function that will check whether the given database (a list of Rows) is valid, ie. does not contain the same key twice, and only contains scores within the valid range. [2 marks]

databaseValid :: [Row] -> Bool
databaseValid = undefined

-- Here is a datatype representing all of the exceptions that might be encountered anywhere in the test. Several questions below have output types of the form Either Exception <something>, and for each one you should choose the appropriate exception to return in case of a failure.

data Exception = UIDAlreadyPresentException
               | UIDNotPresentException
               | TooManyOrNotEnoughNinjasException
               | CSVParseException
               | CommandParseException
  deriving (Show)

-- Q2: Write a function that will insert a row into the database, throwing an exception if the UID is already present. You may insert the new row anywhere in the current database if it is valid. [2 marks]

insert :: Row -> [Row] -> Either Exception [Row]
insert = undefined

-- Q3: Write a function that will delete a row with the given UID from the database, throwing an exception if the UID is not present. [2 marks]

delete :: Int -> [Row] -> Either Exception [Row]
delete = undefined

-- Q4: Write a function that will compute the pair of the average score of all the films that contain ninjas, and the average score of all the films that don't contain ninjas. If either of the averages is not mathematically well-defined, you should throw an exception. [4 marks]

averageScores :: [Row] -> Either Exception (Double, Double)
averageScores = undefined

-- Q5: Write a function that, given a string containing the raw contents of a CSV file, parses the contents of the Filsm.csv file into a list of rows, throwing an exception if the file is not correctly formed. You can assume the raw contents will be produced via the readFile function. [4 marks]

parseCSV :: String -> Either Exception [Row]
parseCSV = undefined

-- Here is a datatype representing a small language of boolean conditions about rows

data Condition = NameEquals String
               | ScoreGreaterThan Int
               | ScoreLessThan Int
               | HasNinjas
  deriving (Show)

-- Q6: Write a function that, given a condition and a row, checks whether the row satisfies the condition. [4 marks]

checkCondition :: Condition -> Row -> Bool
checkCondition = undefined

-- Q7: Write a function that, given a condition and a database, selects the rows of the database that satisfy the condition. [4 marks]

select :: Condition -> [Row] -> [Row]
select = undefined

-- Here is a datatype representing a simple command language of user inputs

data Command = Select Condition
             | Insert Row
             | Delete Int
             | Quit
  deriving (Show)

--Q8: Write a function that takes a list of commands and sequences them one after the other, carrying along the state of the database. If a Quit command is reached then the function should terminate and return the current state of the database. If one of the commands throws an exception then that exception should be returned. [5 marks]

interpretCommands :: [Command] -> [Row] -> Either Exception [Row]
interpretCommands = undefined

{- Q9: Write a function that will parse a raw string of user input into a command, or throw an exception if the user input is not correctly formed. The syntax of the user input is given by the following grammar:
  Command ::= Select [NameEquals s | ScoreGreaterThan n | ScoreLessThan n | ContainsNinjas] 
            | Insert n s n [Yes | No]
            | Delete n
            | Quit
where n means any integer (you may assume it is positive, ie. does not contain a leading '-' character) and s is any alphanumeric string (you may assume it does not contain any whitespace character). Examples of strings which should successfully parse are "Select ScoreGreaterThan 5" and "Insert 23 HouseOnHauntedHill 79 No"
[4 marks] -}

parseCommand :: String -> Either Exception Command
parseCommand = undefined

-- Q10: Write a function that is an exception handler that will "wrap" any given function from values to IO actions. If the input is an ordinary value then it should pass it to the function and perform the IO action, whereas if the input is an exception then it should print the string representation of the exception (the one that the show function generates) to the terminal. [4 marks]

handle :: (a -> b -> IO b) -> Either Exception a -> IO b
handle = undefined

-- Q11: Write a main function implementing a read-eval-print loop for the command language. On each loop it should print the prompt string "> " with no newline, and wait for user input. After receiving user input it should parse it and execute the command, catching and printing exceptions. If a quit command was received the function should terminate, otherwise the user should be prompted for input again. [5 marks]

main :: IO ()
main = undefined
