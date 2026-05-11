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
dir.create(path = file.path("data", "raw"), showWarnings = FALSE, recursive = TRUE)
dir.create(path = file.path("data", "tidy"), showWarnings = FALSE)
dir.create(path = file.path("graphs"), showWarnings = FALSE)

# End ----
