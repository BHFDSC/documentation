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
registrations at participating practices (97.5%) who were alive on or born after 1 November 2019. GDPPR also only includes a subset of ~40,000 (out of >900,000) SNOMED-CT codes that were deemed relevant to pandemic planning and research with some time-based cut-offs applied. That is, GDPPR typically includes all historical records for code clusters relating to diagnoses, whereas medication use, measurements (except BMI), and screening/programme code clusters are only available from 2 years before the individual was first included in GDPPR with the earliest data being available being May 2018. Please see the [GDPPR Data Insight page]({% link docs/data_insights/gdppr.md %}) for further information

Please see the <a href="https://bhfdatasciencecentre.org/dashboard/" target="_blank">Dataset Summary Dashboard</a> for more detailed coverage plots for each of the datasets individually.


<a href="https://bhfdsc.github.io/documentation/assets/images/dataset_coverage_plot.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/dataset_coverage_plot.png" alt="Dashboard">
</a>
