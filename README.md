# Ejercicios de Haskell

Ejercicios de **Algoritmos y Estructuras de Datos I** (Analista Universitario en Sistemas): programación funcional con recursión, pattern matching, listas por comprensión y funciones de alto orden.

| Módulo | Funciones |
|---|---|
| [`src/Texto.hs`](src/Texto.hs) | `capitalizar` (solo recursión), `concatLineas` (ordena líneas con listas por comprensión, sin `sort`), `mayuscula` (alto orden, con `map`), `appToUpper` y ejemplos de funciones de orden superior |
| [`src/Listas.hs`](src/Listas.hs) | `snoc`, `insertNth`, `sumatoria`, `scalarProduct` (versión recursiva y versión con `zip`) |
| [`Main.hs`](Main.hs) | 17 pruebas que comparan cada función con el resultado esperado |

## Ejecutar las pruebas

Requiere [GHC](https://www.haskell.org/ghcup/).

```bash
runghc -isrc Main.hs
```

Para probar funciones sueltas:

```bash
ghci -isrc src/Texto.hs
ghci> capitalizar "algoritmos y estructuras de datos i"
"Algoritmos Y Estructuras De Datos I"
```
