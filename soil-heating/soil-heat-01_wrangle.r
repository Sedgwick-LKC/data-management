# ------------------------------------------------ ##
# Soil Heat - Wrangle
## ------------------------------------------------ ##
# Purpose:
## Wrangle the 'raw' soil heat data

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse, supportR, lubridate)

# Get set up
source("-setup.r")

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Load Data ----
## ----------------------------- ##

# Identify all of the logger data
(local_soil <- dir(path = file.path("data", "raw-fire"), pattern = "soil-heat_"))

# Make a list to store outputs
soil_list <- list()

# Read in all of these files
for(k in seq_along(local_soil)){

  # Read in the file and do some minor wrangling
  soil_k <- data.frame("x" = readLines(file.path("data", "raw-fire", local_soil[[k]]))) %>% 
    dplyr::mutate(source = local_soil[k], 
      .before = dplyr::everything())

  # Read in the file and add to list
  soil_list[[k]] <- soil_k }

# Ditch loop stuff
rm(list = c("k", "soil_k"))

# Unlist the data
soil_v01 <- soil_list %>% 
  purrr::list_rbind(x = .)

# Check structure
dplyr::glimpse(soil_v01)

## ----------------------------- ##
# Parse Headers ----
## ----------------------------- ##

# Begin by parsing header into consistently-formatted variable-value pairs
head_v01 <- soil_v01 %>% 
  dplyr::filter(stringr::str_count(string = x, pattern = ",") != 2) %>% 
  dplyr::mutate(x = stringi::stri_unescape_unicode(str = x)) %>% 
  dplyr::filter(nchar(x) != 0) %>% 
  dplyr::filter(stringr::str_detect(string = x, pattern = "First Sample Timestamp") != TRUE) %>% 
  dplyr::filter(stringr::str_detect(string = x, pattern = "Total Mission Samples") != TRUE) %>% 
  dplyr::mutate(
    x = gsub(pattern = "  ", replacement = " ", x = x),
    x = gsub("1-Wire\\/iButton Part Number", "part_num", x),
    x = gsub("1-Wire/iButton Registration Number", "register_num", x),
    x = gsub("Is Mission Active\\? |Mission in Progress\\? ", "mission_active: ", x),
    x = gsub("SUTA Mission\\? ", "mission_suta: ", x),
    x = gsub("Mission Start Time|Mission Start", "start_date.time", x),
    x = gsub("Sample Rate", "sample_rate", x),
    x = gsub("Number of Mission Samples|Mission Sample Count", "samples_mission", x),
    x = gsub("Total Samples|Total Device Samples", "samples_total", x),
    x = gsub("Temperature Logging", "logging_temperature", x),
    x = gsub("Data Logging", "logging_data", x),
    x = gsub("Roll Over Enabled\\? ", "roll.over_enabled: ", x),
    x = gsub("Roll Over Occurred\\? ", "roll.over_occurred: ", x),
    x = gsub("Active Alarms", "alarm_active", x),
    x = gsub("Next Clock Alarm At", "alarm_next.clock", x),
    x = gsub("Waiting for Temperature Alarm\\? ", "alarm_temp.wait: ", x),
    x = gsub("High Temperature Alarm|Temperature High Alarm|Data High Alarm", "alarm_high.temp", x),
    x = gsub("Low Temperature Alarm|Temperature Low Alarm|Data Low Alarm", "alarm_low.temp", x)
  ) %>% 
  tidyr::separate_wider_delim(data = ., cols = x, delim = ": ",
      names = c("variable", "value"), cols_remove = TRUE)
  
# Check structure
dplyr::glimpse(head_v01)

# Ditch unwanted variables and flip that to wide format
head_v02 <- head_v01 %>% 
  dplyr::filter(variable %in% c("part_num", "register_num", "sample_rate", 
    "start_date.time", "samples_mission", "samples_total")) %>% 
  tidyr::pivot_wider(names_from = variable, values_from = value, values_fill = NA)

# What variables are dropped?
supportR::diff_check(old = unique(head_v01$variable), 
  new = setdiff(x = "source", y = names(head_v02)))

# Check structure
dplyr::glimpse(head_v02)

# Tidy up values within each variable
head_v03 <- head_v02
  # No such wrangling currently performed

# Check structure
dplyr::glimpse(head_v03)

## ----------------------------- ##
# Export Headers ----
## ----------------------------- ##

# Make a final version
head_v99 <- head_v03

# Check structure
dplyr::glimpse(head_v99)

# Export locally
write.csv(x = head_v99, na = '', row.names = FALSE,
          file = file.path("data", "tidy", "soil-heat_headers.csv"))

# BASEMENT ----

# 10_file_paths <- list.files(path = "data/fire/soil_temps", pattern = "\\.csv$", full.names = TRUE)
#   #
# #read point_2 without header lines, name columns, format date anuniqud time
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
