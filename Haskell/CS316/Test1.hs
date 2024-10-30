{-# OPTIONS -fwarn-incomplete-patterns -fwarn-incomplete-uni-patterns #-}

module CS316Week06Test where

import Data.Foldable
import Data.List (intercalate, sort, nub)

{- This is the Week 06 Class Test for CS316 2024.

   The entire test is marked out of 50, and is worth 50% of your
   overall mark for the course.

   There are ten questions, each one is worth 5 marks. Partial credit
   is available for partially completed questions.

   Complete the questions by filling in the 'undefined' parts of each
   definition (in Question 2 you also have to write a datatype
   definition).

   Submit your answers to MyPlace by 12:00 noon on Thursday 31st
   October 2024.

   GENERAL ADVICE:

   1. Make sure that your file loads into GHCi and type checks. Make
      sure when you start, and regularly after that.

   2. Read the questions thoroughly, all the way to the end. The text
      and examples have been put there to help you.

   3. Test your definitions thoroughly, both with the test cases given
      and with your own tests.

   4. If you get stuck on a question and the file will not load into
      GHCi, then comment it out before moving on to the next one. You
      can comment out parts of the file by putting '{-' before and
      '-}' after or by putting '--' at the start of each line. Each
      question is independent, so you can comment out one question
      while working on another.


   PLAGIARISM WARNING: You must complete this test and write up your
   answers by yourself. If you struggle with the test, then you will
   have a second chance in Week 9. Plagiarism or the use of Generative
   AI (e.g. ChatGPT) will be taken very seriously and even small cases
   will be reported and recorded and may result in you getting 0 marks
   for this assessment. We reserve the right to ask you to come and
   explain the answers you give if we suspect academic dishonesty. -}

{------------------------------------------------------------------------}
{- QUESTION 1 : Data and Functions                                      -}
{------------------------------------------------------------------------}

{- The following type defines 'Vegetable' to be either 'Potato',
   'Carrot', 'Parsnip', or 'Beetroot'. The declaration has a 'deriving
   Show' which means that the Haskell compiler will generate a 'show'
   function for us that is used to print out values of type
   'Vegetable'. -}

data Vegetable
  = Potato
  | Carrot
  | Parsnip
  | Beetroot
  deriving Show

{- (a) Write a function that takes a 'Vegetable' and returns 'True' if
       it is a 'Parsnip' and 'False' otherwise. -}

isParsnip :: Vegetable -> Bool
isParsnip = \veg -> case veg of
    Parsnip -> True
    _ -> False

{- (b) Write an equality test for 'DogBreed's. This takes two dog
       breeds and returns 'True' if they are the same, and 'False'
       otherwise.

       WRITE THIS FUNCTION USING PATTERN MATCHING. DO NOT USE
       'deriving Eq'. -}

equalVegetable :: Vegetable -> Vegetable -> Bool
equalVegetable Potato Potato = True
equalVegetable Carrot Carrot = True
equalVegetable Parsnip Parsnip = True
equalVegetable Beetroot Beetroot = True
equalVegetable _ _ = False

{- (c) A 'Meal' consists of one 'Vegetable' and the number of kilos of
       that vegetable: -}

data Meal = MkMeal Vegetable Double
  deriving Show

{-     Write a function that returns the quantity of vegetable from a
       meal: -}

getQuantity :: Meal -> Double
getQuantity (MkMeal veg doub) = doub

{- (d) Government advice says that you should eat twice as many
       vegetables as you are already eating. Write a function that
       doubles the quantity of the vegetable in a 'Meal', and keeps
       the vegetable the same. -}

doubleQuantity :: Meal -> Meal
doubleQuantity (MkMeal veg doub) = (MkMeal veg (doub*2))

{------------------------------------------------------------------------}
{- QUESTION 2 : Defining a data type                                    -}
{------------------------------------------------------------------------}

{- For this question, you will define a data type with some functions
   that work on it.

   (a) Define a data type 'Hill' that has one constructor with three
       fields:

       - A 'String' for its name
       - A 'Double' for its height (in metres)
       - A 'Bool' which is 'True' if it has been climbed
-}

{- UNCOMMENT THIS DECLARATION -}

data Hill 
  = Hill String Double Bool
  deriving Show


{-  (b) Define three functions that return the name, height, and whether
        or not it has been climbed for a given 'Hill'.

        These are commented out to start with, waiting for you to
        complete the definition of the 'Hill' data type. -}

getName :: Hill -> String
getName (Hill name _ _) = name

getHeight :: Hill -> Double
getHeight (Hill _ height _) = height

hasBeenClimbed :: Hill -> Bool
hasBeenClimbed (Hill _ _ climbed) = climbed

{-  (c) The Strathclyde University Student Project for Enjoying Climbing
        Things (SUSPECT) requires a function that sets the 'climbed'
        field of a 'Hill' to 'True'. Implemented this: -}

setHasBeenClimbed :: Hill -> Hill
setHasBeenClimbed (Hill name height _) = (Hill name height True)

{------------------------------------------------------------------------}
{- QUESTION 3 : Timelines                                               -}
{------------------------------------------------------------------------}

{- Let's implement a simple timeline feature. We want to represent a
   sequence of snapshots though time with a point somewhere in the
   middle representing the current state. -}

data Timeline a = MkTimeline [a] a [a]
  deriving (Show, Eq)

{- The idea is that a 'Timeline a' value represents a position within a
   sequence of snapshots of some state, where:

      MkTimeline before now after

   stores this information as:

      - 'before' contains a list of things that are before the
        position *in reverse*.

      - 'now' is the current state.

      - 'after' contains a list of things after the position *in
        order*.

   For example,

      MkTimeline [3,2,1] 4 [5,6,7]

   Represents a timeline like this, with the position within the
   timeline represented using '{ }':

      1 , 2 , 3, {4}, 5, 6, 7

   The items going backwards (right to left) from the location of the
   current time are 3, then 2, then 1. The 'now' item is '4' and the
   items going forwards are 5, then 6, then 7.

   It may help you to visualise this problem by using the following
   function to convert a Timeline to a string: -}

showTimeline :: Show a => Timeline a -> String
showTimeline (MkTimeline before now after) =
    intercalate ", "
      (map show (reverse before) ++ ["{" ++ show now ++ "}"] ++ map show after)

{- (a) Implement, using pattern matching, a function that moves a
       Timeline one item to the left, moving 'now' to the 'after' and
       keeping all the items in order. If the position is at the start
       of the timeline, then it should return the timeline unchanged.

       For example,

         > backwards (MkTimeline [3,2,1] 4 [5,6,7])
         MkTimeline [2,1] 3 [4,5,6,7]
         > backwards (MkTimeline [] 1 [2,3,4,5,6])
         MkTimeline [] 1 [2,3,4,5,6]
-}

backwards :: Timeline a -> Timeline a
backwards (MkTimeline [] item back) = (MkTimeline [] item back)
backwards (MkTimeline (x:front) item back) = (MkTimeline front x (item:back))

{- (b) Implement 'forwards', which is similar 'backwards' but moves one
       item to the right. If it is already at the end, return the
       timeline unchanged.

       For example,

          > forwards (MkTimeline [3,2,1] 4 [5,6,7])
          MkTimeline [4,3,2,1] 5 [6,7]
          > forwards (MkTimeline [6,5,4,3,2,1] 7 [])
          MkTimeline [6,5,4,3,2,1] 7 []
-}

forwards :: Timeline a -> Timeline a
forwards (MkTimeline front item []) = (MkTimeline front item [])
forwards (MkTimeline front item (x:back)) = (MkTimeline (item:front) x back)

{- (c) Implement a function that updates the 'now' part using the
       provided function, moving the old 'now' to the 'before' part,
       and replacing the 'after' with the empty list.

       For example,

          > update (+1) (MkTimeline [3,2,1] 4 [5,6,7])
          MkTimeline [4,3,2,1] 5 []
          > update (*2) (MkTimeline [3,2,1] 4 [5,6,7])
          MkTimeline [4,3,2,1] 8 []
-}

update :: (a -> a) -> Timeline a -> Timeline a
update f (MkTimeline front item back) = (MkTimeline (item:front) (f(item)) [])

{------------------------------------------------------------------------}
{- QUESTION 4 : Choice Trees and Case expressions                       -}
{------------------------------------------------------------------------}

{- This question is about 'Choice Trees', like we saw in the Lecture in
   Week 2. The difference here is that we do not define the 'Choose'
   nodes in the choice trees to explicitly have two children. Instead,
   we represent choices as functions from a datatype with two elements.

   The 'Direction' type defined here has two elements: 'L' (for left)
   and 'R' (for Right). -}

data Direction = L | R deriving Show

{- Choice trees with branches that end in values of type 'a' are
   represented by the following type: -}

data Choice a
  = Success a
  | Failure
  | Choose (Direction -> Choice a)

{- In the 'Choose' case, we are using a function that accepts a
   'Direction' and gives us the consequence of that choice as a
   further choice tree. The following examples show different examples
   of choices trees with this representation: -}

example1 :: Choice Int
example1 = Choose (\d -> case d of
                           L -> Failure
                           R ->
                             Choose (\d -> case d of
                                             L -> Success 1
                                             R -> Failure))

example2 :: Choice Int
example2 = Choose (\d -> case d of
                           L -> Success 0
                           R ->
                             Choose (\d -> case d of
                                             L -> Success 1
                                             R -> Failure))

example3 :: Choice Int
example3 = Choose (\d -> case d of
                           L -> Failure
                           R ->
                             Choose (\d -> case d of
                                             L -> Success 1
                                             R -> Success 2))

{- (a) Define a function 'leftChoice' that returns the *left most* choice
       in a choice tree. This is the outcome that results from taking
       the 'L'eft choice every time a choice is required. If the
       outcome is 'Success x' for some 'x', then the result is 'Just
       x'. If the outcome is 'Failure', then the result is 'Nothing'.

       For example,

         > leftChoice example1
         Nothing
         > leftChoice example2
         Just 0
         > leftChoice example3
         Nothing
-}

leftChoice :: Choice a -> Maybe a
leftChoice Failure = Nothing
leftChoice (Success x) = Just x
leftChoice (Choose x) = leftChoice (x L)

{- (b) Define a function 'rightChoice' that returns the *right most*
       choice in a choice tree. This is the outcome that results from
       taking the 'R'ight choice every time a choice is required. If
       the outcome is 'Success x' for some 'x', then the result is
       'Just x'. If the outcome is 'Failure', then the result is
       'Nothing'.

       For example,

         > rightChoice example1
         Nothing
         > rightChoice example2
         Nothing
         > rightChoice example3
         Just 2
-}

rightChoice :: Choice a -> Maybe a
rightChoice Failure = Nothing
rightChoice (Success x) = Just x
rightChoice (Choose x) = rightChoice (x R)

{- (c) Define a function that swaps 'L' and 'R' in every choice in a
       choice tree. At each 'Choose', the choice of 'L' should do what
       'R' did in the old tree, and vice versa.

       It should be the case that for all choice trees 'c':

           leftChoice (mirror c) == rightChoice c

       and

           rightChoice (mirror x) == leftChoice c

       So, for example,

           > leftChoice (mirror example1)
           Nothing
           > rightChoice (mirror example1)
           Nothing
           > leftChoice (mirror example2)
           Nothing
           > rightChoice (mirror example2)
           Just 0
           > leftChoice (mirror example3)
           Just 2
           > rightChoice (mirror example3)
           Nothing
-}

mirror :: Choice a -> Choice a
mirror Failure = Failure
mirror (Success x) = (Success x)
mirror (Choose x) = Choose (\y -> 
  case y of
    L -> mirror (x R)
    R -> mirror (x L))

{- (d) Define a function that returns the first successful choice in a
       left-to-right direction. Specifically, at a 'Choose', if the
       'L' choice returns 'Nothing', then it should try the 'R'
       choice.

       For example,

           > firstChoice example1
           Just 1
           > firstChoice example2
           Just 0
           > firstChoice example3
           Just 1
           > firstChoice (mirror example3)
           Just 2
-}

firstChoice :: Choice a -> Maybe a
firstChoice Failure = Nothing
firstChoice (Success x) = Just x
firstChoice (Choose x)  = 
  case firstChoice (x L) of
    Just x  -> Just x
    Nothing -> firstChoice (x R)

{------------------------------------------------------------------------}
{- QUESTION 5 : Using 'map' and 'filter'                                -}
{------------------------------------------------------------------------}

{- The following two definitions define two small databases of
   hills. They consist of a list of triples, where the first element
   is the name, the second is the country and the third is the height
   (in metres). -}

database :: [(String,String,Int)]
database = [ ("Glennamong", "I", 628),
             ("Mullaghaneany [Mullach an Ionaidh]", "I", 627),
             ("Nephin Beg [Neifinn Bheag]", "I", 627),
             ("Shanlieve [Seanshliabh]", "I", 627),
             ("Knocknamanagh NE Top [Gullaba Hill]", "I", 625),
             ("Meall nan Tri Tighearnan", "S", 892),
             ("Meall Odhar", "S", 890),
             ("Beinn Eunaich East Top", "S", 880),
             ("Meall Tarsuinn", "S", 877),
             ("Aonach Mor", "S", 867)
           ]

{- (a) Write a function that takes a country code ("I" or "S" here) and
       returns the names and heights of all the hills in that country
       in a given database.

       For example,

         > hillsIn "I" database
         [("Glennamong",628),("Mullaghaneany [Mullach an Ionaidh]",627),("Nephin Beg [Neifinn Bheag]",627),("Shanlieve [Seanshliabh]",627),("Knocknamanagh NE Top [Gullaba Hill]",625)]
         > hillsIn "S" database
         [("Meall nan Tri Tighearnan",892),("Meall Odhar",890),("Beinn Eunaich East Top",880),("Meall Tarsuinn",877),("Aonach Mor",867)]
         > hillsIn "E" database
         []

       WRITE YOUR FUNCTION using 'map' and 'filter'.
-}

hillsIn :: String -> [(String,String,Int)] -> [(String,Int)]
hillsIn search xs = map (\(name, _, height) -> (name, height)) (filter (\(_, code, _) -> code == search) xs)

{- (b) Write a function that returns the number of hills over 800 metres
       in a given database.

       For example,

         > numHillsOver800m database
         5

       WRITE YOUR FUNCTION using 'length' and 'filter'.
-}

numHillsOver800m :: [(String,String,Int)] -> Int
numHillsOver800m xs = length ((filter (\(_, _, height) -> height >= 800) xs))

{------------------------------------------------------------------------}
{- QUESTION 6 : Validators                                              -}
{------------------------------------------------------------------------}

{- The following data type represents the result of a test to see
   whether or not some validation checks on some input have
   passed. Either the input is 'Ok', or there is an 'Error msg' with
   the String 'msg' explaining the error. -}

data Result
  = OK
  | Error String
  deriving Show

{- We can define a kind of 'and' for 'Result' values as follows. It
   takes two 'Result' values and returns 'OK' if both of them are
   'OK'. Otherwise, it returns 'Error' with the messages (combined if
   necessary).

   Here is the definition of 'andResult': -}
andResult :: Result -> Result -> Result
andResult OK         OK         = OK
andResult OK         (Error e)  = Error e
andResult (Error e)  OK         = Error e
andResult (Error e1) (Error e2) = Error (e1 ++ ", " ++ e2)

{- (a) Define a function 'orResult' that acts like 'andResult' but
       returns 'OK' if at least one of the inputs is 'OK': -}

orResult :: Result -> Result -> Result
orResult _ OK = OK
orResult OK _ = OK
orResult (Error e1) (Error e2) = Error (e1 ++ ", " ++ e2)

{- A 'Validator' of things of type 'a' is a function that accepts values
   of type 'a' and returns 'Results'. It returns 'OK' if the input is
   valid, and 'Error' with a message if not. -}

type Validator a = a -> Result

{- The function 'validate' uses a validator 'v' on a value 'a' by
   applying 'v' to 'a'. This works because validators are functions: -}

validate :: Validator a -> a -> Result
validate v a = v a

{- The simplest validator is the one that always says 'OK', whatever the
   input is: -}

ok :: Validator a
ok _ = OK

{- The 'notOK' validator always returns an 'Error' for any input. The
   actual error message is the 'why' input to 'notOK'. -}

notOK :: String -> Validator a
notOK why _ = Error why

{- A more interesting validator is one that checks that 'Int's are
   greater than some number.

   For example,

      > validate (greaterThan 10) 15
      OK
      > validate (greaterThan 10) 5
      Error "5 is not greater than 10"
-}

greaterThan :: Int -> Validator Int
greaterThan x y =
  if y > x then OK else Error (show y ++ " is not greater than " ++ show x)

{- A similar one is 'lessThan': -}

lessThan :: Int -> Validator Int
lessThan x y =
  if y < x then OK else Error (show y ++ " is not less than " ++ show x)

{- (b) Implement a function that takes a 'Validator' of 'b's and a
       function from 'a's to 'b's and returns a validator of
       'a's. This function is called 'on' because we can use it infix,
       like so:

          > validate (greaterThan 4 `on` length) []
          Error "0 is not greater than 4"
          > validate (greaterThan 4 `on` length) [1,2,3,4,5]
          OK
-}

on :: Validator b -> (a -> b) -> Validator a
on validator func = (\x -> validate validator (func x))

{- (c) Implement `andValidator` and `orValidator` which take two
       validators and return a validator which runs both of the
       validators on the same input and combines the result. For
       `andValidator` the results are combined using `andResult`. For
       `orValidator` the results are combined using `orResult`.

       For example,

          > andValidator (greaterThan 10) (lessThan 20) 15
          OK
          > andValidator (greaterThan 10) (lessThan 20) 25
          Error "25 is not less than 20"

       and

          > orValidator (greaterThan 10) (lessThan 20) 15
          OK
          > orValidator (greaterThan 10) (lessThan 20) 25
          OK
          > orValidator (greaterThan 10) (lessThan 5) 7
          Error "7 is not greater than 10, 7 is not less than 5"
-}

andValidator :: Validator a -> Validator a -> Validator a
andValidator = undefined

orValidator :: Validator a -> Validator a -> Validator a
orValidator = undefined

{------------------------------------------------------------------------}
{- QUESTION 7 : Pictures                                                -}
{------------------------------------------------------------------------}

{- The following type represents pictures with pixels of type 'a' as
   functions from (x,y) coordinates to pixel values. -}

type Picture a = (Double, Double) -> a

{- For example, values of type 'Picture Bool' can be thought of as black
   and white pictures (with 'True' as black and 'False' as white), or
   masks ('True' as masked, and 'False' as transparent).

   Values of type 'Picture Int' can be thought of as greyscale
   pictures where the 'Int' pixels values are between '0' and '100' --
   from black to white.

   With this interpretation, 'grey' is the picture that is 50%
   black/white everywhere: -}

grey :: Picture Int
grey point = 50

{- A more interesting picture is one that is 'True' for pixels within a
   square of height and width 50 around the origin, and 'False'
   otherwise: -}

square50 :: Picture Bool
square50 (x,y) = withinX && withinY
  where withinX = x >= -25 && x <= 25
        withinY = y >= -25 && y <= 25

{- (a) Write a function 'everywhere' that takes a pixel value of type
       'a' and returns a picture that is that value everywhere.

       For example,

          > everywhere True (0,0)
          True
          > everywhere False (-10,40)
          False
          > everywhere True (4.234,9.963)
          True

       The numbers in these test cases do not matter -- the point is
       that 'everywhere x' should return 'x' for every point. -}

everywhere :: a -> Picture a
everywhere = undefined

{- (b) Write a function 'circle' that takes a radius 'r' and returns a
       picture that is 'True' for points within distance 'r' of (0,0)
       and 'False' otherwise.

       HINT: you can measure the distance of a point (x,y) from the
       origin using the formula 'sqrt (x*x + y*y)'. -}

circle :: Double -> Picture Bool
circle = undefined

{- (c) Write a function that takes a function from 'a's to 'b's and a
       picture of 'a's and returns a picture of 'b's. If the function
       is called 'f' and the original picture is called 'p', then for
       every point (x,y), the new picture has the value 'f v' where
       'p' had the value 'v' at (x,y). -}

mapPicture :: (a -> b) -> Picture a -> Picture b
mapPicture = undefined

{- (d) Write a function that merges two pictures according to another
       picture of booleans, using the following recipe:

       at every point (x,y),
         if the picture of booleans is true at (x,y) then
           take the value of the first picture at (x,y)
         else
           take the value of the second picture at (x,y)
-}

merge :: Picture Bool -> Picture a -> Picture a -> Picture a
merge = undefined

{------------------------------------------------------------------------}
{- QUESTION 8 : Folding Documents                                       -}
{------------------------------------------------------------------------}

{- The following data type represents documents where the leaf nodes are
   of some arbitrary type 'a': -}

data Document a
  = Node a
  | Bold (Document a)
  | Concat (Document a) (Document a)
  deriving (Show, Eq)

{- (a) Implement a 'foldDocument' function for this type, following the
       recipe described for 'Tree's in Week04.

       For example, this use counts the number of 'Bold's in a
       document:

         > foldDocument (\a -> 0) (\x -> x + 1) (+) (Concat (Bold (Node "a")) (Bold (Node "b")))
         2
-}

foldDocument :: (a -> result)                    -- what to do for Node
             -> (result -> result)               -- what to do for Bold
             -> (result -> result -> result)     -- what to do for Concat
             -> Document a -> result
foldDocument = undefined

{- (b) Implemented 'flattenDocument' using 'foldDocument', which returns
       a list of all the values at the 'Node's in a document, in left
       to right order.

       For example,

          > flattenDocument (Concat (Bold (Node "a")) (Bold (Node "b")))
          ["a","b"]

       REMEMBER TO USE 'foldDocument'. -}

flattenDocument :: Document a -> [a]
flattenDocument = undefined

{------------------------------------------------------------------------}
{- QUESTION 9 : Eq and Show                                             -}
{------------------------------------------------------------------------}

{- The following data type represents an (unordered) set by storing its
   elements in a list. -}

newtype DoubleSet = MkSet [Double]

{- Sets are like lists, except that the order and how many times an
   element is present do not matter.

   Therefore, two lists 'xs' and 'ys' represent the same set if every
   element in 'xs' is in 'ys', and vice versa. The following function
   "canonicalises" a list by removing all duplicates (computing the
   "nub") and sorting it (so the original order doesn't matter). -}

canonicalise :: [Double] -> [Double]
canonicalise xs = sort (nub xs)

{- (a) Use 'canonicalise' to implement an instance of the 'Eq' type
       class for 'DoubleSet', which treats two 'DoubleSet's as equal
       if represent the same set.

       For example,

         > MkSet [1,1,2,0] == MkSet [0,1,2]
         True
         > MkSet [1,1,2,3] == MkSet [0,1,2]
         False
-}

instance Eq DoubleSet where
  MkSet x == MkSet y = undefined

{- (b) Use 'canonicalise' to implement a Show instance for 'DoubleSet'
       that prints an 'DoubleSet' in canonical form.

       For example,

          > show (MkSet [1,1,2,0,3.5])
          "[0,1,2,3.5]"
-}

instance Show DoubleSet where
  show (MkSet x) = undefined

{- HINT: use 'map show' to show all the elements in the canonicalised
   version, and then 'intercalate "," to put commas between them. -}


{------------------------------------------------------------------------}
{- QUESTION 10 : Semigroup, Monoid, and Foldable                        -}
{------------------------------------------------------------------------}

{- In this question, we will see how to use monoids and Foldable to
   compute the minimum value stored in a container.

   Containers may be empty, so we have to make sure that we have a
   special value that means "the minimum of no things". We do this by
   defining a data type that adds a "positive infinity" to any type: -}

data MinResult a
  = Finite a
  | PosInfinity
  deriving (Eq, Show)

{- For example,

      Finite 5 :: MinResult Int

   would be a normal ("finite") maxmimum of the list [3,2,-2,5,1]. But

      PosInfinity :: MinResult Int

   is a special value representing the minimum of no things.

   Positive infinity makes sense because when we take the minimum of
   two things, positive infinity is always the greater.

   If we assume that the 'a' type is ordered, then we can define a
   Semigroup instance for 'MinResult a' using the 'min' function.

   (a) Implement this: -}

instance Ord a => Semigroup (MinResult a) where
  _ <> _ = undefined

{-     For example,

          > Finite 4 <> Finite 3
          Finite 3
          > PosInfinity <> Finite 2
          Finite 2
          > Finite 2 <> PosInfinity
          Finite 2
          > Finite 100000 <> PosInfinity
          Finite 100000
          > PosInfinity <> PosInfinity
          PosInfinity
-}

{- (b) Complete this 'Semigroup' to be a 'Monoid' by giving the
       identity element: -}

instance Ord a => Monoid (MinResult a) where
  mempty = undefined

{- (c) Implement a generic 'findMinimum' function using 'fmap', 'fold'
       and the 'MinResult' type. -}

findMinimum :: (Foldable c, Functor c, Ord a) => c a -> MinResult a
findMinimum = undefined


{-     For example,

          > findMinimum []
          PosInfinity
          > findMinimum [5,4,3,10,1]
          Finite 1
          > findMinimum Nothing
          PosInfinity
          > findMinimum (Just 4)
          Finite 4
-}
