module MyRandom(myRand) where
import System.Random 
import System.IO

-- Generates a sequence of random numbers
-- @param n number of random numbers
-- @param a floor of random numbers
-- @param b ceil of random numbers
myRand :: Int -> Int ->Int -> IO [Int]
myRand n a b = sequence $ replicate n $ randomRIO (a,b::Int)
