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
# Red histogram of global active power (plot 1)
##############################################################################

########################################
# Configure
########################################

## graphic
title <- "Global Active Power"
color <- "red"
label.x <- "Global Active Power (kilowatts)"
label.y <- "Frequency"
values <- df$Global_active_power

## file
outfile <- "plot1.png"
dev.function <- png
width <- 480
height <- 480

########################################
# Get the data
########################################
source("common.R")
df <- getData()

########################################
# Plot
########################################
hist(x = values, main = title, col = color, xlab = label.x, ylab = label.y)

########################################
# Save
########################################
dev.copy(dev.function, file = outfile, width = width, height = height)
dev.off()

