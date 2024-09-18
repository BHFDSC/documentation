---
layout: default
title: ECDS
parent: Patient IDs
nav_order: 5
permalink: /docs/curated_data/patient_ids
---

# Patient IDs

There are currently 2 distinct types of Patient IDs provided in our datasets provisioned in the NHS England SDE. These are NHS_NUMBER_DEID and PERSON_ID_DEID. These 2 IDs are used to link various datasets e.g. to link GDPPR (NHS_NUMBER_DEID) to HES APC (PERSON_ID_DEID), however it is important to know that these fields are derived differently.

- **NHS_NUMBER_DEID**:
  - This is a tokenized version of the Patient NHS Number.
 
- **PERSON_ID_DEID**:
  - PERSON_ID is derived from the outputs of the Master Person Service (MPS).

MPS takes certain demographic information contained in a person’s health and care records and matches it to their unique NHS number to confirm their identity. The collection of all NHS numbers and patients’ demographic information is contained in the Personal Demographics Service (PDS) data set.

Where a perfect match of NHS number and date of birth cannot be found between a record of interest and any of the PDS records, more complex algorithms are used to compare partial demographic information to identify the most likely PDS record corresponding to the query record. These algorithms are referred to as alphanumeric and algorithmic trace, but in HES only the latter is used. In the algorithmic trace step, the single queried record is compared to all records in PDS. The comparisons involve some demographic information (date of birth, name, gender and postcode) and are scored based on similarity. If the similarity is deemed acceptable, the matched record is returned. Otherwise, the algorithm proceeds to look for similarities of the record of interest with some previously unmatched records, stored in the MPS record bucket, a separate data set. If no match is found in the MPS record bucket then a “One-time-use ID” is provided.

Therefore PERSON_ID_DEID is a tokenized ID comprised of 3 different ID types, with the following linkage behaviours:

1. NHS_NUMBER: linkable to all other datasets
2. MPS_ID: linkable to other datasets with PERSON_ID_DEID
3. One-time-use ID: not linkable within or across datasets

An in-depth guide from NHS Digital on how the PERSON_ID field is derived is provided here. 

## Current position:

There are ~ 109M distinct IDs across the datasets that make up the skinny patient table (GDPPR, HES APC/Outpatients/A&E and Deaths). From the UpSet plot below we can see that there are 12M IDs that are unique to HES Outpatients, and similarly 9M and 7M IDs unique to HES APC and HES A&E respectively. To what extent these volumes are driven by MPS_IDs and One-time-use IDs is not currently known, and we cannot calculate this based on the data as it stands in our TRE. For this reason, we advise users to limit their study cohorts to IDs that appear in the GDPPR dataset (where feasible for their analysis). This will ensure that only IDs that are actually linkable will be included.

## Future:

In future NHS Digital aim to provide flags to indicate which IDs within a PERSON_ID_DEID dataset are NHS_NUMBER, MPS_ID and One-time-use IDs. This will allow us to quantify the impact of MPS_IDs and One-time_use IDs on all datasets that use PERSON_ID_DEID. It would also allow users to exclude these IDs from cohort selection stages of research projects.
