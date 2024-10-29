---
layout: default
title: GDPPR-SNOMED subset analysis
parent: GDPPR
grand_parent: Dataset Insights
nav_order: 1
permalink: /docs/data_insights/gdppr/gdppr_snomed_subset_analysis
---

# GDPPR-SNOMED Subset Analysis

## Key Findings

- GDPPR consists of a small proportion of the SNOMED universe (3.7%)
- ‘Ethnic group’ and ‘Life style’ semantic tags show 60-80% coverage  while all other semantic tags are below 25% with majority near 0%.
- Descendant code coverage were higher (~90%) among ‘Medications’, ‘Patient factors’, ‘Vaccinations and immunisations’ and ‘Declines contraindications and other exceptions’ cluster categories but low (~40%) for ‘Diagnoses and findings’.
- Coverage for codes mappable to CTV-3 were higher for ‘Respiratory disorders’ (60%) and ‘Neoplasms and cancers’ (40%) CTV-3 chapters. 

## Datasets

- SNOMED lookup
- GDPPR Refset
- GDPPR and descendants (derived from child-codes)
- CTV-3 to SNOMED mapping

## Coverage between datasets

![Coverage between datasets](https://bhfdsc.github.io/documentation/assets/images/coverage_between_datasets.png)

## GDPPR vs SNOMED Universe
- Numerator: GDPPR SNOMED codes
- Denominator: SNOMED universe

**By top-level and semantic tags**

![GDPPR vs. SNOMED](https://bhfdsc.github.io/documentation/assets/images/GDPPRvSNOMED.png)

## GDPPR vs GDPPR & descendants
- Numerator: GDPPR SNOMED codes
- Denominator: GDPPR SNOMED codes and their descendant codes

**By cluster category**

![GDPPR vs. SNOMED](https://bhfdsc.github.io/documentation/assets/images/GDPPRvDescendants.png)

<br>

![GDPPR vs. SNOMED](https://bhfdsc.github.io/documentation/assets/images/GDPPRvDescendants_cluster.png)

## GDPPR within mappable CTV-3 codes
- Numerator: GDPPR SNOMED codes mappable from CTV-3
- Denominator: SNOMED codes mappable from CTV-3

**By CTV-3 chapter**

![GDPPR vs. SNOMED](https://bhfdsc.github.io/documentation/assets/images/ctv3_chapter.png)

**By CTV-3 subchapter**
![GDPPR vs. SNOMED](https://bhfdsc.github.io/documentation/assets/images/ctv3_subchapter.png)
  
