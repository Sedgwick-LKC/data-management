## ------------------------------------------------ ##
# Data Management - Setup
## ------------------------------------------------ ##
# Purpose:
## Do setup steps that are necessary for at least one of the datasets collected by the LKC

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Make Folders ----
## ----------------------------- ##

# Create necessary folders
dir.create(path = file.path("data", "raw-fire"), showWarnings = FALSE, recursive = TRUE)
dir.create(path = file.path("data", "raw-climate"), showWarnings = FALSE)
dir.create(path = file.path("data", "raw-veg"), showWarnings = FALSE)
dir.create(path = file.path("data", "raw-precip"), showWarnings = FALSE)
dir.create(path = file.path("data", "tidy"), showWarnings = FALSE)
dir.create(path = file.path("graphs"), showWarnings = FALSE)

# End ----
