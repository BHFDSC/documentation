---
layout: default
title: GDPPR
parent: Dataset Insights
nav_order: 1
has_children: True
permalink: /docs/dataset_insights/gdppr
---

# GDPPR

<span class="fs-3">
  <a href="https://github.com/BHFDSC/cvd-covid-tre-dashboard" class="btn" target="_blank">Visit the Dataset Summary Dashboard for Data Dictionary, Data Coverage and Data Completeness</a>
</span>

## Description

GDPPR = **G**eneral Practice Extraction Service (GPES) **D**ata for **P**andemic **P**lanning and **R**esearch. This dataset is an extract/subset from primary care (GP) systems - designed to address the urgent need for GP data in response to Covid-19 planning & research. The dataset does not contain all information held in primary care systems (e.g., registration, long-term conditions, etc.) but rather it looks to meet the needs of a particular data use case. The data is in a long format, with one patient having many records for even a single GP appointment, and each record describing one patient date-code combination

<span class="fs-3">
  <a href="https://digital.nhs.uk/coronavirus/gpes-data-for-pandemic-planning-and-research/guide-for-analysts-and-users-of-the-data" class="btn" target="_blank">NHS Digital Page</a>
</span>

<span class="fs-3">
  <a href="https://web.www.healthdatagateway.org/dataset/696cfc9f-090d-4328-94ac-140760a77c73" class="btn" target="_blank">Health Data Research Innovation Gateway</a>
</span>


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


## Data Summary Notebook in the SDE:

Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_SUMMARY\GDPPR Summary-Notebook

{: .note-title }
> Need to Know
>
 - Includes patients:
    - alive on or after 1 November 2019
    - from participating practices in England (98%)
    - with SNOMED-CT codes relevant to pandemic planning and research
>
- Includes SNOMED-CT codes deemed applicable for COVID-19 research (~36,000 out of >900,000)
>
- Data coverage varies according to SNOMED-CT code cluster
>
- includes ~61m individuals, GP list size estimates ~62m individuals, ONS population estimates ~57m
>
- No registration data available
>
- Individuals and records are not removed from the extract in monthly batch updates
>
- Patients who have opted out (~1.3m) are not removed; data no longer flows from the point of opt out
>
- Not possible to reliably infer number of GP appointments/consultations
>
- Small number of SNOMED-CT codes in GDPPR not matching to the GDPPR reference set


## Inclusion criteria

The GDPPR extract only includes patients with active, current registrations at participating practices (98%) and deceased patients with a date of death on or after 1 November 2019.

## Code cluster

The GDPPR extract only includes a subset of the available SNOMED-CT codes i.e., those included in the GDPPR cluster reference set that were deemed applicable for COVID-19 research. The reference table listing the available codes can be downloaded from the link below and is also available in the dss_corporate workspace (with prefix “gpdata_snomed”) within the TRE.

<span class="fs-3">
  <a href="https://digital.nhs.uk/coronavirus/gpes-data-for-pandemic-planning-and-research/guide-for-analysts-and-users-of-the-data#code-clusters-and-content" class="btn" target="_blank">NHS Digital - Code clusters and content</a>
</span>

Further details around which codes have been included are provided in “Supplementary Table 7: Summary of codes included in the primary care dataset” of the <a href="https://www.bmj.com/content/373/bmj.n826#_blank" target="_blank">BMJ paper</a>.

## Data coverage varies according to SNOMED-CT Code Cluster
In the project proposal it is mentioned that "numeric values (e.g. BP, laboratory test results) only go back two years".

There are two specific GDPPR code clusters (in addition, to separate prescription and vaccine code clusters):

- GDPPR_COD  "Codes required for COVID-19 pandemic planning and research to be returned with no time limit"
- GDPPR2YR_COD "Codes required for COVID-19 pandemic planning and research to be returned from the last 2 years"

For example, GDPPR_COD includes BMI_COD "Body mass index (BMI) codes", and GDPPR2YR_COD includes BP_COD "Blood pressure (BP) recording codes" and LDLCCHOL_COD "Low density lipoprotein (LDL) cholesterol test results".

