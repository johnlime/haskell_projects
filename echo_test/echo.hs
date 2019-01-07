import System.Environment

main = do args <-getArgs
          putStrLn $ unwords args
          putStr $ (concat $ map sp args) ++ "\n"
