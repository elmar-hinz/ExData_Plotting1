##
# Configuration
##

# Unix command to select lines from 1/2/2007 and 2/2/2007
cmd <- "grep --regex=\"^Date\" --regex=\"^[12]/2/2007;\" data/household_power_consumption.txt > data/focus.txt"

# The file with the reduced data
infile <- "data/focus.txt"

readDf <- function() {

  # Reduce data by use of unix commands from 127M to 179K, roughly 1.4 per mille
  # You may run this on windows, as long as infile already exists.
  if(!file.exists(infile)) system(cmd)
  
  # Read table
  df <- read.csv2(infile, stringsAsFactors = FALSE)
  
  # Adjust data types
  for(i in 3:9) { df[,i] = as.numeric(df[,i]); }
  
  # Join Date and Time into DateTime
  df <- cbind(as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"), df)
  names(df)[1] <- "DateTime"
  df <- df[,-(2:3)]
  View(df)
  df
}

