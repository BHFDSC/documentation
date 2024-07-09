---
layout: default
title: How to use
nav_order: 1
parent: Key Patient Characteristics
grand_parent: Curated Assets
permalink: /curated_assets/kpcs/how_to_use
---

# Quick Start

All kpc tables will be curated at the end of every month, following the NHS Data Wranglers provisioning runs. 

All tables are saved to the DSA schema **dsa_391419_j3w9t_collab**.

The archived_on_date is in the format **YYYY_MM_DD**.


{: .highlight-title }
> Table Names
>
> 
> **Demographics table**
> >
> hds_curated_assets__demographics_archived_on_date
>
> **Multisource tables**
> >
> hds_curated_assets__date_of_birth_multisource_archived_on_date
> hds_curated_assets__sex_multisource_archived_on_date
> hds_curated_assets__ethnicity_multisource_archived_on_date
> hds_curated_assets__lsoa_multisource_archived_on_date
>
> **Individual tables**
> >
> hds_curated_assets__date_of_birth_individual_archived_on_date
> hds_curated_assets__sex_individual_archived_on_date
> hds_curated_assets__ethnicity_individual_archived_on_date
> hds_curated_assets__lsoa_individual_archived_on_date


The example below will load the demographics table as at April 2024 using PySpark:

{% highlight markdown %}
```python
import pyspark.sql.functions as f
dsa = f'dsa_391419_j3w9t_collab'
demographics_table = spark.table(f'{dsa}.hds_curated_assets__demographics_2024_04_25')
```
{% endhighlight %}


# Available Versions

Note that on occassions where not all underlying data sources are available as at the most recent archived_on_date, we fall back to the next most recent version, e.g. GDPPR, Deaths and Vaccine Status were not provisioned as at 2024-06-04 so their versions as at 2024-05-28 are used instead.

| Month Year       | archived_on_date | Version |
| :------------ | :-------------- | :----- |
| June 2024  | 2024-06-04                   | Stable
| May 2024   | 2024-05-28                  | Stable
| April 2024 | 2024-04-25                  | Beta
| March 2024 | 2024-03-27                  | Beta
