Theo Dimopoulos
dimopoulosth.td@gmail.com

Description:
	The application generates pseudo-random events in [-10,10] that hold a collection of 
	ticket in a variety of prices. It reads from standard input and prints result to std
	output.


Assumptions: 
	Basic assumptions are that an event can have Tickets with different prices


How might you change your program if you needed to support multiple events at the
same location?
	No Changes needed. The algorithm expands the search from a point until it
	finds 5 events.

How would you change your program if you were working with a much larger world
size?
	The search is based on filtering events based on manhanttan distances. I
	would parallelize the filter function, (which is no more that 10 lines of
	code). 

--This is haskell.

##################################################################################
			COMPILATION/EXECUTION under Linux

Make sure that all the *.hs file are under in the working directory!

Option 1.
compile and run => $runghc Main.hs (without generating libraries)

Option 2.
compile with => $ghc Main.hs	(compiles the program and generates the executable)
run with     => $./Main 	


#################################################################################
			Run A precompiled version
Go in the precompiled folder and type $./Main. Then supply two numbers from std
input.