---
id: '9cf10fd3-a3e6-4e85-8eca-f6dd08fb47d5'
title: 'Script Failure Assessment - Last 30 Days'
title_meta: 'Script Failure Assessment - Last 30 Days'
keywords: ['script', 'failure', 'analysis', 'retention', 'data', 'update']
description: 'This document provides a comprehensive guide for implementing the Script Failure Analysis - 30 Day Retention solution, detailing updates, dependencies, and step-by-step instructions for accurate script failure assessment over the past month.'
tags: ['update']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to present a detailed analysis of script failures over the past 30 days. This solution is designed to overcome the limitations of the [Script Failure Assessment](<../cwa/dataviews/Script Failure Assessment.md>) dataview.

## Update Notice: 29-November-2024

**Changes:**
- The script has been renamed from `Weekly Script Failure Analysis - 30 Day Retention` to `Script Failure Analysis - 30 Day Retention`.
- The logic has been converted from weekly to daily data updates for better accuracy.
- This update will remove the existing data and start anew.

**Update Instructions:**
- Update/import the [Script - Script Failure Analysis - 30 Day Retention](<../cwa/scripts/Script Failure Analysis - 30 Day Retention.md>) from the `Prosync` plugin.
- Update/import the [Dataview - Script Failure Assessment - Last 30 Days](<../cwa/dataviews/Script Failure Assessment - Last 30 Days.md>) from the `Prosync` plugin.
- Navigate to `System` > `Configuration` > `Dashboard` > `Management` > `Scheduled Client Script`.
- Remove the schedule of the old script if it is scheduled (it may be named the same since it was just updated, but the interval needs to be updated).
- Schedule the `Script Failure Analysis - 30 Day Retention` to run once per day, preferably around midnight.  
  ![Image](../../static/img/Script-Failure-Assessment---Last-30-Days/image_1.png)

## Associated Content

### Auditing

| Content                                                                                       | Type    | Function                                                                                                         |
|-----------------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------|
| [Script - Script Failure Analysis - 30 Day Retention](<../cwa/scripts/Script Failure Analysis - 30 Day Retention.md>) | Script  | Create [pvl_Script_Assesment](<../cwa/tables/pvl_Script_Assesment.md>) table. Populate data into it and remove any data older than 30 days from the table. |
| [Dataview - Script Failure Assessment - Last 30 Days](<../cwa/dataviews/Script Failure Assessment - Last 30 Days.md>) | Dataview | Displays the detailed analysis of script failures over the past 30 days                                         |

### Dependencies

| Content                                                                                          | Type         | Function                                                                      |
|--------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------|
| [Custom Table - pvl_Script_Assesment](<../cwa/tables/pvl_Script_Assesment.md>)          | Custom Table | Holds the detailed analysis of script failures over the past 30 days         |

## Implementation

1. Import the following content from the `ProSync` plugin:
   - [Script - Script Failure Analysis - 30 Day Retention](<../cwa/scripts/Script Failure Analysis - 30 Day Retention.md>)
   - [Dataview - Script Failure Assessment - Last 30 Days](<../cwa/dataviews/Script Failure Assessment - Last 30 Days.md>)

2. Reload the system cache:  
   ![Image](../../static/img/Script-Failure-Assessment---Last-30-Days/image_2.png)

3. Execute the [Script - Script Failure Analysis - 30 Day Retention](<../cwa/scripts/Script Failure Analysis - 30 Day Retention.md>) against any client to create the [pvl_Script_Assesment](<../cwa/tables/pvl_Script_Assesment.md>) custom table. This script will automatically provide the necessary table permissions.

4. Validate the presence of data in the [Script Failure Assessment - Last 30 Days](<../cwa/dataviews/Script Failure Assessment - Last 30 Days.md>) dataview.

5. Schedule the [Script Failure Analysis - 30 Day Retention](<../cwa/scripts/Script Failure Analysis - 30 Day Retention.md>) to run daily:
   1. Go to `System` > `Configuration` > `Dashboard` > `Management` > `Scheduled Client Script`.
   2. Navigate to `System` > `Configuration` > `Dashboard` > `Management` > `Scheduled Client Script`.
   3. Schedule the [Script Failure Analysis - 30 Day Retention](https://proval.itglue.com/5078775/docs/16804995) to run once per day, preferably around midnight, as demonstrated in the `Sample Run` section of the document.  
      ![Image](../../static/img/Script-Failure-Assessment---Last-30-Days/image_3.png)




