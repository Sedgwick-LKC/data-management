# ------------------------------------------------ ##
# Soil Heat - Wrangle
## ------------------------------------------------ ##
# Purpose:
## Wrangle the 'raw' soil heat data

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse, SheFire)

# Get set up
source("-setup.r")

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Load Data ----
## ----------------------------- ##



## ----------------------------- ##
# Shefire Analysis & Viz ----
## ----------------------------- ##



# shefire_css_t10 <- shefire(shedat,
#     sensor.depths=c(5,10,15),
#     #cutoff=c(1000),
#     #regression=F,
#     #moving.window = T,
#     #window.size = c(3),
#     time.buffer=c(5),
#     print.plots.tables=T,
#     save.plots.tables=T,
#     save.directory="graphs/shefire/t10/p11")

# #reformat data for basic ggplot of time series 
# plotdat <- shedat %>% pivot_longer(cols = -c("Date.Time","TimeCounter"),names_to = c("Depth"),values_to = ("Temperature"))
# p1 <- ggplot(plotdat,aes(x=TimeCounter,y=Temperature,color=Depth)) +
# geom_line()

# End ----
