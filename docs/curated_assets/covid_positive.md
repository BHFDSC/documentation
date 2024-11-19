---
layout: default
title: Covid Positive
parent: Curated Assets
nav_order: 3
permalink: /docs/curated_assets/covid_positive
---

# Covid Positive

The Covid Positive table is a consolidated table for positive COVID-19 case records derived from antigen testing, primary and secondary care data (including SGSS, Pillar 2 antigen testing, GDPPR, HES APC (diagnosis) and CHESS). Positive COVID-19 records are extracted from each dataset and records with a distinct person ID and non-null dates are retained. The tables from each extraction are then combined to create a unified dataset of all COVID-19 positive records. The final table includes six columns: person_id, date, code, description, covid_status (confirmed/suspected) and data_source. 

{: .note }
The methodology for curating the table is further outlined <a href="https://www.thelancet.com/journals/landig/article/PIIS2589-7500(22)00091-7/fulltext" target="_blank">in this paper</a>.


The table is saved to the DSA schema **dsa_391419_j3w9t_collab**. The archived_on_date is in the format **YYYY_MM_DD**.

{: .highlight-title }
> Table Name
>
> >
> hds_curated_assets__covid_positive_archived_on_date

The below code will load the hes_apc_diagnosis table as at October 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f'dsa_391419_j3w9t_collab'
demographics_table = spark.table(f'{dsa}.hds_curated_assets__covid_positive_2024_10_01')
```
{% endhighlight %}
