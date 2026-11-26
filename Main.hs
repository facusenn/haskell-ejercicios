-- | Pruebas simples: compara cada función con el resultado esperado.
module Main (main) where

import Listas
import System.Exit (exitFailure, exitSuccess)
import Texto

caso :: (Eq a, Show a) => String -> a -> a -> IO Bool
caso nombre obtenido esperado
  | obtenido == esperado = putStrLn ("OK    " ++ nombre) >> return True
  | otherwise = do
      putStrLn ("FALLA " ++ nombre ++ ": se obtuvo " ++ show obtenido ++ ", se esperaba " ++ show esperado)
      return False

main :: IO ()
main = do
  resultados <- sequence
    [ caso "appToUpper minuscula"   (appToUpper 'a') 'A'
    , caso "appToUpper otro"        (appToUpper '3') '3'
    , caso "capitalizar"            (capitalizar "algoritmos y estructuras de datos i") "Algoritmos Y Estructuras De Datos I"
    , caso "capitalizar espacio fin" (capitalizar "hola ") "Hola "
    , caso "capitalizar vacia"      (capitalizar "") ""
    , caso "concatLineas"           (concatLineas [(2, "y Estructuras"), (1, "Algoritmos "), (3, " de Datos I")]) "Algoritmos y Estructuras de Datos I"
    , caso "mayuscula"              (mayuscula "Haskell 101") "HASKELL 101"
    , caso "ejemploA"               (ejemploA (\n -> toEnum (n + 64)) [1, 2, 3]) "ABC"
    , caso "ejemploB"               (ejemploB (all even) [1, 2, 3, 4 :: Int]) [2, 4]
    , caso "snoc"                   (snoc [1, 2, 1, 2, 7, 3 :: Int] 0) [1, 2, 1, 2, 7, 3, 0]
    , caso "snoc'"                  (snoc' "ab" 'c') "abc"
    , caso "insertNth medio"        (insertNth 1 [3, 8, 7 :: Int] 5) [3, 5, 8, 7]
    , caso "insertNth inicio"       (insertNth 0 [3, 8 :: Int] 5) [5, 3, 8]
    , caso "insertNth fuera"        (insertNth 9 [3 :: Int] 5) [3, 5]
    , caso "sumatoria"              (sumatoria 10) 55
    , caso "scalarProduct"          (scalarProduct [1, 2, 3] [6, 1, 4, 6]) 20
    , caso "scalarProduct'"         (scalarProduct' [1, 2, 3] [6, 1, 4, 6]) 20
    ]
  let fallas = length (filter not resultados)
  putStrLn ("\n" ++ show (length resultados) ++ " pruebas, " ++ show fallas ++ " fallas")
  if fallas == 0 then exitSuccess else exitFailure
