## ------------------------------------------------ ##
# Download Data (from Google Drive)
## ------------------------------------------------ ##
# Purpose:
## Download 'raw' data from various parts of the LKC Shared Drive

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
# Download Soil Temp (T10) Data ----
## ----------------------------- ##

# Identify the relevant files in Google Drive
soil_drive <- googledrive::drive_ls(path = googledrive::as_id("https://drive.google.com/drive/u/2/folders/10OvZnpF-VQDEZJt6i3nGhCu7sscfEN-f")) %>% 
  dplyr::filter(stringr::str_detect(string = name, pattern = "t10_css"))

# Did that work?
soil_drive

# Identify the file path we want locally
soil_path <- file.path("data", "raw-fire", soil_drive$name)

# Download these files
purrr::walk2(.x = soil_drive$id, .y = soil_drive$name,
  .f = ~ googledrive::drive_download(file = .x, overwrite = T,
    path = file.path("data", "raw-fire", paste0("soil-heat_", .y))))

# Clear environment
rm(list = ls()); gc()

## ----------------------------- ##
# Download Soil Temp (SRA80 Pt 2) Data ----
## ----------------------------- ##

# Identify relevant files
sra80_drive <- googledrive::drive_ls(googledrive::as_id("https://drive.google.com/drive/u/2/folders/10OvZnpF-VQDEZJt6i3nGhCu7sscfEN-f"), pattern = "csv") %>%
     dplyr::filter(stringr::str_detect(string = name, pattern = "sra80_css"))

# Did that work?
sra80_drive

# End ----
