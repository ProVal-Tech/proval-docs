---
id: '59738aa7-5495-4e4d-a36a-cc8af2643865'
slug: /59738aa7-5495-4e4d-a36a-cc8af2643865
title: 'EPM - Data Collection - Automate - Script Get - Battery Report'
title_meta: 'EPM - Data Collection - Automate - Script Get - Battery Report'
keywords: ['data', 'collection', 'battery', 'report', 'sql', 'insert']
description: 'This document outlines a script that runs the agnostic EPM data collection process to retrieve battery report data and imports it into the plugin_proval_batteries table. It serves as an autofix for an internal monitoring script and includes dependencies, variables, and a detailed process for execution.'
tags: ['database', 'report', 'setup', 'sql']
draft: false
unlisted: false
---

## Summary

This script runs the agnostic script [EPM - Data Collection - Agnostic - Get-BatteryReport.ps1](/docs/992bde06-574b-4b3a-a442-6962736a18d2) and imports the retrieved data into `plugin_proval_batteries`.

## Sample Run

The intention of this script is to serve as an autofix for an internal monitor named Proval - Production - DailyScript - Get-BatteryReport.

## Dependencies

- [EPM - Data Collection - Agnostic - Get-BatteryReport.ps1](/docs/992bde06-574b-4b3a-a442-6962736a18d2)
- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)

## Variables

| Name               | Description                                                   |
|--------------------|---------------------------------------------------------------|
| TableName          | The name of the table to be created if it doesn't exist.     |
| ColumnNamesSQL     | The columns in the table in comma-separated format.          |
| JsonFileName       | Necessary when using OverFlowedVariable - SQL Insert - Execute|
| SQLStartStatement   | The formatted SQL statement from `INSERT INTO` to `VALUES`.  |
| SQLTailString      | The tail string for the SQL statement from `ON DUPLICATE` to the end of the query. |
| DatapointNames     | Needed when using OverFlowedVariable - SQL Insert - Execute   |

## Process

1. Create the custom table if it doesn't exist.
2. Set up variables for [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8).
3. Run the agnostic process ([EPM - Data Collection - Agnostic - Get-BatteryReport.ps1](/docs/992bde06-574b-4b3a-a442-6962736a18d2)).
4. Run the automate script process ([CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)).


