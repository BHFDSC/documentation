---
layout: default
title: ICNARC
parent: Data Insights
nav_order: 5
permalink: /docs/data_insights/icnarc
---

# ICNARC

<span class="fs-3">
  <a href="https://github.com/BHFDSC/cvd-covid-tre-dashboard" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description

The ICNARC (Intensive Care National Audit and Research Centre) Case Mix Programme is an audit of patient outcomes from adult, general critical care units (intensive care and combined intensive care/high dependency units). Data in the NHS Digital TRE is restricted to admissions for patients critically ill with COVID-19.

<span class="fs-3">
  <a href="https://digital.nhs.uk/about-nhs-digital/corporate-information-and-documents/directions-and-data-provision-notices/data-provision-notices-dpns/icnarc-case-mix-adult-critical-care" class="btn" target="_blank">NHS Digital page</a>
</span>

<span class="fs-3">
  <a href="https://web.www.healthdatagateway.org/dataset/0e6aaabb-0efc-4a69-a9a7-aa98888c04bd" class="btn" target="_blank">Health Data Research Innovation Gateway</a>
</span>

{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.icnarc_dars_nic_391419_j3w9t
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.icnarc_dars_nic_391419_j3w9t_archive

{: .new-title}
> Data Summary Notebook:
> 
> Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_SUMMARY\ICNARC Summary-Notebook


{: .note-title }
> Need to Know
>
- ICNARC data we hold is restricted to admissions for patients critically ill with confirmed COVID-19.


## Notes
COVID-19 admissions only:
The ICNARC dataset in the NHS Digital TRE only contains patients admitted to critical care with COVID-19. These were identified using the “reason for admission to your unit” fields, for which a special code was deployed in February 2020 to identify patients with COVID-19. The definition employed was “patients with a positive test (according to local practice) or those with a clinical diagnosis of COVID-19 in the context of a negative test where the treating clinical team were strongly convinced that the test was a false negative and the patient was treated as a confirmed COVID-19”. For patients who meet these criteria, audit clerks in each intensive care unit record the code in any of the three fields: “primary…”, “secondary…”, or “ultimate primary reason for admission to your unit”.

The codes that identify COVID-19 admissions in these fields are listed below. All admissions in our ICNARC data should have one of these codes in one of the “reason for admission to your unit” fields described above.

1.1.1.27.11, 2.1.1.27.11, 1.1.2.27.12,  2.1.2.27.12, 1.1.4.27.11, 2.1.4.27.11 (CMP version 3.1)

1.1.27.11, 1.1.27.11, 1.2.27.12,  1.2.27.12, 1.4.27.11, 1.4.27.11 (CMP version 4)
