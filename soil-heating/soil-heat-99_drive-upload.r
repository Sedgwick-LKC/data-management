## ------------------------------------------------ ##
# Upload Data (to Google Drive)
## ------------------------------------------------ ##
# Purpose:
## Upload outputs of the code to various parts of the LKC Shared Drive

# For the code to talk to Drive, you need to tell R who you are (in Google)
## Work through the following tutorial to do so
### https://lter.github.io/scicomp/tutorial_googledrive-pkg.html
## Alternatively, see the help file for the following function:
### `?googledrive::drive_auth`

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse, googledrive)

# Get set up
source("-setup.r")

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Upload Soil Heat Outputs ----
## ----------------------------- ##


# << Finalized outputs TBD >>


# End ----
