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


## Current data quality issues
- In June 2021, there is a sharp increase in the number of records and PERSON_ID. The erroneous increase in individuals in June 2021 for SSNAP can be removed by either linking to GDPPR or valid NHS numbers in the token_pseudo_id_lookup.
- Further information on this table can be found at: https://bhfdsc.github.io/documentation/docs/curated_data/patient_ids 

## Resolved data quality issues
- For the month of  July 2023, the data was not complete – there was a sharp decrease in the number of records and PERSON_ID in this month. This leads to data continuity issues, with projects needing to restrict analysis or follow-up period to June 2023
- However, as of the July 2024 batch update (archived_on == 2024-07-23) - this issue has been resolved.  
