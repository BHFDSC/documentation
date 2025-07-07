---
layout: default
title: Batch Uploading Phenotypes
nav_order: 4
parent: Phenotype Library Resources
grand_parent: Resources
permalink: /resources/phenotype_library_resources/batch_uploading_phenotypes
---

# Batch Uploading Phenotypes 
You can find an example R script, along with the necessary supporting files, for uploading a single phenotype to the HDR UK Phenotype Library via the API [here](https://hdruk.app.box.com/folder/308904483606). Uploads can be tested by using the demo server (see login section of the script) before switching to the production environment.

Additionally, we have created an R script that automates the upload process of multiple phenotype definitions to the HDR UK Phenotype Library via its API. It reads all .yaml files from a specified folder, signs in to your Phenotype Library account, and submits each phenotype for upload to the library. The script provides confirmation messages after each successful upload.

The script can be copied below or downloaded [here](https://bhfdsc.github.io/documentation/assets/images/batch_upload_phenotypes.R). 
{% highlight markdown %}
```r
# Install the package & load it into our library namespace
source('./Install.R')

# Source our utility functions
source('./Utils.R')

# USER OPTION: Specifies whether to upload this file to the production server
#              (uses the demo server if set to `FALSE`)
#              (Note: please don't enable unless you do want to upload real
#               data to the production website!)
USE_PROD = FALSE

# Sign in to your Phenotype Library account
# Use the login details below to access the demo site
# - these can be edited to your personal login when uploading to the production server

# NOTE:
  # If you'd rather not store your username/password in a script like this out of security concerns
  # then please remove the username/passwords fields below and you will be prompted by GUI to enter
  # it when the script is ran (check your taskbar if it doesn't pop up immediately)

client = ConceptLibraryClient::Connection$new(
  username='BHF_DEMO_USER',
  password='BhfDataScienceCentre1!',
  url=ifelse(
    USE_PROD,
    ConceptLibraryClient::DOMAINS$HDRUK,
    'https://conceptlibrary.demo.saildatabank.com/'
  )
)

# List all .yaml files in the directory
yaml_files <- list.files(path = 'phenotype_yamls', pattern = '\\.ya?ml$', full.names = TRUE)

# Loop through each YAML file
for (FILE.TO.UPLOAD in yaml_files) {
  message(sprintf('\n---\nProcessing file: %s', FILE.TO.UPLOAD))

  # Copy the file to the output directory
  pheno.file <- copyFileToDir(FILE.TO.UPLOAD, dir = './output')

  # Upload
  result <- try(client$phenotypes$create(pheno.file))
  if (class(result) == 'try-error') {
    message(base::sprintf(
      '\n%s\n^^ An error occurred when attempting to upload the following file: %s',
      result[1], FILE.TO.UPLOAD
    ))
    next  # Skip to next file
  }

  message(base::sprintf(
    '\nSuccessfully uploaded Phenotype File<%s>:\n  - Phenotype ID: %s\n  - Phenotype Version ID: %d\n',
    FILE.TO.UPLOAD, result$id, result$version_id
  ))
}


```
{% endhighlight %}
