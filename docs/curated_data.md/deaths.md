---
layout: default
title: Deaths
parent: Curated Data
nav_order: 1
permalink: /docs/curated_data/deaths
---

# Deaths

The deaths_single and deaths_cause_of_death tables are curated monthly to provide cleaned and restructured versions of the Civil Registration of Deaths table for projects to utilise in their data exploration or project pipeline. 

## Single

The deaths_single table takes the latest archived version of the Civil Registration of Deaths table and curates it such that the output contains a single record of death for each unique person ID. Initially, rows in which the person ID is null are removed. Records are subsequently grouped by person ID and ordered by (earliest) registration date, date of death and underlying cause of death. The first record of these records is retained and any duplicate records for the same person are dropped based on this criterion. 

The table is saved to the DSA schema **dsa_391419_j3w9t_collab**. The archived_on_date is in the format **YYYY_MM_DD**.

{: .highlight-title }
> Table Name
>
> 
> **deaths_single**
> >
> hds_curated_assets__deaths_single_archived_on_date
>
