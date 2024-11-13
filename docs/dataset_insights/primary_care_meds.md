---
layout: default
title: Medicines Dispensed in Primary Care
parent: Dataset Insights
nav_order: 5
permalink: /docs/dataset_insights/primary_care_meds
---

# Medicines Dispensed in Primary Care

<span class="fs-3">
  <a href="https://github.com/BHFDSC/cvd-covid-tre-dashboard" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description
The data comprise prescriptions for medicines dispensed or supplied by community pharmacies, appliance contractors and dispensing doctors in England. The data is limited to prescriptions submitted for reimbursement. Prescriptions issued but not dispensed and prescriptions dispensed or supplied but not claimed are not included. More information can be found at the link below:

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/data-tools-and-services/data-services/medicines-dispensed-in-primary-care-nhsbsa-data" class="btn" target="_blank">NHS Digital Page</a>
</span>

<span class="fs-3">
  <a href="https://web.www.healthdatagateway.org/dataset/f201b68f-d995-4a70-a9ee-aa3510232777" class="btn" target="_blank">Health Data Research Innovation Gateway</a>
</span>

{: .highlight-title }
> Table Names
>
> &nbsp;
> **Live table**
> >
> dars_nic_391419_j3w9t.primar_care_meds_dars_nic_391419_j3w9t
>
> **Archived table**
> >
> dars_nic_391419_j3w9t_collab.primary_care_meds_dars_nic_391419_j3w9t_archive


{: .new-title}
> Data Summary Notebook:
> 
> Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_SUMMARY\Primary Care Meds Summary-Notebook



{: .note-title }
> Need to Know
>
- Data coverage commences in April 2018
- The number of records with a null person ID has decreased over time.
- Date field is available to month and year only (ProcessingPeriodDate: Month and year prescriptions were submitted to NHS Business Services Authority for processing. Displayed as a date with the day set as the first of the month)
- Medication codes are provided in both SNOMED-CT (DM+D) and BNF terminologies
- JN has shown that PaidBNFCode == PrescribedBNFCode (for almost all records). 
- The data is limited to prescriptions submitted for reimbursement. Prescriptions issued but not dispensed and prescriptions dispensed or supplied but not claimed are not included.
- The data does not include medications prescribed in hospitals (see EPMA datasets)
>

## Null person ID
The number of records with a null person ID has decreased over time. Null person IDs may arise from a variety of reasons, including, but not limited to: problems scanning the NHS number from paper prescriptions, non-availability of date of birth for data linkage, deliberate removal of NHS ID from some sensitive medication.  
