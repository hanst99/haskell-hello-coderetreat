module Main(main)
where

fibonaccis :: [Int]
fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

main :: IO ()
main = print (take 10 fibonaccis)
