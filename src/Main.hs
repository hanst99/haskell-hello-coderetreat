{-# LANGUAGE TemplateHaskell #-}
-- ^ enable the TemplateHaskell language extension for QuickChecks automatic
--   test discovery

module Main(main)
where

import Test.QuickCheck


fibonaccis :: [Int]
fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

-- quick check tests are functions of any arity that return Property
-- The arguments to the functions need to be instances of the arbitrary
-- class, which is defined for many common types
prop_fibonaccis_are_formed_by_adding_two_previous_numbers :: Int -> Property
prop_fibonaccis_are_formed_by_adding_two_previous_numbers n =
  n >= 2 ==> fibonaccis !! n == fibonaccis !! (n-1) + fibonaccis !! (n-2)



main :: IO ()
main = print (take 10 fibonaccis)

-- don't think too hard about this construct... the return [] is working around
-- a limitation/bug in template haskell; Read QuickCheck documentation for details
return []
runTests = $quickCheckAll -- discover all tests
