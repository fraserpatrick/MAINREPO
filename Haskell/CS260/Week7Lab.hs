{-1) Define MaybeSoMaybeNo which which compares the element held within a maybe type to an element of the parameter type. Returning True if they are the same and False otherwise.  -}

maybeSoMaybeNo:: Eq a => Maybe a -> a -> Bool
maybeSoMaybeNo = undefined 

{-2a) Define may2bool which takes a list of Maybe values and converts them to a list of Booleans. Your function should map Nothing to False and any Just values holding a value greater than a given value y to True.-}

may2bool::[Maybe Int] -> Int -> [Bool]
may2bool = undefined

{-2b) Convert may2bool to a higher order function which takes a function of type a -> Bool, returning True when a just element returns True for that value and False otherwise.-}

highMay::(a -> Bool) -> [Maybe a] -> [Bool]  
highMay = undefined

{-3) Consider the following functions-}

mairzeyDotes::Int -> Maybe Int
mairzeyDotes x | x < 0     = Nothing
            | otherwise = Just x 

andDozyDotes:: Int -> Maybe Int 
andDozyDotes x | x >20     = Nothing
               | otherwise = Just x 
   
liddlLamzy::Int ->Maybe Int
liddlLamzy x | x < 10    = Nothing
             | otherwise = Just x 

divey::Int -> Maybe Int  
divey x | x > 15    = Nothing
        | otherwise = Just x

{-When composed they whittle down the value of an integer, returning Just x when  10 <= x <= 15 and Nothing otherwise. Using do notation compose the four functions together-}

wouldntYou = undefined

{-3a) The Either type is similar to the Maybe type in that it can be used to handle errors. Either can present issues in that functions may not expect the Left element, only the correct or Right element. Define eitherOr which defaults to the Left type if a divide by zero error occurs. You should return an error string in the case of a failed calculation.-}

eitherOr:: Int -> Int -> Either String Int 
eitherOr = undefined

{-3b) Define combineEither which takes two Either values and combines element if they are both Left Elements. -}

combineEither::Either a b -> Either a b ->  Maybe (a,a)
combineEither = undefined

{-3c) Define Combine both which combines two left  or two right values returning as Either Maybe (a,a) Maybe (b,b). Nothing values should default to the left constructor.-}

combineBoth::Either a b -> Either a b -> Either (Maybe (a,a)) (Maybe (b,b))
combineBoth = undefined

{-4) Maybe can also be used to represent failure should a lookup function not find any matching values. Consider the two following lists. -}

staff::[(String, Int,[String])]
staff = [("Joe Bloggs",9, ["CS501","CS123","CS312"]),("Sarah Smith",7,["MM101","MM409"]),("Mark Markson",6,[]),("Ada Lovelace",10,["CS908","CS880"]),("Joe Johnson",8,["EC209"])]

grades::[(Int,Int)]
grades = [(1,1000),(2,2500),(3,4000),(4,5500),(5,7000),(6,8500),(7,10000),(8,11500),(9,13000),(10,14500)]

{-a) Define getGrade which takes astring and tries to find the corresponding member staffs salary, this function can fail.-}

getGrade::String -> [(String,Int,[String])] -> Maybe Int
getGrade = undefined

{-b) Define getSal which tries to find the corresponding salary for a given grade-}

getSal:: Int -> [(Int,Int)] -> Maybe Int 
getSal = undefined

{-c) Define name2Sal which combines parts a and b using do notation to try and return a salary.-}

name2Sal::String -> [(String,Int,[String])] -> [(Int,Int)] -> Maybe Int 
name2Sal = undefined

