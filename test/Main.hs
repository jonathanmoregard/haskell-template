module Main (main) where

import qualified Spec
import qualified Test.Hspec.Runner as Runner

main :: IO ()
main = Runner.hspecWith Runner.defaultConfig Spec.spec
