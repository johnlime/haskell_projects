import System.Environment

data Rat = Rat Integer Integer

{-
class Num a where
  (+) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a       -(-)
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
-}

instance Show Rat where
  show (Rat x y) | y < 0 = show (signum (Rat x y) * abs (Rat x y))
                 | y == 1 = show x
                 | otherwise = show (x `div` multiple) ++ "/" ++ show (y `div` multiple)
    where
      multiple | (abs y) > (abs x) = lcm (abs x) (abs y)
               | (abs x) > (abs y) = lcm (abs y) (abs x)
               | (abs x) == (abs y) = (abs x)

      lcm a b | b`rem`a == 0 = a
              | otherwise = lcm (b`rem`a) a

instance Num Rat where
  (Rat x y) + (Rat u v) = Rat (x*v + u*y) (y*v)
  (Rat x y) * (Rat u v) = Rat (x*u) (y*v)
  negate (Rat x y) = Rat (- x) y
  abs (Rat x y) = Rat (abs x) (abs y)
  signum (Rat x y) | x == 0 = fromInteger 0
                   | x*y > 0 = fromInteger 1
                   | otherwise = fromInteger (-1) 
  fromInteger x = Rat x 1
  

main = do args <- getArgs
          let x = read (args !! 0)
          let y = read (args !! 1)
          let u = read (args !! 2)
          let v = read (args !! 3)
          print $ Rat x y + Rat u v
          print $ Rat x y - Rat u v
          print $ Rat x y * Rat u v
