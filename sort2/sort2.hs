import System.Environment

main = do args <- getArgs
          print $ mysort $ map read args

mysort cs = foldr (\x y -> (myinsert x y)) [] cs

myinsert x y = foldl (\a b -> if (head (reverse a))>b then (tail (reverse a))++[b]++[head a] else a++[b]) [x] y
