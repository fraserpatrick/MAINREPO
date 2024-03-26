{-Types-}

--1) Using the following definition of Nat, plus and mult define
-- i) expo, the exponential of a given natural number to the power of another given number 
--ii) The factorial for Nat
--iii absNat which converts an integer value to the absolute value expressed by Nat

data Nat = Succ Nat | Zero
   deriving Show

myadd:: Nat -> Nat -> Nat
myadd (Zero) x = x
myadd (Succ x) y = Succ (myadd x y)

mymult :: Nat -> Nat -> Nat
mymult Zero    n = Zero
mymult (Succ m) n = myadd n (mymult m n)


expo::Nat -> Nat -> Nat 
expo = undefined

fact::Nat -> Nat
fact = undefined 

absNat::Int -> Nat
absNat = undefined

--2a) Define a type Day an element of which is one of the days Monday - Sunday. Equip this type with an instance of Eq, Show and Ord.


--2b) For the day type define a function workDay which returns True if a day is a workday.

-- workDay::Day -> Bool , uncomment once you have defined Day, until then you will have an error
workDay = undefined 

--2c) Define nextDay which, for an element of the Day type returns the next day.

--nextDay::Day -> Day
nextDay = Undefined

--3) Consider the following type Calc. This type is parametarised by an abstratct type a but is intended for use with numeric types. 
data Calc a = Add (Calc a) (Calc a) | Mult (Calc a) (Calc a) | Div (Calc a) (Calc a) | Sub (Calc a) (Calc a) | Val a
   deriving Show

--3a) Using this type define apply with takes a value of type Calc Int and returns the Int resulting from the calculation

apply::Calc Int -> Int
apply = undefined

--3b) Define factorial:: Calc Int -> Calc Int which takes a value of the shape (Val n) returning the factorial of that value. You must use the Calc type (Val (factorial n) doesn't count!).

factorial::Calc Int -> Calc Int
factorial = undefined


--4a) Define the type MkCom which is paramterarised by an abstract type. MkCom represents a list which may contain null values. The type should contain Elem which holds an element of type a, Null which is an empty value and Empty which is the emd of the list.



--4b) Define flatten which removes all null elements from a list of type MkCom

--flatten:: MkCom a -> MkCom a
flatten = undefined

--4c) Define convert which converts a list of type MkCom a to [a], you may discard null values.

--convert::MkCom a -> [a]
convert = undefined
