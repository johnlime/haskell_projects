import System.Environment

main = do args <- getArgs
          let year = read $ args !! 0
          let month = read $ args !! 1
          let day = read $ args !! 2
          putStrLn $ yearStr year month (day + 10)
          putStrLn $ yearStr year month (day + 100)
          putStrLn $ yearStr year month (day + 1000)
          putStrLn $ yearStr year month (day + 10000)

yearStr :: Int -> Int -> Int -> String
yearStr year month day = show ((fullDate year month day) !! 0) ++ "/" ++ show ((fullDate year month day) !! 1) ++ "/" ++ show ((fullDate year month day) !! 2)
  where
    fullDate :: Int -> Int -> Int -> [Int]
    fullDate y m d = years $ days y m d

--閏年の判別
leap :: Int -> Bool
leap y = if (y`mod`4==0) && ((y`mod`100/=0) || (y`mod`400==0)) then True
                                                               else False

--一年の日数
yearDay year = if leap year then 366 else 365

--一月一日からの日数の計算
days :: Int -> Int -> Int -> Int
days year month day = sum (map yearDay [1..(year-1)]) + sum (map monthDay2 [1..(month-1)]) + day
  where
    --その月までの日数
    monthDay2 :: Int -> Int
    monthDay2 m = monthDay year m
      where
        --一ヶ月の日数
        monthDay :: Int -> Int -> Int
        monthDay year month | elem month [1, 3, 5, 7, 8, 10, 12] = 31
                            | elem month [4, 6, 9, 11] = 30
                            | month == 2 = case (leap year) of
                                             True -> 29
                                             False -> 28

--日数から年月日を求める
years :: Int -> [Int]
years total_day = (tyear 1) : (tmonth 1) : (total_day - sum (map yearDay [1..(tyear 1-1)]) - sum (map monthDay2 [1..((tmonth 1)-1)])) : []
  where
    tyear n | total_day < sum (map yearDay [1..n]) = n
            | total_day >= sum (map yearDay [1..n]) = tyear (n+1)
    tmonth n | total_day - sum (map yearDay [1..((tyear 1)-1)]) < sum (map monthDay2 [1..n]) = n
             | total_day - sum (map yearDay [1..((tyear 1)-1)]) >= sum (map monthDay2 [1..n]) = tmonth (n+1)

    --その月までの日数
    monthDay2 :: Int -> Int
    monthDay2 m = monthDay (tyear 1) m
      where
        --一ヶ月の日数
        monthDay :: Int -> Int -> Int
        monthDay year month | elem month [1, 3, 5, 7, 8, 10, 12] = 31
                            | elem month [4, 6, 9, 11] = 30
                            | month == 2 = case (leap year) of
                                             True -> 29
                                             False -> 28
