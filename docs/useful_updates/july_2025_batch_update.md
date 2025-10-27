---
layout: default
title: July 2025 batch update
parent: Useful Updates
nav_order: 2
has_children: false
permalink: /docs/useful_updates/july_2025_batch
---

# July 2025 batch update (6th August 2025)

The July 2025 batch (archived as at 2025-07-28) is now available.

Dive into the latest updates via the interactive dataset summary dashboard:
:point_right: https://bhfdatasciencecentre.org/dashboard/

:white_check_mark: All curated assets have been refreshed in line with the new data drop.
Find out more about the curated assets available here:
:point_right: https://bhfdsc.github.io/documentation/curated_assets
Quick Start: Access the latest demographics table as at *dsa_391419_j3w9t_collab.hds_curated_assets__demographics_2025_07_28*

:eyes: Want to check data coverage or trends of your datasets inside the SDE?
We’ve re-run our full suite of monitoring plots and saved them as PNGs for easy viewing.
:point_right: Head to:
*Workspace > Shared > Dataset Summary Dashboard > 2025_07_28*
You’ll find the plots organised into these folders:
:file_folder: *batch_checks:* Shows cumulative record counts by archive to check that each new archive includes more data than the last
:file_folder: *coverage_by_archive:* Compares time trends in coverage across the current and four previous archives to spot any sudden changes
:file_folder: *coverage_by_records:* Tracks total, per-person, and unique person counts over time using the most recent archive only
:file_folder: *lag:* Displays recent monthly record counts (with smoothing) to help detect data lags or delays in recent archives (visually looking at the core plots, full coverage is now available up to March/April 2025 :man_dancing:)
Each folder contains individual PNGs for quick review (no need to run any code).

:pushpin: *Additional notes:*
:chart_with_downwards_trend: HES A&E: You’ll notice a drop in HES A&E records in the last two archived_on batches - see the comment below for more detail on this change.
:hammer_and_wrench: NICOR datasets haven’t updated in the July batch. Just to recap:
These datasets are now updated annually and will be provisioned manually going forward
Just a reminder: the April refresh resolved some major coverage issues (e.g. duplicates and missing data) but there is a 13% drop in records as at the April batch of NACSA (this is being caused by records pre 2018 being missing in the latest batch - see coverage_by_archive plots for more detail)
