import System.Environment

main = do args <- getArgs
          putStrLn $ roman $ read $ head args

roman :: Int -> String
roman num | num==0 = ""
          | num/=0 = unwords (head (x num): [roman (num - ((read (unwords (tail (x num))))::Int))])
  where
    x num | num>=1000            = "M":["1000"]
          | num<1000 && num>=900 = "CM":["900"]
          | num<900 && num>=500  = "D":["500"]
          | num<500 && num>=400  = "CD":["400"]
          | num<400 && num>=100  = "C":["100"]
          | num<100 && num>=90   = "XC":["90"]
          | num<90 && num>=50    = "L":["50"]
          | num<50 && num>=40    = "XL":["40"]
          | num<40 && num>=10    = "X":["10"]
          | num==9               = "IX":["9"]
          | num<9 && num>=5      = "V":["5"]
          | num==4               = "IV":["4"]
          | num<4 && num>=1      = "I":["1"]
