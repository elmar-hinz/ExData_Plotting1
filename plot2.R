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
# Global Active Power Line Plot (plot 2)
##############################################################################

########################################
# Configure
########################################

## graphic
type <- "l"
title <- ""
label.x <- ""
label.y <- "Global Active Power (kilowatts)"
background <- "transparent"
margins <- c(5.1, 4.1, 4.1, 2.1)

## file
outfile <- "plot2.png"
dev.function <- png
width <- 480
height <- 480

########################################
# Data
########################################
source("common.R")
df <- getData()
x <- df$DateTime
y <- df$Global_active_power

########################################
# Draw
########################################
plot(x = x, y = y, main = title, xlab = label.x,  ylab = label.y, type = type)
par(mar = margins)
par(bg = background)

########################################
# Save
########################################
dev.copy(dev.function, file = outfile, width = width, height = height)
dev.off()

