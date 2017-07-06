import Control.Applicative
import Control.Monad
import System.IO
import Data.List
import MyRandom
import Validator as V
import Event as E 
import Ticket as T(tickets)


--Generate Events with Tickets
generateEvents :: [Int] -> [Event]
generateEvents rs = let es = E.events
                        ts = T.tickets 1000
                    in
                        distrTickets es ts rs

--Auxiliary function to generate Events with tickets
--Distributes the tickets in the events
--distrTickets :: [Event] -> [T.Ticket] -> [Int] -> [Event]
distrTickets es [] _ = es
distrTickets es _ [] = es
distrTickets [] _ _  = []
distrTickets (e:es) ts rs =  let n = head rs
                                 (ts',restTs) = splitAt n ts
                                 e' =  addTicketsToEvent e ts'
                              in
                                 (e': distrTickets es restTs (tail rs))



--Predicate for manHattan distance
--Returns True if event is closer than n to the give
--coordinates
manHattan :: Int -> (Int, Int) -> Event -> Bool
manHattan n (x,y) e = let (xe,ye) = getEventCoords e 
                          delta = abs(x-xe) + abs(y-ye)
                      in
                          delta <= n

--Find n Closest Events 
--Returns a list with events 
findNClosestEvents :: Int -> [Event] -> (Int, Int) -> [Event]
findNClosestEvents n es crds = let res = filter (manHattan n crds) es 
                              in
                                if (length res) < 5 
                                then
                                    findNClosestEvents (n+1) es crds
                                else
                                    take 5 res

--Calculates manhattan distance from point and event
--Returns a String whick denotes distance (used for print)
findDistsStr (x,y) e = let (xe,ye) = getEventCoords e 
                           distance = abs(xe-x) + abs(ye-y)
                       in
                            "Distance " ++ show distance

--Auxiliary Merge String List
--Used for nice printing
mergeStrList :: [String] -> [String] -> [String]
mergeStrList _ [] = []
mergeStrList [] _ = []
mergeStrList (x:xs) (y:ys) = [x++", "++y] ++ mergeStrList xs ys

usage :: String
usage = "**Please supply a point x<space>y where x,y in [-10,10], try again!"
    
main = do
         line <- getLine                            --Get Input
         if validate line                           --Validate
         then 
           do
             let input = words line                 --Format Input
             let x = read $ input!!0 :: Int
             let y = read $ input!!1 :: Int
             rands <- myRand 100 1 1                                            --Gen List of Randoms
             let events = generateEvents rands                                  --Get List of Event
             let closest5 = findNClosestEvents 0 events (x,y)                   --Get Closest 5 events    
             let distances5 = map (findDistsStr (x,y)) closest5                 --Construct Distance Strings
             let eventPrintOut= mergeStrList (map show closest5) distances5     --Construct Nice Print
             mapM_ putStrLn eventPrintOut                                       --Print
         else 
           do
             putStrLn usage                         --Invalid Input, print usage 
             main 
          































