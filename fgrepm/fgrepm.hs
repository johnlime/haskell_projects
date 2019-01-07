import System.Environment
import Data.List

main = do args <- getArgs
          cs <- getContents
          putStr $ fgrepm args cs

fgrepm :: [String] -> String -> String
fgrepm ps cs = unlines $ filter matchAll $ lines cs
  where
    matchAll :: String -> Bool
    matchAll line = all match ps
      where
        match :: String -> Bool
        match psi = any prefixp $ tails line
          where
            prefixp :: String -> Bool
            prefixp linei = psi `isPrefixOf` linei