Looking at the oldest batch of GDPPR data (ProductionDate: 2020-11-23), 99.999% of records are within 2 years of the REPORTING_PERIOD_END_DATE, which ranges from 2020-05-18 to 2020-06-29. It appears that measurements for the code clusters in GDPPR2YR_COD went back 2 years from the REPORTING_PERIOD_END_DATE in our initial batch of GDPPR to around May 2018. We have retained all of this data in subsequent batches of GDPPR, so now have measurements that go back around 4 years (if the individual was included in the initial batch).

See Data Insight Notebooks:

- Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_INSIGHT\GDPPR\GDPPR - Records and Patients by Code Cluster Category
- TBC

## Registration Data
GDPPR does not include individual registration information (i.e., coverage start and end date). As mentioned above, GDPPR includes most (98%), but not all, practices in England, and without registration information it is not possible to censor patients who do not have continuous coverage (e.g., patients who may have moved from/to a non-participating practice, patients who may have moved in/out of the country, patients with multiple NHS_NUMBER_DEID).

## Type 1 opt outs
Whilst some patients who have opted out (type 1 opt outs) may be excluded (e.g., those who opted out before the first batch of the GDPPR dataset was provisioned in the NHS Digital TRE, those who opted out before joining a participating practice or before having a SNOMED-CT code in the GDPPR cluster reference set), we can see, by comparing the monthly batch updates for the GDPPR dataset, that, as a rule, NHS_NUMBER_DEID are never excluded from subsequent batches (see Data Insight notebook: “GDPPR – Comparison of Patient IDs across Batches”). The GPES team have also confirmed that when a patient opts out, their historical records are not excluded (to prevent identification of opts out through the comparison of monthly batch updates), rather any subsequent records for that patient stop flowing and would therefore not be included in later batches. Obviously, this may potentially introduce bias as the patients who have opted out after GDPPR was first provisioned may appear to be healthy from the point that they opted out without any subsequent consultations appearing in the dataset.

## GDPPR versus GP registered population
As at 2022-05-30, the GDPPR dataset within the NHS Digital TRE for England included 62.2m unique NHS_NUMBER_DEID. However, this is also includes patients who have died since 1 Nov 2019. Removing deceased patients results in 60.9m unique NHS_NUMBER_DEID. As at 2022-06-01, the GP registered population was reported to be 61.7m patients.

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/publications/statistical/patients-registered-at-a-gp-practice/june-2022" class="btn" target="_blank">NHS Digital - patients registered at a gp practice</a>
</span>

Note: The GP registered population refers to the number of unique patients registered at each practice, therefore patients who are registered at multiple practices are counted more than once. It is not possible to precisely replicate this number using the GDPPR dataset, due to the lack of registration information. As at 2022-05-30, the GDPPR dataset included 71.1m unique NHS_NUMBER_DEID and PRACTICE. 

Note: The GDPPR dataset represents a large subset of the GP registered population. As mentioned above, GDPPR only includes patients at participating practices (98%), those patients with a SNOMED-CT code in the GDPPR cluster reference set, and may also exclude some type 1 opt-outs. However, as also mentioned above, NHS_NUMBER_DEID are never removed from GDPPR, which means that, without registration information, patients that have de-registered (e.g., patients who have left the country, patients with multiple NHS_NUMBER_DEID) will continue to be counted in GDPPR, but not in the GP registered population. Patients who move to a non-participating GDPPR practice will continue to be counted in both GDPPR and the GP registered population, but under different practices.

Data Insight Notebooks:
- Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_INSIGHT\GDPPR\GDPPR - Comparison to Published GP List Size

## GDPPR/GP registered population versus ONS population estimates
The ONS England mid-year population estimate was 56.6m in 2020:

<span class="fs-3">
  <a href="https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/timeseries/enpop/pop" class="btn" target="_blank">Office for National Statistics - England population mid-year estimate</a>
</span>

There are many reasons why GDPPR / GP registered population may differ to the ONS population estimate.

