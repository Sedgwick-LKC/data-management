# ------------------------------------------------ ##
# Soil Heat - Wrangle
## ------------------------------------------------ ##
# Purpose:
## Wrangle the 'raw' soil heat data

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse, lubridate)

# Get set up
source("-setup.r")

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Load Data ----
## ----------------------------- ##

# Identify all of the logger data
(local_soil <- dir(path = file.path("data", "raw-fire"), pattern = "soil-heat_"))





# BASEMENT ----

# 10_file_paths <- list.files(path = "data/fire/soil_temps", pattern = "\\.csv$", full.names = TRUE)
#   #
# #read point_2 without header lines, name columns, format date and time
# #could loop this
#   d5 <- read_csv(t10_file_paths[13],skip=20) #read in point, 5 cm ibutton first
#       names(d5) <- c("Date.Time","unit","value") 
#       d5$Date.Time <- as.POSIXct(d5$Date.Time, format = "%m/%d/%y %I:%M:%S %p")
#   d10 <- read_csv(t10_file_paths[11],skip=20)
#       names(d10) <- c("Date.Time","unit","value") 
#       d10$Date.Time <- as.POSIXct(d10$Date.Time, format = "%m/%d/%y %I:%M:%S %p")
#   d15 <- read_csv(t10_file_paths[12],skip=20)
#       names(d15) <- c("Date.Time","unit","value")
#       d15$Date.Time <- as.POSIXct(d15$Date.Time, format = "%m/%d/%y %I:%M:%S %p")
# #get time of maximum temp at 5 cm - will use this to set data window
#   burn_day <- day(as.POSIXct("2025-11-09")) #need this to make sure time window is on day of burn
# #extract burn day temps
#   d5_burnday <- d5[day(d5$Date.Time) == burn_day,]
# #get time of maximum temp at 5 cm - will use this to set data window
#   time_maxt <- d5_burnday[which.max(d5_burnday$value),]
#   start_time <- time_maxt$Date.Time - 2*3600 #start 2 hours before burning
#   end_time <- time_maxt$Date.Time + 12*3600 #end 8 hours after burning begins
# #extract and format ibutton data for shefire analysis window
#     Date.Time <- d5[d5$Date.Time >= start_time & d5$Date.Time < end_time,1] #200 x 1
#     Temp_S <- d5[d5$Date.Time >= start_time & d5$Date.Time < end_time,3] #200
#     Temp_M <- d10[d10$Date.Time >= start_time & d10$Date.Time < end_time,3] #200
#     Temp_D <- d15[d15$Date.Time >= start_time & d15$Date.Time < end_time,3] #200
#   #reformat for shefire
#     TimeCounter <- c(1:nrow(Date.Time)) * 3 #time in minutes beginning at 3 minutes
#     shedat <- cbind(Date.Time,TimeCounter,Temp_S,Temp_M,Temp_D)
#     names(shedat) <- c("Date.Time","TimeCounter","Temp_S","Temp_M","Temp_D")
#   #write data file with appropriate sample name
#     write.csv(shedat,"data/fire/soil_temps/shefire/input_data/shedat_css_t10_p11.csv")
    

# End ----
