main = do cs <- getContents
          csarray <- lines cs
          takenarray <- take 10 csarray
          firstNLines <- unlines takenarray
          putStr firstNLines
          --putStr $ unlines $ take 10 $ lines cs
