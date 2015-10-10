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
label.x <- "Global Active Power (kilowatts)"
label.y <- "Frequency"
columnColor <- "red"
background <- "transparent"
margins <- c(5.1, 4.1, 4.1, 2.1)

## file
outfile <- "plot1.png"
dev.function <- png
width <- 480
height <- 480

########################################
# Data
########################################
source("common.R")
x <- getData()$Global_active_power

########################################
# Draw
########################################
hist(x = x, main = title, xlab = label.x, ylab = label.y, 
     bg = background, col = columnColor)
par(mar = margins)

########################################
# Save
########################################
dev.copy(dev.function, file = outfile, width = width, height = height)
dev.off()

