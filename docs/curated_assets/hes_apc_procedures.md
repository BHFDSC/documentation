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

The *hes_apc_procedures* asset is curated from the latest archived version of the HES APC procedures table (hes_apc_otr_all_years_archive). The output is a long-format table where each row represents an individual three-digit or four-digit OPCS procedure code (opertn_01, …, opertn_nn) associated with a specific individual and hospital episode. Procedure codes are cleaned by removing non-alphanumeric characters (including punctuation and whitespace) and rows where codes are null, or an empty string, are removed ensuring only valid OPCS codes are retained. Both three-digit procedure codes and their corresponding four-digit variants (where available) are represented, ensuring consistency across code granularities. 
The resulting table includes 10 columns: 6 identifier columns (person ID, episode key, episode start date, episode end date, procedure date, admission date and discharge date) and 3 columns describing the procedure code and position:

-	**code**: the OPCS procedure code
-	**code_digits**: indicates whether the procedure code is the three- or four-digit version
-	**position**: indicates the position of the procedure within the episode (eg., 1–n, corresponding to opertn_01, opertn_02, …)


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
