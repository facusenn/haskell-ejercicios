-- | Funciones para un editor de texto: mayúsculas, capitalización y
-- reconstrucción de líneas. Cada función respeta una restricción distinta
-- (recursión, listas por comprensión, funciones de alto orden).
module Texto
  ( appToUpper
  , capitalizar
  , concatLineas
  , mayuscula
  , ejemploA
  , ejemploB
  ) where

import Data.Char (toUpper)

-- | Pasa a mayúscula solo si el carácter es una letra minúscula.
appToUpper :: Char -> Char
appToUpper c = if esMinuscula c then toUpper c else c

esMinuscula :: Char -> Bool
esMinuscula c = c >= 'a' && c <= 'z'

-- | Pone en mayúscula la primera letra de cada palabra (solo recursión).
--
-- >>> capitalizar "algoritmos y estructuras de datos i"
-- "Algoritmos Y Estructuras De Datos I"
capitalizar :: String -> String
capitalizar []     = []
capitalizar (x:xs) = appToUpper x : resto xs
  where
    resto []         = []
    resto (' ':y:ys) = ' ' : appToUpper y : resto ys
    resto (y:ys)     = y : resto ys

-- | Concatena líneas numeradas en orden de índice (listas por comprensión,
-- sin usar sort).
--
-- >>> concatLineas [(2, "y Estructuras"), (1, "Algoritmos "), (3, " de Datos I")]
-- "Algoritmos y Estructuras de Datos I"
concatLineas :: [(Int, String)] -> String
concatLineas lineas = concat [texto | (_, texto) <- ordenar lineas]
  where
    ordenar [] = []
    ordenar xs =
      let menor = minimum [n | (n, _) <- xs]
      in  [(n, t) | (n, t) <- xs, n == menor] ++ ordenar [(n, t) | (n, t) <- xs, n /= menor]

-- | Todo en mayúscula, usando solo funciones de alto orden.
mayuscula :: String -> String
mayuscula = map toUpper

-- | Ejemplo de función con tipo (Int -> Char) -> [Int] -> String.
ejemploA :: (Int -> Char) -> [Int] -> String
ejemploA f xs = [f x | x <- xs]

-- | Ejemplo de función con tipo ([a] -> Bool) -> [a] -> [a].
ejemploB :: ([a] -> Bool) -> [a] -> [a]
ejemploB p xs = [x | x <- xs, p [x]]
