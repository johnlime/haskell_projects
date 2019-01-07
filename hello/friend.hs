main = do putStrLn "Input a name?"
          name <- getLine
          putStrLn "Input another name?"
          name2 <- getLine
          putStrLn (name ++ " and " ++ name2 ++ " are friends.")

