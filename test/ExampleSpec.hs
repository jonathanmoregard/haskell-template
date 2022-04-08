module ExampleSpec (spec) where

import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec = describe "dummy test suite" $ it "equals" $ (1 :: Double) `shouldBe` 1
