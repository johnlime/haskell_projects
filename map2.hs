main = print $ map2  (\x -> x*x) [1..10]
{-
map2 f [] = []
map2 f (x:xs) = (f x):(map2 f xs)
-}

map2 f xs = foldr (\x ys -> (f x):ys) [] xs
