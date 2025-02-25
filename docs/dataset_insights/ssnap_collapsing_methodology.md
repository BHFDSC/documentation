---
layout: default
title: Collapsing SSNAP records
parent: SSNAP
grand_parent: Dataset Insights
nav_order: 1
permalink: /docs/dataset_insights/ssnap/ssnap_collapsing_methodology
---

# Collapsing SSNAP records

## Overview of  the multiple rows per stroke incidence within the provisioned SSNAP data in the NHS England Secure Data Environment (SDE).
- In SSNAP, a stroke incidence can be defined as a unique pairing of the PERSON_ID and S1FIRSTARRIVALDATETIME columns. 
- Upon exploring the dataset, it was found that the provisioned SSNAP data does not have a single row for each stroke incidence and contains many cases of multiple rows per stroke incidence — in extreme instances, up to  >15 rows per stroke incidence.
- Some of these cases of multiple rows per stroke incidence may be legitimately explained by patient transfers (such as thrombectomy and repatriation). 
- The data flow from SSNAP to NHS England captures the first 72 hours of a patient's emergency stroke journey, with a 2-3 week maturation period for updates. 
- Therefore, the discharge data that has been provisioned within the NHS England SDE can be incomplete . For example, discharge metrics like Rankin scores and disability status are unlikely to be recorded for patients with hospital stays exceeding 2-6 weeks.
- As with all datasets provided in the NHS England SDE, research teams should carefully assess potential limitations both within and across datasets. These considerations should be incorporated into study designs and statistical analyses to minimise the risk of introducing bias into analytical results. 


## Collapsing SSNAP records
- As part of project CCU085_01, a methodology was developed (primarily led by the researcher working on the project, along with expertise from the SSNAP team at KCL and members of the health data science team at the BHF Data Science Centre) to collapse the provisioned SSNAP dataset into a single row per stroke incidence (PERSON_ID:S1FIRSTARRIVALDATETIME partition).
- Further information surrounding this project (eg: project protocol) can be found at this link: https://bhfdatasciencecentre.org/projects/ccu085/  


## Summary of the methodology
The approach developed to collapse the SSNAP data consists of five steps, each of which are described in detail below: 
- **Step 1**: Reduce SSNAP dataset by taking the latest value with the S7HOSPITALDISCHARGEDATETIME column per PERSON_ID:S1FIRSTARRIVALDATETIME partition
- **Step 2**: For cases where multiple rows per stroke incidence remain, apply the following rules to select the **most complete row for each stroke incidence** (and also rules for priority columns):
    - Initially, select the row with the **most non-null values across selected SSNAP columns**. Based on this selected row, apply the following rules for priority columns.
    - There are **three priority columns**: **S1ONSETDATETIME, S1THROMBOLYSISDATETIME and S2IAIARTERIALPUNCTUREDATETIME**
    - If **S1THROMBOLYSISDATETIME** is null for the chosen row, but contains a value in another row(s) within the partition, populate the feature with the value (minimum) from the other row(s).
    - If **S2IAIARTERIALPUNCTUREDATETIME** is null for this row, but contains a value in another row(s) within the partition, populate the feature with the value (minimum) from the other row(s).
    - The feature **S1ONSETDATETIME** has an associated feature **S1ONSETTIMETYPE** (with values, in order of priority: **P [precise], BE [best estimate] and NK [not known]**). If there are multiple S1ONSETDATETIME values, select the one based on the row that has the ‘best’ S1ONSETTIMETYPE (see priority order above). If this returns multiple values, select the minimum S1ONSETDATETIME. Populate S1ONSETTIMETYPE with the value from the same row as using for S1ONSETDATETIME.
- **Step 3**: Select the row with null values recorded for the **TRANSFERTOTEAMCODE and TRANSFERTODATETIME** columns
    - The rationale for this is that patients with null values for these columns have not been further transferred, so this row likely contains the most recent/up-to-date data for the stroke incidence.
- **Step 4**: If there are still multiple rows per stroke incidence, select the row with the **most non-null S7 features**.
- **Step 5**: If there are still multiple remaining rows per stroke incidence, select multiple columns to order values within each **PERSON_ID:S1FIRSTARRIVALDATETIME** partition- this provides a stable ordering to choose from.

## Summary notebook
A data insight notebook has been developed which provides in-depth code for each of the steps in the methodology. This can be found at this location within the Databricks environment of the NHS England Secure Data Environment (SDE): **_'Workspace/Shared/DATA_INSIGHT/SSNAP/Collapsing SSNAP records'_** 