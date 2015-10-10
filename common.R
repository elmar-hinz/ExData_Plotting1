##############################################################################
#                                                                            #
#  Copyright (c) 2015 Elmar Hinz (github.com/elmar-hinz)                     #
#                                                                            #
#  Code project of the course                                                #
#  Coursera Exploratory Data Analysis                                        #
#                                                                            #
#  License: MIT (see LICENSE.txt)                                            #
#                                                                            #
##############################################################################

##############################################################################
# Configuration
##############################################################################

# Unix command to select lines from 1/2/2007 and 2/2/2007
cmd <- "grep --regex=\"^Date\" --regex=\"^[12]/2/2007;\" data/household_power_consumption.txt > data/focus.txt"

# The file with the reduced data
infile <- "data/focus.txt"

##############################################################################
# Get the data ready
#
# Does all steps to get a tidy dataframe for exploration.
#
# @return dataframe The data
##############################################################################
getData <- function() {

  # Reduce data by use of unix commands from 127M to 179K, roughly 1.4 per mille
  # You may run this on windows, as long as infile already exists.
  if(!file.exists(infile)) system(cmd)

  # Read table
  df <- read.csv2(infile, stringsAsFactors = FALSE)

  # Handle numeric colums
  for(i in 3:9) { df[,i] = as.numeric(df[,i]); }

  # Join Date and Time into DateTime
  df <- cbind(as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"), df)
  names(df)[1] <- "DateTime"
  df <- df[,-(2:3)]
  View(df)
  df
}

