module B (b,c) where

import A (a)

-- | b doc, check out 'a' or 'c'
--
--
b :: IO ()
b = putStrLn "someFunc"

c :: IO ()
c = putStrLn ":)"
