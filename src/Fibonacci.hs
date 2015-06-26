module Fibonacci
where

fibonaccis :: [Int]
fibonaccis = 0 : 1 : zipWith (+) fibonaccis (tail fibonaccis)
