---
layout: default
title: HES APC - Diagnosis
parent: HES APC
grand_parent: Curated Data
nav_order: 1
permalink: /curated_data/hes_apc/hes_apc_diagnosis
---

# HES APC - Diagnosis

The *hes_apc_diagnosis* table is curated from the latest archived version of the HES APC table (hes_apc_all_years_archive). The output is a long format table where each row represents an individual three- ((DIAG_3_01,…, DIAG_3_20) or four-digit (DIAG_4_01,…, DIAG_4_20) ICD-9 or ICD-10 diagnosis code associated with a specific individual and hospital episode. Non-alphanumeric characters and trailing Xs are removed from the diagnosis codes, and rows where codes are null, or an empty string, are removed ensuring only valid codes are retained. The resulting table includes 10 columns: 6 identifier columns (person ID, episode key, episode start date, episode end date, admission date and discharge date) and 4 columns capturing the diagnosis code and position (diag_column, code, diag_digits, diag_position).

-	**diag_column**: the name of the original diagnosis column (eg., DIAG_3_01)
-	**code**: the actual ICD diagnosis code
-	**diag_digits**: indicates whether the ICD code is the three- or four-digit version
-	**diag_position**: indicates the position of the diagnosis code (eg., 1-20)


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



The table is saved to the DSA schema **dsa_391419_j3w9t_collab**. The archived_on_date is in the format **YYYY_MM_DD**.

{: .highlight-title }
> Table Name
>
> >
> hds_curated_assets__hes_apc_diagnosis_archived_on_date

The below code will load the deaths_single table as at October 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f'dsa_391419_j3w9t_collab'
demographics_table = spark.table(f'{dsa}.hds_curated_assets__hes_apc_diagnosis_2024_10_01')
```
{% endhighlight %}
