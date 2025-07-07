#################################
###### Phenotype CSV split ######
#################################

# This script takes a codelist .csv file (that includes multiple phenotypes and
# coding terminologies) and splits it into separate .csv files based on the
# unique combinations of 'name' (phenotype) and 'terminology' (code type).
# For each combination it creates a .csv file with the naming convention
# "phenotype_terminology.csv" containing only rows for that group.
# The output files are saved in the "Phenotype_CSVs" folder.

# Please change your phenotype column header to 'name' and your
# code type column header to 'terminology' (or edit these in the script)


####################
###### Set-up ######
####################

# Libraries
library(readr)
library(dplyr)
library(stringr)
library(purrr)

# Read (example) phenotype csv (with character encoding)
# change the input file to your codelist file
data <- read_csv("example_phenotypes.csv", col_types = cols(
  name = col_character(),
  terminology = col_character()
))

# Trim whitespace in columns that we are grouping on (just in case)
data <- data %>%
  mutate(across(c(name, terminology), str_trim))

# Create output folder
output_dir <- "phenotype_csvs"
dir.create(output_dir, showWarnings = FALSE)

# Group and write files
data %>%
  group_by(name, terminology) %>%
  group_split() %>%
  walk(function(df_subset) {
    phen <- df_subset$name[1]
    term <- df_subset$terminology[1]

    if (!is.na(phen) && !is.na(term)) {
      ordered_cols <- c("code", "term", setdiff(names(df_subset), c("code", "term")))
      df_subset <- df_subset[, ordered_cols]
      tmp_phen <- gsub("[^A-Za-z0-9_]", "_", phen)
      tmp_term <- gsub("[^A-Za-z0-9_]", "_", term)
      filename <- paste0(tmp_phen, "_", tmp_term, ".csv")
      write_csv(df_subset, file.path(output_dir, filename))
      message("Wrote: ", filename, " with ", nrow(df_subset), " rows")
    }
  })

