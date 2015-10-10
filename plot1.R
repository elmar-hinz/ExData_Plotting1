# read dataframe
source("common.R")
df <- readDf()
hist(df$Global_active_power)