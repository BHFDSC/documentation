---
layout: default
title: Deaths - Cause of Death
nav_order: 2
parent: Deaths
grand_parent: Curated Data
permalink: /curated_data/deaths/deaths_cause_of_death
---

# Deaths - Cause of Death

The 'deaths_cause_of_death' table is a long format dataframe compiled from the . Curation steps are applied such that the final table includes the categorisation of the causes of death (either **underlying** [from S_UNDERLYING_COD_ICD10] or **contributory** [from S_COD_CODE_1,…, S_COD_CODE_15]), and the 3-digit (broad category) and 4-digit (specific category) ICD-10 cause of death codes for the cause of death recorded for each individual. Non-alphanumeric characters are removed from the cause of death codes, and rows where the code column is null, or an empty string, are filtered out, ensuring only valid codes are retained.

The output table includes 5 columns:
-	**person_id**
-	**date_of_death**
-	**cod_position**: indicates whether the cause of death code is underlying (from s_underlying_cod_icd10) or contributory (from s_cod_code_1,…s_cod_code15)
-	**cod_digits**: indicates whether the cause of death code is the three- or four-digit ICD-10 code
-	**code**: the ICD-10 cause of death code itself

## Example

| person_id | date_of_death | cod_position | cod_digits | code |
| --- | --- | --- | --- | --- |
| A | 20120411 | Underlying | 3 | J18 |
| A | 20120411 | Underlying | 4 | J189 |
| A | 20120411 | Contributory_1 | 3  | J18 |
| A | 20120411 | Contributory_1 | 4 | J189 |
| A | 20120411 | Contributory_2 | 3 | I10 |
| A | 20120411 | Contributory_2 | 4 | I101 |
| B | 20030504 | Underlying | 3 | C34 |
| B | 20030504 | Underlying | 4 | C349 |
| B | 20030504 | Contributory_1 | 3 | C34 |
| B | 20030504 | Contributory_1 | 4 | C349 |




The table is saved to the DSA schema **dsa_391419_j3w9t_collab**. The archived_on_date is in the format YYYY_MM_DD.

{: .highlight-title }
> Table Name
>
> >
> hds_curated_assets__deaths_cause_of_death_archived_on_date
> 

The below code will load the deaths_cause_of_death table as at October 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f'dsa_391419_j3w9t_collab'
demographics_table = spark.table(f'{dsa}.hds_curated_assets__deaths_cause_of_death_2024_10_01')
```
{% endhighlight %}
