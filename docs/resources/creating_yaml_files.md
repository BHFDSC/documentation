---
layout: default
title: Creating YAML Files
nav_order: 3
parent: Phenotype Library Resources
grand_parent: Resources
permalink: /resources/phenotype_library_resources/creating_yaml_files
---

# Creating YAML files
To upload phenotypes to the HDR UK Phenotpye Library using the API, the metadata for each phenotype definition needs to be compiled into individual YAML files. An example YAML file (with annotation) can be downloaded [here](https://bhfdsc.github.io/documentation/assets/images/ANNOTATED_PL-BHFDSC_Example.yaml). 

We have created a script to automate the conversion of phenotype metadata (stored in an Excel file) into an individual, formatted YAML file for each phenotype. The output files are saved in the 'phenotype_yamls' folder. It is designed for use when preparing phenotypes for upload to the HDR UK Phenotype Library via the API.

The script can be downloaded [here](https://bhfdsc.github.io/documentation/assets/images/yaml_formatting.R) and the example metadata file [here](https://bhfdsc.github.io/documentation/assets/images/example_phenotype_metadata_file.xlsx). 

{% highlight markdown %}
```r
# Libraries
library(readxl)
library(yaml)
library(stringr)

# Load (example) metadata file
df <- read_excel("example_phenotype_metadata_file.xlsx")

# Output folder
output_dir <- "phenotype_yamls"
dir.create(output_dir, showWarnings = FALSE)

# Define list columns (adjust if needed)
list_fields <- c("collections", "tags", "data_sources", "ontology")


#######################
###### Functions ######
#######################

# Function to parse multi-line text blocks into a named list
# (eg. concept_information, template)

parse_key_value_block <- function(text_block) {
  # Split into blocks by empty lines
  blocks <- str_split(text_block, "\\r?\\n\\s*\\r?\\n")[[1]]

  # Each block (chunk of key:value pairs)is a separate dictionary
  parsed_blocks <- lapply(blocks, function(block) {
    lines <- str_split(block, "\\r?\\n")[[1]]
    kv <- str_split_fixed(lines, ":", 2)
    keys <- trimws(kv[, 1])
    values <- trimws(kv[, 2])

    entry <- list()
    for (j in seq_along(keys)) {
      val <- values[j]
      if (val == "") next
      entry[[keys[j]]] <- if (grepl("^\\d+$", val)) as.integer(val) else val
    }
    return(entry)
  })

  return(parsed_blocks)
}


# Function to clean and format list-style fields

handle_list_field <- function(value, field_name) {
  entries <- str_split(trimws(value), "\\r?\\n")[[1]]
  entries <- trimws(entries)

  lapply(entries, function(x) {
    if (field_name == "publications") {
      paste0("'", gsub("'", "''", x), "'")  # Force single quotes
    } else if (grepl("^\\d+$", x)) {
      as.integer(x)
    } else {
      x
    }
  })
}


#######################
###### YAML loop ######
#######################


# Loop over rows
for (i in seq_len(nrow(df))) {
  pheno <- as.list(df[i, ])

  # Format list columns
  for (f in list_fields) {
    if (!is.null(pheno[[f]]) && !is.na(pheno[[f]]) && trimws(pheno[[f]]) != "") {
      pheno[[f]] <- handle_list_field(pheno[[f]], f)
    }
  }

  # Handle structured fields
  if (!is.na(pheno$concept_information) && trimws(pheno$concept_information) != "") {
    pheno$concept_information <- parse_key_value_block(pheno$concept_information)
  }
  if (!is.na(pheno$template) && trimws(pheno$template) != "") {
    template_list <- parse_key_value_block(pheno$template)
    if (length(template_list) > 0) {
      pheno$template <- template_list[[1]]
    }
  }

  # Drop empty/null/NA fields
  pheno <- Filter(function(x) {
    !(is.null(x) || (length(x) == 0) ||
        (length(x) == 1 && is.na(x)) ||
        (is.character(x) && all(trimws(x) == "")))
  }, pheno)

  # Convert whole numbers to integers
  pheno <- lapply(pheno, function(x) {
    if (is.numeric(x) && length(x) == 1 && x == as.integer(x)) as.integer(x) else x
  })

  # Ensure 'type' stays quoted
  if (!is.null(pheno$type)) {
    pheno$type <- as.character(pheno$type)
  }

  # Get filename from the 'name' column
  tmp_name <- gsub("[^A-Za-z0-9_-]", "_", pheno$name)
  file_name <- file.path(output_dir, paste0(tmp_name, ".yaml"))

  # Write YAML as string (preserves formatting)
  yaml_text <- as.yaml(pheno)
  writeLines(yaml_text, con = file_name)
}

```
{% endhighlight %}
