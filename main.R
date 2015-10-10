# Unix command to select lines from 1/2/2007 and 2/2/2007
cmd <- "grep --regex=\"^[12]/2/2007;\" data/household_power_consumption.txt > data/focus.txt"

# The file with the reduced data
infile <- "data/focus.txt"

# Reduce data by use of unix commands from 127M to 179K, roughly 1.4 per mille
if(!file.exists(infile)) system(cmd)

tbl <- read.csv2(infile)
View(tbl)
