---
layout: default
title: Patient IDs
parent: Curated Data
nav_order: 5
permalink: /docs/curated_data/patient_ids
---

# Patient IDs

There are currently 2 distinct types of Patient IDs provided in our datasets provisioned in the NHS England SDE. These are NHS_NUMBER_DEID and PERSON_ID_DEID. These 2 IDs are used to link various datasets e.g. to link GDPPR (NHS_NUMBER_DEID) to HES APC (PERSON_ID_DEID), however it is important to know that these fields are derived differently.

- **NHS_NUMBER_DEID**:
  - This is a tokenized (de-identified) version of the patient NHS Number. 
- **PERSON_ID_DEID**:
  - This is a tokenized version of Person_ID, which is comprised of three levels:
 
| --- | --- |
| **1) NHS number**:  From Personal Demographic Service (PDS) records - the collection of all NHS numbers and patients’ demographic information. | <img src="https://bhfdsc.github.io/documentation/assets/images/linkable_all_tables.png" alt="linkable" style="width: 900px; height: auto;"> |
| **2) Master Person Service (MPS) ID**:  From the MPS bucket of previously unmatched records that could not be identified as records with an NHS number in PDS. If sufficient demographic information is provided a new MPS ID can be created and added to the MPS bucket. | <img src="https://bhfdsc.github.io/documentation/assets/images/linkable_personid_tables.png" alt="linkable" style="width: 1100px; height: auto;"> |
| **3) One-time-use ID**: IF neither an NHS number or an MPS ID could be assigned. | <img src="https://bhfdsc.github.io/documentation/assets/images/not_linkable.png" alt="linkable" style="width: 1100px; height: auto;"> |


MPS takes certain demographic information contained in a person’s health and care records and matches it to their unique NHS number to confirm their identity. The collection of all NHS numbers and patients’ demographic information is contained in the Personal Demographics Service (PDS) data set.

Where a perfect match of NHS number and date of birth cannot be found between a record of interest and any of the PDS records, more complex algorithms are used to compare partial demographic information to identify the most likely PDS record corresponding to the query record. These algorithms are referred to as alphanumeric and algorithmic trace, but in HES only the latter is used. In the algorithmic trace step, the single queried record is compared to all records in PDS. The comparisons involve some demographic information (date of birth, name, gender and postcode) and are scored based on similarity. If the similarity is deemed acceptable, the matched record is returned. Otherwise, the algorithm proceeds to look for similarities of the record of interest with some previously unmatched records, stored in the MPS record bucket, a separate data set. If no match is found in the MPS record bucket then a “One-time-use ID” is provided.

An in-depth guide from NHS Digital on how the PERSON_ID field is derived is provided <a href="https://digital.nhs.uk/services/personal-demographics-service/master-person-service/the-person_id-handbook#:~:text=This%20handbook%20aims%20to%20provide,and%20how%20to%20interpret%20the" target="_blank">here.</a>

## Example of Data Linkage Behaviour

![Example of Data Linkage Behaviour](https://bhfdsc.github.io/documentation/assets/images/example_data_linkage.png)

## token_pseudo_id_lookup table

**Path**: dars_nic_391419_j3w9t.token_pseudo_id_lookup

**Documentation**:
The token_pseudo_id_lookup table provides indicator columns for the type of pseudonymised identifier.

This table determines whether the pseudonymised identifier corresponds to a valid NHS number, Master Person Service (MPS) ID, or a one-time-use ID. Please refer to the <a href="https://digital.nhs.uk/services/personal-demographics-service/master-person-service/the-person_id-handbook#:~:text=This%20handbook%20aims%20to%20provide,and%20how%20to%20interpret%20the" target="_blank">NHS England Person_ID handbook</a> for further information about these types of Person_ID.

The table covers all pseudonymised identifiers (e.g., NHS_NUMBER_DEID, PERSON_ID_DEID) that feature in the data sharing agreement.

The pseudo_id column uniquely identifies each row in the table. As at 2024-06-04, the token_pseudo_id_lookup table included ~450 million rows (i.e., distinct pseudo_id).

The table is partitioned on the first_char column (the first character of the pseudo_id column) and this column can be used in addition to the pseudo_id column when joining the token_pseudo_id_lookup table to other tables to improve the efficiency of the join by reducing the shuffling required.

The token_pseudo_id_lookup table will be updated each month by the NHS England Data Wrangler team inline with monthly batch provisioning and updates, with any new pseudonymised identifiers inserted into the table, which will be stored in the live (read-only) database (dars_nic_391419_j3w9t) for the data sharing agreement

For further information about the token_pseudo_id_lookup table click [here](https://bhfdsc.github.io/documentation/assets/images/hds_tb_token_pseudo_id_lookup.pdf). 
