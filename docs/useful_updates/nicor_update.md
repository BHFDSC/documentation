---
layout: default
title: NICOR Update (Slack May 2025)
parent: Useful Updates
nav_order: 1
has_children: false
permalink: /docs/useful_updates/nicor_april_2025
---

# NICOR Data Update April 2025

## TL;DR
\
🎉 Great news! We have a fresh batch of NICOR data — archived as at 2025-04-24.\ \
✅ The data coverage quality looks good, and the previously reported coverage issues (duplicates and missing data) appear to be resolved.\\
⚠️🚨 Some previously reported missing varaibles are still missing.\\
🔍 You can now start integrating this batch into your pipeline and check that the quality looks as expected!\\
🚀 Continue reading below to find out more about preiovusly reported issues with NICOR, data quality, coverage, data lag and variable missingness and completeness.\

If you find any new data quality issues please send us an email at **bhfdsc_hds@hdruk.ac.uk** for one of the team to look into and log.

## Previously reported issues
\
**nicor_acs_combined**
- Missing records: drop in records and individuals in recent batches compared to earlier batch (2023-03-31) ✅ISSUE RESOLVED
- Missing variables: ethnicity ⚠️Variable still not provisioned but you can derive ethnicity using the [**HDS KPC curated asset**]({% link docs/curated_assets/kpcs.md %})

**nicor_crm_eps**
- Potential missing records: drop in records and individuals in the latest batch (2023-08-31) compared to earlier batches ✅ISSUE RESOLVED

**nicor_hf_v5**
- Duplicate records included in the 2023-08-31 batch, possibly due to the ordering within multivalue columns ✅ISSUE RESOLVED

**nicor_minap**
- Missing variables: DischargeDate, EthnicGroup, Aspirin (on admission), StatinUse, HG_glucose0...24hrs, HG_Admission_K, Previous_MI 🚨All variables still missing

**nicor_tavi**
- In the latest batch of data the 7_01_DATE_AND_TIME_OF_OPERATION is null for all records ✅ISSUE RESOLVED
- Missing variables: pathology-related.

## Coverage Over Time by Archive Batch
\
With the new batch archived on 2025-04-24, coverage has significantly improved across all NICOR datasets.
In most cases, we’ve gained nearly two additional years of data, greatly expanding what’s available for your analysis.

Below you can view the coverage measured in different record counts for each NICOR dataset.

### Coverage measured in Records
 \
<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n.png" alt="nicor coverage plot n" width="1000">
</a>

### Coverage measured in Records with a de-identified PERSON ID
 \
<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n_id.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n_id.png" alt="nicor coverage plot n id" width="1000">
</a>

### Coverage measured in Distinct de-identified PERSON ID
 \
<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n_id_distinct.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_n_id_distinct.png" alt="nicor coverage plot n id distinct" width="1000">
</a>

## Coverage Over Time for latest batch (2025-04-24) only
\
<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_latest_batch.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_latest_batch.png" alt="nicor coverage plot latest_batch" width="1000">
</a>

## Data Lag for latest batch (2025-04-24)
\
While the data is archived as at 2025-04-24, coverage for most tables does not extend all the way to that date. This is due to a natural lag in data submission and processing. As a result, the most recent 3–4 months of data are often incomplete, and apparent drop-offs near the archive date reflect delayed availability rather than a true decline in activity. See the below plots to visually inspect data lag for each NICOR dataset.

Whilst most tables appear to have complete coverage extending well into late 2024 (Quarter 3 or 4), nicor_hf_v5 is the main exception, with coverage only appearing complete up to March 2024. This may reflect the common practice of NHS hospital trusts submitting data in bulk at the end of the financial year, with a delay before it is ingested into the SDE. We expect the next quarterly batch update (scheduled for July 2025) to include data through to March 2025 for nicor_hf_v5.
\
\
<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_lag.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_coverage_lag.png" alt="nicor coverage plot lag" width="1000">
</a>

## Column Completeness for latest batch (2025-04-24)
\
Note that some columns show 0% completeness, meaning they are provisioned in the dataset but contain no non-null data.

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_acs_combined.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_acs_combined.png" alt="nicor_acs_combined" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_congenital.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_congenital.png" alt="nicor_congenital" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_cpm_pmicd.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_cpm_pmicd.png" alt="nicor_cpm_pmicd" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_crm_eps.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_crm_eps.png" alt="nicor_crm_eps" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_crm_eps.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_crm_eps.png" alt="nicor_crm_eps" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_hf.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_hf.png" alt="nicor_hf" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_hf_v5.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_hf_v5.png" alt="nicor_hf_v5" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_minap.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_minap.png" alt="nicor_minap" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_pci.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_pci.png" alt="nicor_pci" width="1000">
</a>

<a href="https://bhfdsc.github.io/documentation/assets/images/nicor_tavi.png" target="_blank">
  <img src="https://bhfdsc.github.io/documentation/assets/images/nicor_tavi.png" alt="nicor_tavi" width="1000">
</a>
