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
# Upload Thermocouple (Tree) Outputs ----
## ----------------------------- ##

# Identify the relevant local files
(therm.tree_data <- dir(path = file.path("data", "tidy"), pattern = "thermocouple"))

# Identify link to destination Drive folder
therm.tree_drive <- googledrive::as_id("https://drive.google.com/drive/folders/1qWM1-HT6SFnzQ5O0dPRAy9ntYc_h-6pw")

# Upload data to that folder
## Note, the thermocouple data is BIG (~500 MB) so it's better to upload manually
# purrr::walk(.x = therm.tree_data, 
#  .f = ~ googledrive::drive_upload(media = file.path("data", "tidy", .x),
#  overwrite = T, path = therm.tree_drive))

# Clear environment
rm(list = ls()); gc()

# End ----
