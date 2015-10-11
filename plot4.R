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
# 4 Plots (plot 4)
##############################################################################

########################################
# Configure
########################################

## graphics
p1.title <- ""
p1.label.x <- ""
p1.label.y <- "Global Active Power"

p2.title <- ""
p2.label.x <- "datetime"
p2.label.y <- "Voltage"

p3.title <- ""
p3.label.x <- "datetime"
p3.label.y <- "Energy sub metering"
p3.legend.text <- c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3")
p3.legend.position <- "topright"
p3.colors <- c("black", "red", "blue")

p4.title <- ""
p4.label.x <- "datetime"
p4.label.y <- "Global_reactive_power"

## file
layout <- c(2,2)
outfile <- "plot4.png"
width <- 480
height <- 480
background <- "transparent"

########################################
# Data
########################################

source("common.R")
df <- getData()
p1.x <- df$DateTime
p1.y <- df$Global_active_power
p2.x <- df$DateTime
p2.y <- df$Voltage
p3.x <- df$DateTime
p3.y1 <- df$Sub_metering_1
p3.y2 <- df$Sub_metering_2
p3.y3 <- df$Sub_metering_3
p4.x <- df$DateTime
p4.y <- df$Global_reactive_power

########################################
# Draw
########################################

png(filename = outfile, bg = background, width = width, height = height)
par(mfrow = layout)

# plot 1
plot(type = "l", x = p1.x, y = p1.y, 
     main = p1.title, xlab = p1.label.x,  ylab = p1.label.y)

# plot 2
plot(type = "l", x = p2.x, y = p2.y, 
     main = p2.title, xlab = p2.label.x,  ylab = p2.label.y)

# plot 3
plot(type = "n", x = p3.x, y = p3.y1, 
     main = p3.title, xlab = p3.label.x, ylab = p3.label.y)
lines(type = type, x = p3.x, y = p3.y1, col = p3.colors[1])
lines(type = type, x = p3.x, y = p3.y2, col = p3.colors[2])
lines(type = type, x = p3.x, y = p3.y3, col = p3.colors[3])
legend(p3.legend.position, legend = p3.legend.text, 
       lty = 1, col = p3.colors, bty = "n")

# plot 4
plot(type = "l", x = p4.x, y = p4.y, 
     main = p4.title, xlab = p4.label.x,  ylab = p4.label.y)

dev.off()
