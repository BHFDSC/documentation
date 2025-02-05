---
layout: default
title: SSNAP
parent: Dataset Insights
nav_order: 7
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


## Overview of SSNAP data integrity issues
- The provisioned SSNAP data in the NHS England Secure Data Environment (SDE) presents significant data integrity challenges, characterized by inconsistent patient record structures. 
- In SSNAP, a stroke incidence is defined as a unique pairing of the PERSON_ID and S1FIRSTARRIVALDATETIME columns. 
- However, upon exploring the dataset, it was found that the raw SSNAP data is not distinct for each stroke incidence and contains many cases of multiple rows per patient admission (stroke incidence)— in extreme instances, up to 17 rows per patient admission . 
- While some multiple rows may be legitimately explained by patient transfers (such as thrombectomy and repatriation), the extent of these occurrences suggests deeper data capture issues. 
- The data flow from SSNAP to NHS England captures the first 72 hours of a patient's emergency stroke journey, with a 2-3 week maturation period for updates. 
- Monthly snapshots are generally reliable for patient admission data, but discharge data remains problematically incomplete. Critical discharge metrics like Rankin scores and disability status are often unreliably recorded, particularly for patients with hospital stays exceeding 2-6 weeks. 
- These data provisioning inconsistencies complicate data analysis and potentially compromise comprehensive stroke care analysis, highlighting the urgent need for robust data cleaning, standardization, and more precise data capture protocols to ensure accurate representation of patient journeys and outcomes.


## Collapsing SSNAP records
- As part of project CCU085_01, a novel methodology was developed (primarily led by the researcher, along with expertise from the SSNAP team at KCL) to collapse the provisioned SSNAP dataset into a single row per stroke incidence (PERSON_ID:S1FIRSTARRIVALDATETIME partition). 
- The notebook showcasing each of the five steps in this methodology can be found at the following location in the NHS England SDE: 'Workspace/Shared/DATA_INSIGHT/SSNAP/Collaping SSNAP records'

## Summary of the methodology 
- **Step 1**: Reduce SSNAP dataset by taking the latest value for the S7HOSPITALDISCHARGEDATETIME column per PERSON_ID:S1FIRSTARRIVALDATETIME partition
- **Step 2**: Apply rules to select the most complete row for each stroke incidence (and also rules for priority columns):
    - For a stroke incidence with multiple rows of data, take the row with the latest S7
    - In addition to these rules, there are **three priority columns**: **S1ONSETDATETIME, S1THROMBOLYSISDATETIME and S2IAIARTERIALPUNCTUREDATETIME**
    - If **S1THROMBOLYSISDATETIME** is null for the chosen row, but contains a value in another row(s) within the partition, populate the feature with the value (minimum) from the other row(s).
    - If **S2IAIARTERIALPUNCTUREDATETIME** is null for this row, but contains a value in another row(s) within the partition, populate the feature with the value (minimum) from the other row(s).
    - The feature **S1ONSETDATETIME** has an associated feature **S1ONSETTIMETYPE** (with values, in order of priority: **P [precise], BE [best estimate] and NK [not known]**). If there are multiple S1ONSETDATETIME values, select the one based on the row that has the ‘best’ S1ONSETTIMETYPE (see priority order above). If this returns multiple values, select the minimum S1ONSETDATETIME. Populate S1ONSETTIMETYPE with the value from the same row as using for S1ONSETDATETIME.
- **Step 3**: Select the row with null values recorded for the **TRANSFERTOTEAMCODE and TRANSFERTODATETIME** columns
- **Step 4**: If there are still multiple rows per stroke incidence, select the row with the most non-null S7 features
- **Step 5**: If there are still multiple remaining rows per stroke incidence, select multiple columns to order values within each **PERSON_ID:S1FIRSTARRIVALDATETIME** partition- this provides a stable ordering to choose from.
