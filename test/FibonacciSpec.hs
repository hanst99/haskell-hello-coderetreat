module FibonacciSpec
where


import Test.Hspec
import Test.QuickCheck
import Fibonacci

shouldContainInAnyOrder :: (Eq a, Show a) => [a] -> [a] -> Expectation
shouldContainInAnyOrder xs ys = xs `shouldSatisfy` (flip all ys . flip elem)

spec :: Spec
spec = do
  describe "Fibonacci.fibonaccis" $ do
    it "should not be empty" $ do
      fibonaccis `shouldSatisfy` (not . null)
    it "should start with 0" $ do
      head fibonaccis `shouldBe` 0
    it "should contain 3, 8, 34 in the first 10 elements" $ do
      take 10 fibonaccis `shouldContainInAnyOrder` [8,5,34]
    it "should satisfy the definition fib(n) = fib(n-1) + fib(n-2)" $
      property $ \n -> n >= 2 ==> fibonaccis !! n == fibonaccis !! (n-1) + fibonaccis !! (n-2)
