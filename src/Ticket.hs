module Ticket(Ticket (SimpleTicket),getPrice, tickets) where


-- New Data Type Ticket with a Single Constructor
data Ticket = SimpleTicket Double

--Override the Show function of the class
instance Show Ticket where
  show (SimpleTicket price) = "Ticket $" ++ show price

--Getter for ticket price
getPrice :: Ticket -> Double
getPrice (SimpleTicket p) = p

-- Function tickets
-- Returns a List with n tickets 
tickets :: Int -> [Ticket]
tickets n = take n [ SimpleTicket x |
                             x <-  [10.0,15.0..] >>= replicate 10 ]
