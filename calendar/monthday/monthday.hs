import System.Environment

main = do args <- getArgs
          print $ monthDay (read $ args !! 0) (read $ args !! 1)

monthDay :: Int -> Int -> Int
monthDay y m | elem m [1, 3, 5, 7, 8, 10, 12] = 31
             | elem m [4, 6, 9, 11] = 30
             | m == 2 = case (leap y) of
                          True -> 29
                          False -> 28
  where
    leap :: Int -> Bool
    leap y = if (y`mod`4==0) && ((y`mod`100/=0) || (y`mod`400==0)) then True
                                                               else False
