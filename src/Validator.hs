module Validator(validate) where
import Text.Read
import Data.Maybe
import Debug.Trace

--isValid input | length input < 2 = False
--              | input


readMaybeInt :: String -> Maybe Int
readMaybeInt = readMaybe

inRange min max num = num >= min && num <= max

findNumbers :: String -> [Int]
findNumbers lines =  let 
                         f = map fromJust .
                             filter isJust . 
                             map readMaybeInt . 
                             words 
                      in
                          f lines
                       
validate lines = let 
                    ints = findNumbers lines                    
                    successors = filter (inRange (-10) 10) ints
                 in
                    length successors > 1
