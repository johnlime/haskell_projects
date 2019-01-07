main = print $ reverse2 [1..10]

{-
reverse2 [] = []
reverse2 (x:xs) = reverse xs ++ [x]
-}

reverse2 = foldr (\x ys -> ys ++[x]) []
