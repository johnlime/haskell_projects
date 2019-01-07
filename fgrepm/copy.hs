import System.Environment
import Data.List

main = do args <- getArgs
          cs <- getContents
          putStr $ head $ tails $ unwords args


