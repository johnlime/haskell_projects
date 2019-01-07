main = do print $ maybeConv $ div2 8
         -- putStr $ div8 cs

maybeConv::(ToChar a) => Maybe Int -> Char
maybeConv Nothing = ' '
maybeConv Just a = toChar a

div2::Int -> Maybe Int
div2 x = if even x then Just (x `div` 2)
                   else Nothing
{-
div8::Int -> Maybe Int
div8 x = div2 $ div2 $ div2 x
-}
