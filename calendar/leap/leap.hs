import System.Environment

main = do args <- getArgs
          print $ leap $ read $ head args

leap :: Int -> Bool
leap y = if (y`mod`4==0) && ((y`mod`100/=0) || (y`mod`400==0)) then True
                                                               else False
