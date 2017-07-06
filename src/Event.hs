module Event(Event(SimpleEvent),
             events,
             addTicketsToEvent,
             getEventCoords) where
             
import Text.Printf
import Ticket as T

-- Alias for types
type Id = Int
type Coord = (Int,Int)

-- New Data Type Event 
-- Event has an Id, a list of available tickets 
-- and coordinates
data Event = SimpleEvent Id [Ticket] Coord

instance Show Event where
  show (SimpleEvent id t _) = "Event " ++ printf "%04d" id  ++ " - " ++ show (head t)



addTicketsToEvent :: Event -> [T.Ticket] -> Event
addTicketsToEvent (SimpleEvent id t crs) ts = 
                                         SimpleEvent id (t++ts) crs

getEventCoords :: Event -> Event.Coord
getEventCoords (SimpleEvent _ _ c) = c

--Event Id generator according to coordinates
genEventId :: (Ord a, Num a) => a -> a -> a
genEventId x y | x < 0 = x*(-1000) + y
               | otherwise = x*100 + y

--Generate pseudo-random Events
--generates 77 events, all with different coordinates
events :: [Event]
events = [SimpleEvent (genEventId x y) [] (x,y) | 
                                x <- [-10..10], mod x 3 == 0, 
                                y <- [-10..10], mod y 2 == 0]



