---
layout: default
title: HES APC - Procedures
parent: HES APC
grand_parent: Curated Assets
nav_order: 2
permalink: /curated_assets/hes_apc/hes_apc_procedures
---

# HES APC - Procedures

<a href="https://github.com/BHFDSC/hds_curated_assets/blob/main/D08-hes_apc.py" class="btn btn-primary fs-5 mb-4 mb-md-0 mr-2" target="_blank">View code on GitHub</a>

The *hes_apc_procedures* asset is curated from the latest archived version of the HES APC procedures table (hes_apc_otr_all_years_archive). The output is a long-format table where each row represents an individual three-digit or four-digit OPCS procedure code (opertn_01, …, opertn_nn) associated with a specific individual and hospital episode. Procedure codes are cleaned by removing non-alphanumeric characters and rows where codes are null, or an empty string, are removed ensuring only valid OPCS codes are retained. Both three-digit procedure codes and their corresponding four-digit variants (where available) are represented, ensuring consistency across code granularities. 
The resulting table includes 10 columns: 6 identifier columns (person ID, episode key, episode start date, episode end date, procedure date, admission date and discharge date) and 3 columns describing the procedure code and position:

-	**code**: the OPCS procedure code
-	**code_digits**: indicates whether the procedure code is the three- or four-digit version
-	**position**: indicates the position of the procedure within the episode (eg., 1–n, corresponding to opertn_01, opertn_02, …)

## Example

| epikey | person_id | position | procedure_date | code | code_digits | epistart | epiend | admidate | disdate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 178954263574 | A | 1 | 2009-03-11 | R18 | 3 | 2009-03-11 | 2009-03-13 | 2009-03-11 | 2009-03-13 |
| 178954263574 | A | 1 | 2009-03-11 | R182 | 4 | 2009-03-11 | 2009-03-13 | 2009-03-11 | 2009-03-13 |
| 178954263574 | A | 2 | 2009-03-11 | Y81 | 3 | 2009-03-11 | 2009-03-13 | 2009-03-11 | 2009-03-13 |
| 178954263574 | A | 2 | 2009-03-11 | Y811 | 4 | 2009-03-11 | 2009-03-13 | 2009-03-11 | 2009-03-13 |
| 178954263574 | A | 3 | 2009-03-13 | Y84 | 3 | 2009-03-13 | 2009-03-15 | 2009-03-13 | 2009-03-15 |
| 178954263574 | A | 3 | 2009-03-13 | Y841 | 4 | 2009-03-13 | 2009-03-15 | 2009-03-13 | 2009-03-15 |
| 559478246553 | B | 1 | 09/12/2000 | X29 | 3 | 2000-12-09 | 2000-12-09 | 2000-12-09 | 2000-12-09 |
| 559478246553 | B | 1 | 09/12/2000 | X298 | 4 | 2000-12-09 | 2000-12-09 | 2000-12-09 | 2000-12-09 |




The table is saved to the DSA schema ****. The archived_on_date is in the format **YYYY_MM_DD**.

{: .highlight-title }
> Table Name
>
> >
> hds_curated_assets__hes_apc_procedure_archived_on_date

The below code will load the hes_apc_diagnosis table as at October 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f''
hes_apc_procedure = spark.table(f'{dsa}.hds_curated_assets__hes_apc_procedure_2024_10_01')
```
{% endhighlight %}
