import System.Environment

main =
  do args <- getArgs
     print $ days (read $ args !! 0) (read $ args !! 1) (read $ args !! 2)

leap :: Int -> Bool
leap y = if (y`mod`4==0) && ((y`mod`100/=0) || (y`mod`400==0)) then True
                                                               else False

yearDay year = if leap year then 366 else 365

monthDay :: Int -> Int -> Int
monthDay year month | elem month [1, 3, 5, 7, 8, 10, 12] = 31
                    | elem month [4, 6, 9, 11] = 30
                    | month == 2 = case (leap year) of
                                     True -> 29
                                     False -> 28

days :: Int -> Int -> Int -> Int
days year month day = sum (map yearDay [1..(year-1)]) + sum (map monthDay2 [1..(month-1)]) + day
  where
    monthDay2 :: Int -> Int
    monthDay2 m = monthDay year m
