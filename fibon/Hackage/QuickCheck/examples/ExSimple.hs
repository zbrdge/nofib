{-# LANGUAGE ScopedTypeVariables #-}
module ExSimple where

--------------------------------------------------------------------------
-- imports

--import Debug.QuickCheck
import Test.QuickCheck

--------------------------------------------------------------------------
-- example 1

allEqual  x y z = x == y && y == z
allEqual' x y z = 2*x == y + z

prop_SimonThompson x y (z :: Int) =
  allEqual x y z == allEqual' x y z

--------------------------------------------------------------------------
-- example 2

prop_ReverseReverse (xs :: [Int]) =
  reverse (reverse xs) == xs

--------------------------------------------------------------------------
-- example 3

prop_Error (x::Int,y) =
  2*x <= 5*y
    
--------------------------------------------------------------------------
-- main

run args =
  do quickCheckWith args prop_SimonThompson
     quickCheckWith args prop_ReverseReverse

--------------------------------------------------------------------------
-- the end.
