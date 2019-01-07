main = print $ take 20 $ filter istwin $ map pair [1..]

pair :: Int -> (Int, Int)
pair i = (i, i+2)

isprime :: Int -> Bool
isprime n = n==(head_wo_one (filter divisible [1..n]))
  where
    divisible :: Int -> Bool
    divisible m = n`mod`m==0

    head_wo_one :: [Int] -> Int
    head_wo_one x = if (x==[1]) then 0
                                else head $ tail x

istwin :: (Int, Int) -> Bool
istwin (x, y) = true_true_only (isprime x) (isprime y)
  where
    true_true_only :: Bool -> Bool -> Bool
    true_true_only True True = True
    true_true_only True False = False
    true_true_only False True = False
    true_true_only False False = False
