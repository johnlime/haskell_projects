import System.Environment
import Data.List

main = do args <- getArgs
          cs <- getContents
          putStr $ fgrepi (head args) cs

fgrepi pattern cs = unlines $ filter match $ lines cs
  where
    match line = any prefixp (tails line)
    prefixp line = isPrefixOf pattern $ map lower line

lower :: Char -> Char
lower 'A' = 'a'
lower 'B' = 'b'
lower 'C' = 'c'
