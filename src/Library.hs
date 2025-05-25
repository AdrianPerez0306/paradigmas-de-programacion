module Library where
-- import PdePreludat
--     ( otherwise,
--       Eq((==)),
--       Ord((<)),
--       Show,
--       Bool(True),
--       String,
--       error,
--       reverse,
--       (&&),
--       fromInteger,
--       (*),
--       (+),
--       (++),
--       (-),
--       (.),
--       init,
--       last,
--       Number )


-- -- -------------------
-- -- RECURSIVIDAD
-- -- -------------------

-- -- FACTORIAL
-- factorial :: Number -> Number
-- factorial numero
--     | numero < 0 = error "No definido para numero negativos"
--     | numero == 0 = 1 
--     | otherwise = factorialStackRecursion numero 1 --1 es el valor neutro de la multiplicacion

-- factorialStackRecursion :: Number -> Number -> Number
-- factorialStackRecursion 0 resultado = resultado
-- factorialStackRecursion number resultado = factorialStackRecursion (number - 1)(number * resultado) 


-- -- LONGITUD
-- longitud :: [a] -> Number
-- longitud [] = 0
-- longitud (x:xs) = 1 + longitud xs

-- -- ULTIMO
-- ultimo :: [a] -> a
-- ultimo [x] = x
-- ultimo (x:xs) = ultimo xs

-- -- REVERSA
-- reversa :: [a] -> [a]
-- reversa [] = []
-- reversa (x:xs) = reversa xs ++ [x] --operador ++ concatena lista. por eso la cabeza <x> esta hecha como lista

-- -- CAPICUA
-- esCapicua :: Eq a => [a] -> Bool
-- esCapicua [] = True
-- esCapicua [x] = True
-- esCapicua (x:xs) = x == last xs && esCapicua (init xs)


-- --Orden superior
-- data Cliente = Cliente{
--     nombre :: String,
--     deuda :: Number,
--     facturas :: [Number]    
-- } deriving (Show)

-- palindromo :: String -> Bool
-- palindromo valor = reverse valor == valor

-- clientes = [
--     Cliente "ana" 150 [120, 80, 60],
--     Cliente "adrian" 160  [120, 80, 60],
--     Cliente "olo" 120  [120, 80, 60]
--  ]


-- --Esta implementacion genera mucha repeticion de codigo. 
-- -- Una repeticion por cada condicion que necesite. 
-- -- Ahi aparecen las funciones de orden superior, que reciben y/o devuelven funciones
-- clientesConNombrePalindromo :: [Cliente] -> [Cliente]
-- clientesConNombrePalindromo [] = []

-- clientesConNombrePalindromo (cliente:clientes)
--     | (palindromo . nombre) cliente = cliente   : clientesConNombrePalindromo clientes
--     | otherwise                                 = clientesConNombrePalindromo clientes



-- filtrar :: (a -> Bool) -> [a] -> [a]
-- filtrar criterioDeFiltrado [] = []
-- filtrar criterioDeFiltrado (head:tail)
--     | (criterioDeFiltrado head) = head : filtrar criterioDeFiltrado tail
--     | otherwise                 = filtrar criterioDeFiltrado tail
