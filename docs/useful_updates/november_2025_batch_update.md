---
layout: default
title: November 2025
parent: Batch updates
grand_parent: Useful Updates
nav_order: 1
permalink: /docs/useful_updates/batch_updates/november_2025
---
# November 2025 batch update

The **November 2025** batch (archived as at **2025-11-04**) is now available.

✅ **All curated assets have been refreshed** in line with the new data drop and are available as at **2025_11_04**

Find out more about the curated assets available to you <a href="https://bhfdsc.github.io/documentation/curated_assets" target="_blank">here</a>.

Quick Start: Access the latest demographics table as at **dsa_391419_j3w9t.dsa_391419_j3w9t_collab.hds_curated_assets__demographics_2025_11_04**

👀🔍 **Check your data quality**
We now have 195 datasets available :exploding_head: which is fab, but it also means the HDS team can’t fully quality check every dataset for every project. We still need you to check the batches you’re using in your own pipelines. Please don’t assume the latest batch is always ready to go for all datasets and if you are updating the data in your pipeline please take some time to check this data refresh being fed into your pipeline.

We’ve put together a notebook to hopefully make data quality checking quicker for you. In the NHS England SDE head to:
👉 **Workspace > Shared > Data Checks > check_my_data**

You can open this notebook in the above location or clone it into your own project space and use it to run some quick checks on the datasets you depend on.
Things to look out for in your checks might include:
- 📊 Are there more records in this batch than the last one (any unexpected drops)? 
- 🗺️ Does the dataset have similar coverage over time as the batch before? 
- ⏳ What’s the lag between the archived date and the most recent event date? 
- 🔎 Are any of your key columns suddenly much more missing? 
We’re putting together some short documentation on how to check your data, but in the meantime please use the check_my_data notebook as a starting point and shout if you spot anything unusual!👋

📌 Data Reminders:
- 📉 **HES A&E:** Remember that in the most recent batches of data, the date coverage of the HES A&E dataset now ends in March 2020. Read more about this <a href="https://bhfdsc.github.io/documentation/docs/useful_updates/hes_ae_update_2025" target="_blank">here</a>.
- 🛠️ **NICOR datasets** haven’t been updated since April 2025 as these datasets are now updated annually. Whilst the **April refresh resolved some major coverage issues** (e.g. duplicates and missing data) there is a **13% drop in records as at the April batch of NACSA** (this is being caused by records pre 2018 being missing in the latest batch)
