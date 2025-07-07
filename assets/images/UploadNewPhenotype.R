# REFERENCE:
#
# Please see the ConceptLibraryClient github here:
#   - Github: https://github.com/SwanseaUniversityMedical/ConceptLibraryClient
#   - OR, read the Manuscripts/Vignettes by running the following:
#
#       browseVignettes('ConceptLibraryClient')
#


# Install the package & load it into our library namespace
source('./Install.R')


# Source our utility functions
source('./Utils.R')


# USER OPTIONS HERE:
# 1. Specifies whether to upload this file to the production server (uses the demo server if set to `FALSE`)
#    (Note: please don't enable unless you do want to upload real data to the production website!)
USE_PROD = FALSE
# 2. The name of the file describing a Phenotype to upload to the Phenotype Library website
FILE.TO.UPLOAD = '../phenotypes/pheno1.yaml'


# Sign in to your Phenotype Library account
#  > Website URL: https://phenotypes.healthdatagateway.org/
#
# NOTE:
#   -> If you'd rather not store your username/password in a script like this out of security concerns
#      then please remove the username/passwords fields below and you will be prompted by GUI to enter
#      it when the script is ran (check your taskbar if it doesn't pop up immediately)
#
client = ConceptLibraryClient::Connection$new(
  # USER REQUIRED: Enter your username
  username='BHF_DEMO_USER',

  # USER REQUIRED: Enter your password
  password='BhfDataScienceCentre1!',

  # This will select the website to use depending on your "USE_PROD" selection
  url=ifelse(
    USE_PROD,
    ConceptLibraryClient::DOMAINS$HDRUK,
    'https://conceptlibrary.demo.saildatabank.com/'
  )
)


# Try to upload the file
#
# NOTE:
#   -> The reason we're cloning the file to the output directory is that it will be updated in-place with
#      the resulting Phenotype data if accepted by the user
#   -> See the `Utilities.R` file for implementation details
#

## Copy the file to the new output directory
pheno.file = copyFileToDir(FILE.TO.UPLOAD, dir='./output')

## Create / Upload the Phenotype to the website
result = try(client$phenotypes$create(pheno.file))
if (class(result) == 'try-error') {
  stop(base::sprintf(
    '\n%s\n^^ An error occurred when attempting to upload the following file: %s',
    result[1], FILE.TO.UPLOAD
  ))
}

message(base::sprintf(
  '\nSuccessfully uploaded Phenotype File<%s>:\n  - Phenotype ID: %s\n  - Phenotype Version ID: %d\n',
  FILE.TO.UPLOAD, result$id, result$version_id
))
