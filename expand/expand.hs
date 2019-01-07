main = do cs <- getContents
          putStr $ concat $ map expandTab cs

expandTab :: Char -> String
expandTab c= if c=='\t' then "        " else [c]
