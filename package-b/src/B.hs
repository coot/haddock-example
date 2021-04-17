module B (someFunctionB,someFunctionC) where

import A (someFunctionA)

-- | 'someFunctionB' doc, check out 'someFunctionA' or 'someFunctionC'
--
--
someFunctionB :: IO ()
someFunctionB = putStrLn "someFunc"

someFunctionC :: IO ()
someFunctionC = putStrLn ":)"
