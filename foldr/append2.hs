main = print $ append [8, 4, 3, 5] 2

append xs ys = foldr (\x y -> x:y) ys xs
