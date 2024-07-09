---
layout: default
title: Key Patient Characteristics
parent: Curated Assets
nav_order: 1
has_children: true
permalink: /curated_assets/kpcs
---

# Key Patient Characterisitcs

Jump to our [quick-start]({% link docs/curated_assets/kpcs_how_to_use.md %}) guide to start using the tables now!

## Motivation

The key patient characteristic (kpc) tables are **[monthly]({% link resources/kpcs_how_to_use.md %}#available-versions)** curated assets that have been developed to meet the need for a standardised demographics table that is accessible and usable by all projects. You may want to use these assets as part of your project pipeline or for exploratory data analyses purposes.

 
Previously, kpc's could be curated using:

* NHS Data Wranglers curated asset tables curr301_patient_skinny_unassembled & curr302_patient_skinny_record. These tables are no longer maintained.

* BHF DSC HDS common functions key_patient_characteristics_harmonise & key_patient_characteristics_select. These functions were run by every project in every pipeline.

{: .note }
If you are currently using the above common functions in your project pipeline there is no need to replace the assets you have curated using these functions with the new tables described here. The methodology used in both versions is almost identical. For future projects however, you may want to consider using the kpc curated assets described in this section.


The above functions are run at a population wide level which is a lot of compute time across many projects for the **same result**.

### What tables are being curated?

* **Multisource tables** - curated for each patient characteristic as at each provisioning month. It consolidates all the records of the characteristic of interest from a wide variety of data sources. Use this table if you want to apply your own bespoke selection algorithm that picks one record per characteristic per person.

* **Individual tables** - curated for each patient characteristic as at each provisioning month. It is curated from the multisource table by applying a HDS selection algorithm. The algorithm selects one record per characteristic per person (one row per person).

* **Demographics table** - brings together the individual tables that were curated for each characteristic into one demographics table. 
 
## Characteristics of Interest

The curated assets have the following characteristics of interest:

| Demographic Data       | Multisource Tables | Individual Tables | Demographics Table |
|------------------------|---------------------|-------------------|--------------------|
| Date of Birth          | ✔                   | ✔                 | ✔                  |
| Sex + Mappings         | ✔                   | ✔                 | ✔                  |
| Ethnicity + Mappings   | ✔                   | ✔                 | ✔                  |
| LSOA                   | ✔                   | ✔                 | ✔                  |
|   - Region             |                     |                   | ✔                  |
|   - IMD Quintile       |                     |                   | ✔                  |
|   - IMD Decile         |                     |                   | ✔                  |
| Death                  |                     |                   | ✔                  |
|   - Date of Death      |                     |                   | ✔                  |
| In GDPPR               |                     |                   | ✔                  |
