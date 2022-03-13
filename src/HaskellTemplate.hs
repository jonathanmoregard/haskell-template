{- |
Copyright: (c) 2022 jonathanmoregard
SPDX-License-Identifier: MIT
Maintainer: jonathanmoregard <jonathan.more@hotmail.com>

Haskell template project
-}

module HaskellTemplate
       ( someFunc
       ) where


someFunc :: IO ()
someFunc = putStrLn ("someFunc" :: String)
