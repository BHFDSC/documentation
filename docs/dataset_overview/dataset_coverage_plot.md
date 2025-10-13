---
layout: default
title: Dataset Coverage Plot
parent: Dataset Overview
nav_order: 4
permalink: /docs/dataset_overview/coverage_plot
---

# Dataset Coverage Plot

The dataset coverage plot provides an overview of the date coverage of each of the datasets provisioned in the CVD-COVID-UK/COVID-IMPACT instance of the NHS England Secure Data Environment (SDE). 

The fainter lines preceding the solid lines for GDPPR indicate the complexities in the date coverage. GDPPR only includes individuals with active, current
registrations at participating practices (97.5%) who were alive on or born after 1 November 2019. GDPPR also only includes a subset of ~40,000 (out of >900,000) SNOMED-CT codes that were deemed relevant to pandemic planning and research with some time-based cut-offs applied. That is, GDPPR typically includes all historical records for code clusters relating to diagnoses, whereas medication use, measurements (except BMI), and screening/programme code clusters are only available from 2 years before the individual was first included in GDPPR with the earliest data being available being May 2018. Please see the [GDPPR Data Insight page]({% link docs/dataset_insights/gdppr.md %}) for further information.

Please see the <a href="https://bhfdatasciencecentre.org/dashboard/" target="_blank">Dataset Summary Dashboard</a> for more detailed coverage plots for each of the datasets individually. 


<a href="https://bhfdsc.github.io/documentation/assets/images/dataset_coverage_plot_Oct2025.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/dataset_coverage_plot_Oct2025.png" alt="coverage plot" width="1000">
</a>

## Footnotes
### HES A&E
Officially, the HES A&E dataset ended with the 2019/2020 financial year (in March 2020) with the Emergency Care Data Set (ECDS) taking over, but up until the April 2025 data provisioning the HES A&E dataset was being updated for historical continuity. NHS England have confirmed that this will no longer be the case going forward, and instead researchers will now have to make use of ECDS for the most recent data. Although ECDS officially started in in 2018, it is worth noting that the coverage does not look to be complete until April 2020 when it took over from HES A&E. 

### NICOR NHFA footnote
The collection of the NICOR National Heart Failure Audit (NHFA) records has gradually moved over from version 4 (NHFA v4) to version 5 (NHFA v5). <a href="https://bhfdsc.github.io/documentation/docs/useful_updates/nicor_april_2025" target="_blank">See here</a> for a plot that demonstrates this change. 

Please contact the Health Data Science Team (bhfdsc_hds@hdruk.ac.uk) if you would like support with harmonising and combining these two NHFA versions to maximise date coverage for your analyses, or for advice and considerations on how best to use the HES A&E and ECDS tables.



## Abbreviations

- AE: Accident and Emergency
- APC: Admitted Patient Care
- CC: Critical Care
- [ECDS]({% link docs/dataset_insights/ecds.md %}): Emergency Care Data Set
- EPMA: Electronic Prescribing and Medicines Administration
- [GDPPR]({% link docs/dataset_insights/gdppr.md %}): General Practice Extraction Service (GPES) Data for Pandemic Planning and Research
- HES: Hospital Episode Statistics
- HDU: High Dependency Unit
- IAPT: Improving Access to Psychological Therapies
- [ICNARC]({% link docs/dataset_insights/icnarc.md %}): Intensive Care National Audit and Research Centre
- ITU: Intensive Care Unit
- MINAP: Myocardial Ischaemia National Audit Project 
- MSDS: Maternity Services Data Set
- NACPI: National Audit of Percutaneous Coronary Interventions
- NACRM: National Audit of Cardiac Rhythm Management
- NACSA: National Adult Cardiac Surgery Audit
- NCHDA: National Congenital Heart Disease Audit
- NHFA: National Heart Failure Audit
- [NHS BSA]({% link docs/dataset_insights/primary_care_meds.md %}): Medicines dispensed in primary care (NHS Business Services Authority)
- NICOR: National Institute for Cardiovascular Outcomes Research
- OP: Outpatients
- SARI: Severe Acute Respiratory Infection
- SGSS: Second Generation Surveillance System
- [SSNAP]({% link docs/dataset_insights/ssnap.md %}) : Setninel Stroke National Audit Programme
- SUS: Secondary Uses Service
- [TAVI]({% link docs/dataset_insights/nicor_tavi.md %}): Transcatheter Aortic Valve Implantation








