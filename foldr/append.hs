main = print $ append [1, 2, 7] [8, 4, 3, 5]

{-
append [] ys = ys
append (x:xs) ys = x:(append xs ys)
-}

append xs ys = foldr (:) ys xs
