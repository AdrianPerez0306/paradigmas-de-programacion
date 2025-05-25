module Alimentos where
import PdePreludat( 
    -- otherwise,
    -- Eq((==)),
--       Ord((<)),
--       Show,
--       Bool(True),
--       String,
--       error,
--       reverse,
--       (&&),
--       fromInteger,
--       (*),
      (+),
--       (++),
--       (-),
--       (.),
--       init,
--       last,
      Number,
    --   fromRational 
    )
-- import GHC.Float (Floating, RealFloat)

doble :: Number -> Number
doble numero = numero + numero


-- data Alimento = Alimento{
--     nombre :: String,
--     color :: String
-- } deriving (Show, Eq)
-- manzana :: Alimento
-- manzana = Alimento "Manzana" "Rojo"
-- pera :: Alimento
-- pera = Alimento "Pera" "Verde"
-- banana :: Alimento
-- banana = Alimento "Banana" "Amarillo"
-- qiwi :: Alimento
-- qiwi = Alimento "Qiwi" "Marron"
-- yogurt :: Alimento
-- yogurt = Alimento "Yogurt" "Blanco"

-- data InformacionNutricional = Info{
--     alimentos :: Alimento,
--     calorias :: Number,
--     grasas :: Number,
--     carbohidratos :: Number,
--     proteinas :: Number
-- } deriving (Show, Eq)
-- infoNutricional :: [InformacionNutricional]
-- infoNutricional = [
--         Info manzana 40 0.3 25.1 0.5,
--         Info pera 134 0.5 34.3 1.6,
--         Info banana 101 0.2 27.1 0.6,
--         Info qiwi 149 8.0 11.4 8.5,
--         Info yogurt 269 4.2 45.0 14.5
--     ]


-- pocoCalorico :: InformacionNutricional -> Bool
-- pocoCalorico info = calorias info < 50

-- filtrar :: (a -> Bool) -> [a] -> [a]
-- filtrar criterioDeFiltrado [] = []
-- filtrar criterioDeFiltrado (head:tail)
--     | (criterioDeFiltrado head) = head : filtrar criterioDeFiltrado tail
--     | otherwise                 = filtrar criterioDeFiltrado tail

-- alimentosPocoCaloricos :: [InformacionNutricional] -> [InformacionNutricional]
-- alimentosPocoCaloricos [] = []
-- alimentosPocoCaloricos alimentos = filtrar pocoCalorico alimentos


