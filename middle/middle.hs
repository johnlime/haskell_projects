main = do cs <- getContents
          putStr $takeNLines 10 cs

takeNLines n cs = (unlines $ reverse $ take (divIntTwo n) $ reverse $ take (index_half cs) $lines cs)
                  ++ (unlines $ take (divIntTwo 10) $reverse $take (index_half cs) $reverse $lines cs)
index_half cs = divIntTwo $ length $ lines cs
divIntTwo n = n `div` 2
