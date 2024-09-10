---
layout: default
title: GDPPR
parent: Data Insights
nav_order: 1
permalink: /docs/data_insights/gdppr
---

# GDPPR

<span class="fs-3">
  <a href="https://github.com/BHFDSC/cvd-covid-tre-dashboard" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description

GDPPR = General Practice Extraction Service (GPES) Data for Pandemic Planning and Research. This dataset is an extract/subset from primary care (GP) systems - designed to address the urgent need for GP data in response to Covid-19 planning & research. The dataset does not contain all information held in primary care systems (e.g., registration, long-term conditions, etc.) but rather it looks to meet the needs of a particular data use case. The data is in a long format, with one patient having many records for even a single GP appointment, and each record describing one patient date-code combination


{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.gdppr_dars_nic_391419_j3w9t
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.gdppr_dars_nic_391419_j3w9t_archive


## Data Summary Notebook in the SDE

Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_SUMMARY\GDPPR Summary-Notebook

{: .note-title }
> Need to Know
>
> Includes patients:
* alive on or after 1 November 2019
* from participating practices in England (98%)
* with SNOMED-CT codes relevant to pandemic planning and research
>
> Includes SNOMED-CT codes deemed applicable for COVID-19 research (~36,000 out of >900,000)
>
> Data coverage varies according to SNOMED-CT code cluster
>
> GDPPR includes ~61m individuals, GP list size estimates ~62m individuals, ONS population estimates ~57m
>
> No registration data available
>
> Individuals and records are not removed from the extract in monthly batch updates
>
> Patients who have opted out (~1.3m) are not removed; data no longer flows from the point of opt out
>
> Not possible to reliably infer number of GP appointments/consultations
>
> Small number of SNOMED-CT codes in GDPPR not matching to the GDPPR reference set
