---
layout: default
title: Submission Instructions
nav_order: 1
parent: Phenotype Library Resources
grand_parent: Resources
permalink: /resources/phenotype_library_resources/submission_instructions
---

# Submission Instructions

The <a href="https://phenotypes.healthdatagateway.org/" target="_blank">HDR UK Phenotype Library</a> is an open access, searchable repository of phenotype definitions that have been developed using electronic health records. It contains structured data and metadata describing each definition, enabling researchers to find, interpret, and re-use them easily. 

All phenotype definitions created or used in the research the BHF Data Science Centre supports are shared via the Phenotype Library, and on each projects <a href="https://github.com/bhfdsc" target="_blank">GitHub repository</a>, in accordance with our <a href="https://bhfdatasciencecentre.org/publication-and-dissemination-policy/" target="_blank">Publication and Dissemination Policy</a> and the CVD-COVID-UK Ways of Working. You can access all the BHF Data Science Centre phenotypes in the Phenotype Library <a href="https://phenotypes.healthdatagateway.org/HDRUK/phenotypes/?collections=20" target="_blank">here</a>, and read our full recommendations for best practice in curating and sharing phenotype definitions <a href="https://zenodo.org/records/10209724" target="_blank">here</a>. 

## Submitting to the Phenotype Library
### Submission materials
The following materials are required to submit phenotype definitions to the library:
- **Code list file**
    - A .csv or .xlsx file containing the clinical terms for each phenotype definition. A separate file is needed for each coding terminology (e.g. SNOMED, ICD-10).
    - Files must be formatted with two columns: a ‘Code’ column containing the codes and a ‘Description’ column containing the clinical terms. An example code list file can be found here.
  
-	**Metadata:** a description of the phenotyping definition, including:
    - authors
    - data sources used in its development
    - associated publications
    - any restrictions (eg. date or sex) on its use
  
An example of a submitted phenotype definition with metadata can be found <a href="https://phenotypes.healthdatagateway.org/HDRUK/phenotypes/PH11/version/22/detail/" target="_blank">here</a>.

### Submission methods
Phenotype definitions can be submitted using the Phenotype Library interface, or via the API. 

 **Submission via the Phenotype Library interface** 
- Request a user account by filling in the form <a href="https://phenotypes.healthdatagateway.org/contact-us/" target="_blank">here</a>.
- Login and access the creation interface <a href="https://phenotypes.healthdatagateway.org/account/login/?next=/create/" target="_blank">here</a>.
- Click *Create* in the *BHF Data Science Centre Phenotype* section
- Complete the submission form:
    - Some fields are optional, but providing as much information/metadata as possible is useful
    - Ensure the *Collections* field is populated with *BHF Data Science Centre* and *Phenotype Library*
    - Code lists are uploaded in the *Clinical Code List* section by creating a new concept. 
- Once you have finalised the form click *Create Phenotype*
- You will be able to view the phenotype definitions you have created in the *My collection* area of your account
- To publish the phenotype definition click into it from the *My collection* area and click *Request publication* in the top right hand corner. This allows users without a Phenotype Library account to view, interact with, or download (but not edit) the phenotype definition.
- The phenotype definition can be edited after it is published, but you will need to re-request its publication in order for the new version to be visible. Editing after publication will generate a new version ID.

More detailed documentation on using the Phenotype Library interface for can be found <a href="https://phenotypes.healthdatagateway.org/documentation/clinical-coded-phenotype-docs" target="_blank">here</a>.

**Submission via the Phenotype Library API** 
The HDR UK Phenotype Library API documentation page can be found <a href="https://phenotypes.healthdatagateway.org/api/v1/" target="_blank">here</a>, and its reference data can be found <a href="https://phenotypes.healthdatagateway.org/reference-data/" target="_blank">here</a>. The Client packages are available in both Python and R. 

To use the API, the metadata for each phenotype definition needs to be compiled into individual YAML files. Instructions for using the API and example files can be found <a href="https://hdruk.app.box.com/folder/308903999662?s=2vr5j4tq0jerp3edpv0kewiqkr2ofu6j" target="_blank">here</a>. Please include the BHF Data Science Centre and Phenotype Library collection IDs (20 and 18, respectively) in each YAML file. 

We have additionally created scripts for formatting codelist files, automating the creation of YAML files, and batch uploading phenotypes. These may be particularly useful for projects with a large number of phenotypes. These can be found here. 

## Additional support
Additional documentation on the Phenotype Library can be found <a href="https://github.com/SwanseaUniversityMedical/concept-library/blob/master/README.md" target="_blank">here</a>. Any questions or problems that occur during the submission process should be directed to the Phenotype Library, via their <a href="https://conceptlibrary.saildatabank.com/contact-us/" target="_blank">contact page</a>.

