-- | Ejercicios de recursión sobre listas y números.
module Listas
  ( snoc
  , snoc'
  , insertNth
  , sumatoria
  , scalarProduct
  , scalarProduct'
  ) where

-- | Agrega un elemento al final de la lista (recursión).
--
-- >>> snoc [1,2,1,2,7,3] 0
-- [1,2,1,2,7,3,0]
snoc :: [a] -> a -> [a]
snoc []     x = [x]
snoc (y:ys) x = y : snoc ys x

-- | Misma idea usando (++).
snoc' :: [a] -> a -> [a]
snoc' xs x = xs ++ [x]

-- | Inserta un elemento en la posición n (0 = al principio).
-- Si n supera el largo, lo agrega al final.
--
-- >>> insertNth 1 [3,8,7] 5
-- [3,5,8,7]
insertNth :: Int -> [a] -> a -> [a]
insertNth n xs x | n <= 0 = x : xs
insertNth _ []     x = [x]
insertNth n (y:ys) x = y : insertNth (n - 1) ys x

-- | Suma de 1 a n (recursión). Para n < 1 devuelve 0.
sumatoria :: Int -> Int
sumatoria n | n < 1     = 0
            | otherwise = n + sumatoria (n - 1)

-- | Producto escalar con recursión. Si las listas tienen distinto largo,
-- se ignoran los elementos sobrantes.
--
-- >>> scalarProduct [1,2,3] [6,1,4]
-- 20
scalarProduct :: [Int] -> [Int] -> Int
scalarProduct (x:xs) (y:ys) = x * y + scalarProduct xs ys
scalarProduct _      _      = 0

-- | Producto escalar con zip y sum.
scalarProduct' :: [Int] -> [Int] -> Int
scalarProduct' xs ys = sum [x * y | (x, y) <- zip xs ys]
