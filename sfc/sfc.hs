main = do cs <- getContents
          putStr $ iLoveSFC cs

iLoveSFC :: String -> String
iLoveSFC cs = concatMap reeducation cs

reeducation :: Char -> String
reeducation c = if c=='S' 
                  then "Shonan " 
                  else if c=='F'
                         then "Fujisawa "
                         else if c=='C'
                                then "Campus "
                                else [c]