GDPPR / GP registered population will include non-residents i.e., overseas, students (some of the main locations where the GP register is greater than the ONS population estimates include university towns), those living on borders of England and Scotland/Wales, short-term migrants. In addition, as mentioned above, the GDPPR / GP registered population might also include patients who have left the country and have not de-registered (or have de-registered but are still included in GDPPR), and data linkage issues (i.e., patients with multiple NHS_NUMBER_DEID, who should otherwise be unique), and patients with unlinked death records (i.e., patients who have died and should not be counted).

ONS population estimates may also be under-estimates. It is known that uncertainty in the estimates increases the longer the time since the census was taken. The census for England and Wales was conducted in 2011 and 2021, so ONS estimates in 2020 may have been prone to error.

On the contrary, not every member of the population will be registered with a GP and therefore will not be included in GDPPR.

<span class="fs-3">
  <a href="https://commonslibrary.parliament.uk/population-estimates-gp-registers-why-the-difference/" class="btn" target="_blank">Parliament UK - population estimates & GP registers: Why the difference?</a>
</span>

## Patient Characteristics
The following variables, including patient characteristics, are unique at the NHS_NUMBER_DEID and PRACTICE level:

- GP_SYSTEM_SUPPLIER
- PROCESSED_TIMESTAMP
- REPORTING_PERIOD_END_DATE
- YEAR_MONTH_OF_BIRTH
- YEAR_OF_BIRTH
- SEX
- ETHNIC
- LSOA
- YEAR_OF_DEATH

cur_gdppr will separate the patients characteristics from the consultations records producing two datasets of ~72 million rows (11 variables) and ~8.8 billion rows (12 variables), respectively. 

Data Insight Notebook(s):

- Workspaces\dars_nic_391419_j3w9t\DATA_RESOURCES\DATA_INSIGHT\GDPPR\GDPPR - Patient characteristics

## Ethnic
Note: There is also ethnicity information contained within the CODE variable via SNOMED-CT codes. See the code cluster: ETHNALL_COD “Active and inactive ethnicity codes”. These codes are extracted and harmonised with the primary codes in ETHNIC in the cur_skinny code (using the SNOMED-CT to primary code mapping file provided by NHS Digital in dss_corporate.gdppr_ethnicity_mappings). See CCU037_01 manuscript for a detailed description of ethnicity within GDPPR (link to be added when available).

Data Insight Notebook(s):

- TBC

## YEAR_OF_BIRTH versus YEAR_MONTH_OF_BIRTH
Note: f.year(YEAR_MONTH_OF_BIRTH) == YEAR_OF_BIRTH  for all rows.

## Number of GP appointments/consultations
The GP Extraction Service (GPES) team have advised that it is not possible to infer the number of GP appointments from GDPPR and match Official Statistics.

<span class="fs-3">
  <a href="https://digital.nhs.uk/data-and-information/publications/statistical/appointments-in-general-practice" class="btn" target="_blank">NHS Digital - Appointments in General Practice</a>
</span>

Appointments are not flagged in GDPPR, so it is not clear whether a RECORD_DATE relates to a consultation or simply the date that the CODE was recorded on the system. 

GDPPR includes the cluster category “COVID-19 activity”, which includes SNOMED-CT codes relating to COVID-19 vaccination that are not counted in the Official Statistics for GP appointments.

The next phase of GP data (GP Data for Planning and Research (GPDfPR)) would provide appointment information.

Data Insight Notebook(s):

- Workspaces\Shared\DATA_RESOURCES\DATA_INSIGHT\GDPPR\GDPPR - GP appointments

where distinct NHS_NUMBER_DEID and RECORD_DATE were compared to Official Statistics

## CODE not matching to the GDPPR refset
There are codes within GDPPR that do not match to the GDPPR reference set available within dss_corporate in the SDE. 

The most frequent codes relate to influenza vaccination e.g., 822851000000102 - Seasonal influenza vaccination (procedure).

There are also examples of local TPP codes (also relating to influenza vaccination) e.g., Y2f27 - Fluad Tetra vaccine suspension for injection 0.5ml pre-filled syringes (Seqirus UK Ltd) 
