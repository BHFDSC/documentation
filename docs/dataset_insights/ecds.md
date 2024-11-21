---
layout: default
title: ECDS
parent: Dataset Insights
nav_order: 3
permalink: /docs/dataset_insights/ecds
---

# ECDS

<span class="fs-3">
  <a href="https://bhf-dsc-hds.shinyapps.io/cvd-covid-tre-dashboard/" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description

The Emergency Care Data Set (ECDS) collects information about why people attend emergency departments and the treatment they receive to:

- improve patient care through better and more consistent information
- allow better planning of healthcare services
- improve communication between health professionals

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-sets/emergency-care-data-set-ecds" class="btn" target="_blank">NHS Digital Page</a>
</span>

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-sets/emergency-care-data-set-ecds/ecds-guidance" class="btn" target="_blank">ECDS User Guide and Enhanced Technical Output Specification</a>
</span>

{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.lowlat_ecds_all_years
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.lowlat_ecds_all_years_archive


{: .note-title }
> Need to Know
>
- Data coverage begins in October 2018 (but only looks to be complete from April 2020 onwards)
- Effectively covers the same cohort of patients as HES A&E dataset
- Contains SNOMED-CT coded information on chief complaint, diagnosis, investigations and treatments

## Data coverage and completeness

- Data coverage from October 2018
- Data looks to be complete from April 2020 (based on comparison of record and patient volumes with HES A&E data). Prior to April 2020 HES A&E has more records and patients than ECDS.
- From April 2021 ECDS looks to be more complete than HES A&E.
- ECDS data is more up to date than HES A&E (Jul-22 compared to Dec-21)
- ECDS seems to capture the same set of patients as HES A&E. If we compare the set of IDs in ECDS and HES A&E for the financial year 2020/21: 97% of ECDS patient IDs are in HES A&E, 97% of HES A&E IDs are in ECDS

Data Insight Notebook:

DATA_RESOURCES/DATA_INSIGHT/ECDS/Comparison of Records and Patients with HES A&E

## SNOMED coding
ECDS uses a constrained set of SNOMED CT refsets to capture Chief Complaint and Diagnosis. Diagnosis is paired with a qualifier of either ‘Confirmed Present’ or ‘Suspected’ Diagnosis.

The SNOMED codes in the refset are listed in the “11.4 CHIEF COMPLAINT”, “20. DIAGNOSIS” tabs in the ECDS Enhanced Technical Output Specification document (provided above).
