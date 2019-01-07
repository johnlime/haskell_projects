import System.Environment

main = do args <- getArgs
          cs <- getContents
          putStr $ numbering (map read args) cs

numbering :: [Int] -> String -> String
numbering ls cs = unlines $ map format $ filter (selectLine ls) $ zipLineNumber $ lines cs

zipLineNumber :: [String] -> [(Int, String)]
zipLineNumber xs = zip [1..] xs

selectLine :: [Int] -> (Int, String) -> Bool
selectLine ls (n, line) = n `elem` ls

format :: (Int, String) -> String
format (n, line) = rjust 4 (show n ) ++ " " ++ line

rjust :: Int -> String -> String
rjust width s = replicate (width - length s) '0' ++ s
