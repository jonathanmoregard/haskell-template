module Main (main) where

import qualified Gauge.Main as Gauge

main :: IO ()
main = Gauge.defaultMain [Gauge.bench "const" (Gauge.whnf const "a")]
