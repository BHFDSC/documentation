---
layout: default
title: Methodology
nav_order: 2
parent: Key Patient Characteristics
grand_parent: Curated Assets
permalink: /curated_assets/kpcs/methodology
---

# Methodology

[View code on GitHub](Code Repo for KPCs){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }

[Code Repo for KPCs]: [https://github.com/BHFDSC](https://github.com/BHFDSC)


---

## Multisource Tables

The multisource tables consolidate a characteristic from multiple data sources. The data sources included so far are below. We plan to add data sources to this resource when the need arises - sources included so far have been project led. 

| Data Source    | Date of Birth | Sex | Ethnicity | LSOA | Record Date                  |
|----------------|-----|-----|-----------|------|------------------------------|
| GDPPR - all archived versions          | ✔ YEAR_OF_BIRTH  | ✔ SEX  | ✔ ETHNIC        | ✔ LSOA   | REPORTING_PERIOD_END_DATE    |
| GDPPR - snomed codes   |     |     | ✔         |      | RECORD_DATE (DATE if missing)|
| HES APC        | ✔ MYDOB  | ✔ SEX  | ✔ ETHNOS        | ✔ LSOA11    | EPISTART                     |
| HES OP         | ✔ APPTAGE_CALC | ✔ SEX  | ✔ ETHNOS        | ✔ LSOA11   | APPTDATE                     |
| HES AE         | ✔ ARRIVALAGE_CALC  | ✔ SEX  | ✔ ETHNOS        | ✔ LSOA11   | ARRIVALDATE                  |
| SSNAP          | ✔ S1AGEONARRIVAL | ✔ S1GENDER  |           | ✔ LSOA_OF_RESIDENCE   | S1FIRSTARRIVALDATETIME       |
| Vaccine status | ✔ MYDOB   |     |           | ✔ LSOA   | RECORDED_DATE                |



* Date of Birth is only ever accurate to month and year and imputed with Day = 01
* For HES OP, HES AE and SSNAP, an imputation algorithm is applied to derive Date of Birth from Age. Age represents completed years therefore, an upward adjustment of 0.5 years has been applied to approximate fractional ages.
* LSOA is sourced from LSOA as at 2011. Please note that we do not currently clean LSOA's that are not LSOA 2011. If the demographics table includes LSOAs from the 2001 census, these are derived from the original data sources. We are developing a version that will align 2001 LSOAs with their 2011 equivalents, ensuring that discrepancies in 2001 LSOA data within the 2011 columns are addressed and cleaned up.

{: .new}
GDPPR is derived from a JOURNALS (coded data) and PATIENTS (demographic) table whereby the latter contains the most up-to-date view of a patient’s demographics. Thus, demographics in GDPPR are not record specific. Using the latest batch of the extract will include the characteristic only as at its most recent recording but accessing all batches allows a person’s full history to be captured. 

{: .highlight }
**No data cleaning is ever applied to the multisource table.**

### Example

For Person A and B we find all date of birth records that exist in GDPPR, HES APC, HES AE, HES OP, SSNAP and Vaccine Status as at the archived_on date **2024-04-25**.
They are then harmonised and concatenated into the table **hds_curated_assets__date_of_birth_multisource_2024_04_25**:


| ROW_NUM | PERSON_ID | DATE_OF_BIRTH | RECORD_DATE | DATA_SOURCE |
|---------|-----------|---------------|-------------|-------------|
| 1       | A         | 1975-09-01    | 2020-05-18  | GDPPR       |
| 2       | A         | 1975-09-01    | 2021-01-03  | GDPPR       |
| 3       | A         | 1975-09-01    | 2023-08-09  | GDPPR       |
| 4       | B         | 1980-10-01    | 2022-10-02  | GDPPR       |
| 5       | B         | 1980-10-01    | 2024-05-09  | GDPPR       |
| 6       | A         | 1975-09-01    | 1800-01-01  | HES APC     |
| 7       | A         | 1975-09-01    | 1995-04-14  | HES APC     |
| 8       | A         | 1975-09-01    | 2024-02-20  | HES APC     |
| 9       | B         | 1985-10-01    |             | HES APC     |
| 10      | B         | 1980-10-01    | 2023-12-13  | HES APC     |
| 11      | B         | 1981-04-11    | 2003-10-11  | HES AE      |
| 12      | B         | 1980-07-02    | 2015-01-02  | HES AE      |
| 13      | B         | 1981-03-09    | 2023-09-09  | HES AE      |
| 14      | A         | 1977-03-01    | 2010-09-01  | HES OP      |
| 15      | B         | 1982-05-02    | 2004-11-02  | HES OP      |
| 16      | A         | 1975-12-01    | 2023-06-01  | SSNAP       |
| 17      | A         | 1975-12-12    | 2023-06-12  | SSNAP       |
| 18      | A         | 1976-03-03    | 2023-09-03  | SSNAP       |
| 19      | A         | 1976-06-01    | 2023-12-01  | SSNAP       |
| 20      | A         | 1975-09-01    | 2022-01-01  | Vaccine Status       |



### Mapping

Codes have been mapped to their descriptions for Sex and Ethnicity, by data source.

For example:

| sex_code | sex_description                                                                         | sex |
|----------|-----------------------------------------------------------------------------------------|-----|
| 0        | Not known (not recorded)                                                                | NULL |
| 1        | Male                                                                                    | M   |
| 2        | Female                                                                                  | F   |
| 9        | Not specified (indeterminate, i.e. unable to be classified as either male or female)   | I   |


| ethnicity_raw_code | ethnicity_raw_description                                  | ethnicity_18_code | ethnicity_18_group           | ethnicity_5_group       |
|--------------------|------------------------------------------------------------|-------------------|------------------------------|-------------------------|
| 93941000000        | Greek Cypriot – ethnic finding 2001 census (finding)       | C                 | Any other White background   | White                   |
| C                  | Any other White background                                 | C                 | Any other White background   | White                   |
| 7                  | Chinese                                                    | R                 | Chinese                      | Asian or Asian British  |
| ...                | ...                                                        | ...               | ...                          | ...                     |

---

## Individual Tables

We apply data cleaning, data restrictions and finally a selection algorithm to produce a one-record-per-person table.

**Data Cleaning**

* Characteristic of interest must be valid i.e. Not Null/NA or blank. Codes that were mapped to Not Given/Stated/Known or Unknown are considered invalid. 

* Record date must be valid i.e. Not Null/NA or blank. 

* Additionally for Date of Birth: Date of Birth must be ≤ Record Date

### Example

| ROW_NUM | PERSON_ID | DATE_OF_BIRTH | RECORD_DATE | DATA_SOURCE |
|---------|-----------|---------------|-------------|-------------|
| 6       | A         | 1975-09-01    | 1800-01-01  | HES APC     |
| 9       | B         | 1985-10-01    |             | HES APC     |

We remove row 6 because Date of Birth is not ≤ Record Date.

We remove row 9 because the Record Date is NULL.


**Data Resctictions** <span class="label label-purple">Available as function arguments</span>

* Record date must be ≥ 1900-01-01 

* Record date must be ≤ most recent archived_on date (the max archived_on date for each data source is considered)


### Example

| ROW_NUM | PERSON_ID | DATE_OF_BIRTH | RECORD_DATE | DATA_SOURCE |
|---------|-----------|---------------|-------------|-------------|
| 5       | B         | 1980-10-01    | 2024-05-09  | GDPPR       |

We remove row 5 because the Record Date is ≥ archived_on date of 2024-04-25.


{: .note }
Want to use our selection algorithm but include only a subset of data sources or define your own minimum record date? Use our functions!


**Selection Algorithm**

Finally, we apply a selection algorithm to pick one record per person.

Depending on the characteristic, recency or data source is prioritised over the other for this selection. Time variant characteristics are selected differently to time invariant.

| Demographic data | Data sources priority levels | Priority |
|------------------|----------------------------------------------|----------|
| Date of Birth    | GDPPR = 1<br>HES APC = 2<br>HES OP = HES AE = 3 <br> Remaining data sources = 4| Data source > Recency |
| Sex              | GDPPR = 1<br>HES APC = 2<br>HES OP = HES AE = 3 <br> Remaining data sources = 4| Data source > Recency |
| Ethnicity        | GDPPR SNOMED = 1<br>GDPPR = 2<br>HES APC = 3<br>HES OP = HES AE = 4 <br> Remaining data sources = 5 | Data source > Recency |
| LSOA             | GDPPR = HES APC = HES OP = HES AE = SSNP = Vaccine Status = ... = 1  | Most recent record (all data sources have the same priority index) |

* For Date of Birth, Sex and Ethnicity we prioritise primary care over secondary care. We also prioritise HES APC before HES OP and HES AE. Within data sources, we prioritise receny. Prioritising data source > recency means that we do not necessarily pick the most recent record available for each person. Instead, we pick the most recent record available in GDPPR and if there are no records in GDPPR we pick the most recent in HES APC and so on.

* For LSOA we prioritise the most recent record regardless of source.

{: .note }
We prioritise SNOMED Ethnicity codes before GDPPR Ethnicity codes. Find out more about ethnicity in health research <a href="https://www.nature.com/articles/s41597-024-02958-1" target="_blank">here</a>.

### Example

We apply our selection algorithm to the records remaining below:

| ROW_NUM | PERSON_ID | DATE_OF_BIRTH | RECORD_DATE | DATA_SOURCE |
|---------|-----------|---------------|-------------|-------------|
| 1       | A         | 1975-09-01    | 2020-05-18  | GDPPR       |
| 2       | A         | 1975-09-01    | 2021-01-03  | GDPPR       |
| 3       | A         | 1975-09-01    | 2023-08-09  | GDPPR       |
| 4       | B         | 1980-10-01    | 2022-10-02  | GDPPR       |
| 7       | A         | 1975-09-01    | 1995-04-14  | HES APC     |
| 8       | A         | 1975-09-01    | 2024-02-20  | HES APC     |
| 10      | B         | 1980-10-01    | 2023-12-13  | HES APC     |
| 11      | B         | 1981-04-11    | 2003-10-11  | HES AE      |
| 12      | B         | 1980-07-02    | 2015-01-02  | HES AE      |
| 13      | B         | 1981-03-09    | 2023-09-09  | HES AE      |
| 14      | A         | 1977-03-01    | 2010-09-01  | HES OP      |
| 15      | B         | 1982-05-02    | 2004-11-02  | HES OP      |
| 16      | A         | 1975-12-01    | 2023-06-01  | SSNAP       |
| 17      | A         | 1975-12-12    | 2023-06-12  | SSNAP       |
| 18      | A         | 1976-03-03    | 2023-09-03  | SSNAP       |
| 19      | A         | 1976-06-01    | 2023-12-01  | SSNAP       |
| 20      | A         | 1975-09-01    | 2022-01-01  | Vaccine Status       |


For date of birth we prioritise data source > receny thus our final individual table for date of birth is **hds_curated_assets__date_of_birth_individual_2024_04_25**:

| ROW_NUM | PERSON_ID | DATE_OF_BIRTH | RECORD_DATE | DATA_SOURCE |
|---------|-----------|---------------|-------------|-------------|
| 3       | A         | 1975-09-01    | 2023-08-09  | GDPPR       |
| 4       | B         | 1980-10-01    | 2022-10-02  | GDPPR       |


### Ties

Conflicts can occur at the same record date at data sources that have the same priority index.

To maintain the one row per person requirement:

* ties are flagged
  
* all ties are pulled into an array
  
* one record is randomly selected

### Example

The following LSOA's were found for Person A as at the most recent record date available for that person:

| person_id | lsoa      | record_date | data_source |
|-----------|-----------|-------------|-------------|
| A         | E01000001 | 2020-05-18  | GDPPR       |
| A         | E01000002 | 2020-05-18  | GDPPR       |


We randomly select one of the values, create a column that indicates this lsoa was picked from a conflict and retain the original conflicting lsoa's in an array.

| person_id | lsoa      | record_date | data_source | lsoa_tie_flag | lsoa_tie_values      |
|-----------|-----------|-------------|-------------|----------------|----------------------|
| A         | E01000002 | 2020-05-18  | GDPPR       | 1             | [E01000001, E01000002] |


{: .warning-title }
> Need to know
>
> Ties affect a very small % of persons once the selection algorithm has been applied. You should decide how you want to proceed with these. The random selection could be carried forward, the tie set to NULL or your own algorithm applied to select an appropriate value.

---

### Demographics Table

Finally, we combine the indivdual tables for date of birth, sex, ethnicity and lsoa into one demographics table.

This table also maps lsoa to the appopriate region and IMD (2019) deciles and quintiles, contains a death flag and date of death and a gdppr flag and minimum gdppr record date.

| person_id | date_of_birth | sex_code | sex | ethnicity_raw_code | ethnicity_raw_description                                        | ethnicity_18_code | ethnicity_18_group | ethnicity_5_group      | lsoa      | region          | imd_decile | imd_quintile | death_flag | date_of_death | in_gdppr | gdppr_min_date | date_of_birth_tie_flag | sex_tie_flag | ethnicity_18_tie_flag | ethnicity_5_tie_flag | lsoa_tie_flag |
|-----------|----------------|----------|-----|---------------------|------------------------------------------------------------------|-------------------|--------------------|------------------------|-----------|-----------------|------------|--------------|------------|---------------|-----------|----------------|------------------------|--------------|-----------------------|----------------------|----------------|
| A         | 1975-09-01     | 1        | M   | 92461000000105     | Pakistani or British Pakistani - ethnic category 2001 census (finding) | J                 | Pakistani          | Asian or Asian British | E01000001 | City of London  | 9          | 5            | 0          |               | 1         | 2020-01-01     | 0                      | 0            | 0                     | 0                    | 1              |
| B         | 1980-10-01     | 2        | F   | A                   | British                                                         | A                 | British            | White                  | E01025616 | East Midlands   | 7          | 4            | 0          |               | 1         | 2021-02-02     | 0                      | 0            | 0                     | 0                    | 0              |



* Note that there is a small group of people who have died but have no date of death.
