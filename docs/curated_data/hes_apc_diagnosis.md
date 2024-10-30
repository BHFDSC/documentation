---
layout: default
title: HES APC - Diagnosis
parent: HES APC
grand_parent: Curated Data
nav_order: 1
permalink: /curated_data/hes_apc/hes_apc_diagnosis
---

# HES APC - Diagnosis

The HES APC Diagnosis table is curated from the latest archived version of the HES APC table. The output is a long format table with three digit (DIAG_3_01,…, DIAG_3_20)  and four digit (DIAG_4_01,…, DIAG_4_20)  ICD-9 or ICD-10 diagnosis codes. Non-alphanumeric characters and trailing Xs are removed from the diagnosis codes, and rows where codes are null, or an empty string, are removed ensuring only valid codes are retained. The resulting table includes 10 columns: 6 ID columns (person ID, episode key, episode start date, episode end date, admission date and discharge date) and 4 columns capturing the diagnosis code and position (diag_column, code, diag_digits, diag_position).

•	**diag_column**: the name of the original diagnosis column (eg., DIAG_3_01)
•	**Code**: the actual ICD diagnosis code
•	**Diag_digits**: indicates whether the ICD code is the three- or four-digit version
•	**Diag_position**: indicates the position of the diagnosis code (eg., 1-20)


## Example

| person_id | epikey | epistart | epiend | admidate | disdate | diag_column | code | diag_digits | diag_position |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_3_01 | H25 | 3 | 1 |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_3_02 | H40 | 3 | 2 |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_3_03 | H53 | 3 | 3 |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_4_01 | H258 | 4 | 1 |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_4_02 | H402 | 4 | 2 |
| A | 178954263574 | 2021-06-24 | 2021-06-24 | 2021-06-24 | 2021-06-24 | DIAG_4_03 | H533 | 4 | 3 |
| B | 559478246553 | 2020-10-07 | 2020-10-08 | 2020-10-07 | 2020-10-08 | DIAG_3_01 | T85 | 3 | 1 |
| B | 559478246553 | 2020-10-07 | 2020-10-08 | 2020-10-07 | 2020-10-08 | DIAG_3_02 | Y84 | 3 | 2 |
