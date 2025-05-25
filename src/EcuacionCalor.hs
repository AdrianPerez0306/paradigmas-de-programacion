module EcuacionCalor where

import Text.Printf (printf)
import System.IO (hPutStrLn, stderr, stdout, hSetBuffering, BufferMode(NoBuffering))
import Control.Concurrent (threadDelay)
import PdePreludat  -- Módulo que define Number
import Data.Int (Int)
import GHC.Real (fromIntegral)
import Data.List (intercalate)


-- Configuración del modelo
data HeatConfig = HeatConfig
    { alpha :: Number
    , lengthRod :: Number
    , totalTime :: Number
    , dx :: Number
    , dt :: Number
    }

-- Condiciones de frontera
data BoundaryConditions = BoundaryConditions
    { leftBC :: Number -> Number
    , rightBC :: Number -> Number
    , initial :: Number -> Number
    }

-- Solución numérica mostrando evolución temporal
solveHeatEquation :: HeatConfig -> BoundaryConditions -> IO ()
solveHeatEquation config@HeatConfig{dt=deltaT} bc = do
    hSetBuffering stdout NoBuffering
    let nx = lengthRod config / dx config
        nt = totalTime config / deltaT
        xs = [i * dx config | i <- [0..floor nx]]
        initialCondition = [initial bc x | x <- xs]
        r = alpha config * deltaT / (dx config * dx config)

        _ = if r > 0.5
            then hPutStrLn stderr "Advertencia: r > 0.5 - puede ser inestable"
            else return ()

    let loop step prev = do
            -- putStrLn $ "Cartel"

            -- mapM_ (\i -> do
            --     putStr $ "x=" ++ show (i * dx defaultConfig) ++ "\t| "
            --     mapM_ (\t -> putStr $ show (sol !! t !! i) ++ "\t") sampleTimes
            --     putStrLn "") positions
            -- printf "Paso %d (t=%.3f): " step (step * deltaT)

            print ([round (x * 100) / 100.0 | x <- prev])
            print (step, (step * deltaT))
            -- print prev

            if step >= (nt-1)
                then return ()
                else do
                     -- Conversión de Number a Int
                    -- Versión correcta para threadDelay con Number
                    -- threadDelay 50000.0
                    let next = computeNextStep step prev r (floor nx)
                    loop (step + 1) next

    loop 0 initialCondition
  where
    computeNextStep step prev r nxInt =
        let left = leftBC bc (step * dt config)
            right = rightBC bc (step * dt config)
            interiors = [ r * prev !! (i-1) + (1 - 2*r) * prev !! i + r * prev !! (i+1)
                        | i <- [1..nxInt - 2] ]  -- nxInt ya es Int
        in left : interiors ++ [right]

-- Configuración
defaultConfig :: HeatConfig
defaultConfig = HeatConfig
    { alpha = 0.01
    , lengthRod = 1.0
    , totalTime = 50
    , dx = 0.05
    , dt = 0.1
    }

defaultBC :: BoundaryConditions
defaultBC = BoundaryConditions
    { leftBC = \_ -> 100.0
    , rightBC = \_ -> 0.0
    , initial = \_ -> 0.0
    }

-- Función principal
main :: IO ()
main = do
    solveHeatEquation defaultConfig defaultBC
    putStrLn "Simulación completada."