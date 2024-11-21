---
layout: default
title: HES CC
parent: Dataset Insights
nav_order: 4
permalink: /docs/dataset_insights/hes_cc
---

# HES CC

<span class="fs-3">
  <a href="https://bhf-dsc-hds.shinyapps.io/cvd-covid-tre-dashboard/" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description
Hospital Episode Statistics (HES) contains records of all admissions, appointments and attendances at NHS hospitals in England. HES Critical Care (HES CC) is a subset of HES Admitted Patient Care (HES APC) data. An Intensive Care Unit or High Dependency Unit ward in a hospital, known as a critical care unit, provides support, monitoring and treatment for critically ill patients requiring constant support and monitoring to maintain function in at least one organ, and often in multiple organs. Medical equipment is used to take the place of patients' organs during their recovery.

For more information see:

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/data-tools-and-services/data-services/hospital-episode-statistics" class="btn" target="_blank">NHS Digital Page</a>
</span>

<span class="fs-3">
  <a href="https://healthdatagateway.org/en/dataset/879" class="btn" target="_blank">Health Data Research Innovation Gateway</a>
</span>

{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.hes_cc_all_years
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.hes_cc_all_years_archive

{: .new-title}
> Data Summmary Notebook:
> 
> Workspace\Shared\Summary Notebooks\HES\HES - CC All Years Summary Notebook

{: .new-title}
> Data Insight Notebook:
> 
> Workspace\Shared\DATA_INSIGHT\HES CC to HES APC linkage

{: .note-title }
> Need to Know
>
 - Data completeness and row counts depend on CCPERTYPE:
   - CCPERTYPE = "01" (adult facilities, patients >= 19 years old on admission predominate)
       - One row per critical care period (i.e. distinct ID and datetime) per HES-APC linkage (via SUSRECID)
       - Exclusive columns: support days (*SUPDAYS), critical care level days (CCLEV*DAYS), organ support maximum (ORGSUPMAX)
>
  - CCPERTYPE = "02" (paediatric; children and young people facilities, patients ≥ 29 days to <19 years predominate) & CCPERTYPE = "03" (neonatal facilities, patients <29 days on admission predominate)
      - One row per critical care period (i.e. distinct ID and datetime) per critical care activity day (CCACTIVDATE) per HES-APC linkage (via SUSRECID)
      - Exclusive columns: Critical Care Activity Code (CCACTCODE*), High Cost Drugs Code (HCDCODE*)
>
  - BESTMATCH can be used to limit the data to one row per critical care period
    - although ~0.2% of distinct critical care periods will be missed with a further ~0.2% having duplicate rows. Consider directly filtering for distinct ID and datetime.
    - **not** appropriate for analysing daily paediatric and neonatal critical care activity as the best match flag will only flag a single (typically the first) critical care activity date
>
  - Support day columns (*SUPDAYS), critical care level days (CCLEV*DAYS) contain the following integer flags which require cleaning:
    - 998: 998 or more days of neurological support
    - 999: Support occurred but number of days not known
>
