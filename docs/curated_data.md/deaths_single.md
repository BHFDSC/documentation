---
layout: default
title: Deaths Single
nav_order: 1
parent: Deaths
grand_parent: Curated Data
permalink: /curated_data/deaths/deaths_single
---

# Deaths Single 

The deaths_single table takes the latest archived version of the Civil Registration of Deaths table and curates it such that the output contains a single record of death for each unique person ID. Initially, rows in which the person ID is null are removed. Records are subsequently grouped by person ID and ordered by (earliest) registration date, date of death and underlying cause of death. The first record of these records is retained and any duplicate records for the same person are dropped based on this criterion.

The table is saved to the DSA schema **dsa_391419_j3w9t_collab**. The archived_on_date is in the format **YYYY_MM_DD**.

{: .highlight-title }
> Table Names
>
> >
> hds_curated_assets__deaths_single_archived_on_date

The below code will load the deaths_single table as at October 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f'dsa_391419_j3w9t_collab'
demographics_table = spark.table(f'{dsa}.hds_curated_assets__deaths_single_2024_10_01')
```
{% endhighlight %}
