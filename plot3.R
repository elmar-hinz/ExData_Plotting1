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
# Submetering Line Plot (plot 3)
##############################################################################

########################################
# Configure
########################################

## graphic
type <- "l"
title <- ""
label.x <- ""
label.y <- "Energy sub metering"
legend.text <- c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3")
legend.position <- "topright"
colors <- c("black", "red", "blue")

## file
outfile <- "plot3.png"
width <- 480
height <- 480
background <- "transparent"

########################################
# Data
########################################

source("common.R")
df <- getData()
x <- df$DateTime
y1 <- df$Sub_metering_1
y2 <- df$Sub_metering_2
y3 <- df$Sub_metering_3

########################################
# Draw
########################################

png(filename = outfile, bg = background, width = width, height = height)
plot(type = "n", x = x, y = y1, main = title, xlab = label.x, ylab = label.y, 
     bg = background)
lines(type = type, x = x, y = y1, col = colors[1])
lines(type = type, x = x, y = y2, col = colors[2])
lines(type = type, x = x, y = y3, col = colors[3])
legend(legend.position, legend = legend.text, lty = 1, col = colors)
dev.off()
