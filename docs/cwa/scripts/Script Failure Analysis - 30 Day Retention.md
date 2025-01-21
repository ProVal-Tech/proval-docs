---
id: '36a13e9c-fd23-4dae-9979-04a99a787ac0'
title: 'Weekly Script Failure Analysis - 30 Day Retention'
title_meta: 'Weekly Script Failure Analysis - 30 Day Retention'
keywords: ['script', 'failure', 'analysis', 'retention', 'data', 'update']
description: 'This document outlines the purpose and updates of the Weekly Script Failure Analysis - 30 Day Retention script, which creates and manages a data table for script failure assessments, ensuring data is accurately updated daily and older data is removed efficiently.'
tags: ['database', 'performance', 'update']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to create the [pvl_Script_Assessment](<../tables/pvl_Script_Assesment.md>) table, populate data into it, and remove any data older than 30 days from the table.

## Update Notice: 29-November-2024

**Changes:**
- The script has been renamed from `Script Failure Analysis - 30 Day Retention` to `Weekly Script Failure Analysis - 30 Day Retention`.
- The logic has been converted from weekly to daily data updates for better accuracy.

**Update Instructions:**
- Update/import the [`Script Failure Analysis - 30 Day Retention`](https://proval.itglue.com/5078775/docs/16804995) from the `Prosync` plugin.
- Navigate to `System` > `Configuration` > `Dashboard` > `Management` > `Scheduled Client Script`.
- Remove the schedule for the `Weekly Script Failure Analysis - 30 Day Retention` script.
- Schedule the `Script Failure Analysis - 30 Day Retention` to run once per day, preferably around midnight, as demonstrated in the `Sample Run` section of the document.

## Sample Run

Schedule the script to run once per day, preferably around midnight.  
![Sample Run](../../../static/img/Script-Failure-Analysis---30-Day-Retention/image_1.png)
