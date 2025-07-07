#######################################
###### Batch uploading phenotypes #####
#######################################

# REFERENCE:
#
# Please see the ConceptLibraryClient github here:
#   - Github: https://github.com/SwanseaUniversityMedical/ConceptLibraryClient
#   - OR, read the Manuscripts/Vignettes by running the following:
#
#       browseVignettes('ConceptLibraryClient')
#


# This script automates the process of uploading multiple phenotype definitions to the
# HDR UK Phenotype Library via the API. The script scans a local directory (phenotype_yamls)
# for YAML files, copies each one to an output directory and then uploads the phenotype via
# the ConceptLibraryClient package. Confirmation messages are provided after each
# successful upload.


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
