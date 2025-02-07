---
layout: default
title: SSNAP
parent: Dataset Insights
nav_order: 7
has_children: True
permalink: /docs/dataset_insights/ssnap
---


# SSNAP

<span class="fs-3">
  <a href="https://bhf-dsc-hds.shinyapps.io/cvd-covid-tre-dashboard/" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description

The **S**entinel **S**troke **N**ational **A**udit **P**rogramme (SSNAP) is a comprehensive national initiative aimed at improving the quality of stroke care across England, Wales, and Northern Ireland. It serves as the single source of stroke data in these regions, collecting near real-time information on the processes and outcomes of stroke treatment.

For more information see:

<span class="fs-3">
  <a href="https://www.strokeaudit.org/About-SSNAP.aspx" class="btn" target="_blank">SSNAP website</a>
</span>


{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.ssnap_dars_nic_391419_j3w9t
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.ssnap_dars_nic_391419_j3w9t_archive

## Data Summary Notebook in the SDE:

Workspace/Shared/Summary Notebooks/SSNAP Summary Notebook

{: .note-title }
> Need to Know
>
 - Data available from 2018 onwards
>


## Known data quality issues
- In June 2021, there is a sharp increase in the number of records and PERSON_ID. The erroneous increase in individuals in June 2021 for SSNAP can be removed by either linking to GDPPR or valid NHS numbers in the token_pseudo_id_lookup.
- In July 2023, there is a sharp decrease in the number of records and PERSON_ID. This leads to data continuity issues (if you would like a continuous history, it would be recommended to limit to June 2023). 
- NB: As of the 23rd July 2024 batch update- the drop in data coverage in July 2023 for the SSNAP dataset has been resolved.  
