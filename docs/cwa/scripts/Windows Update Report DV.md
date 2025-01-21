---
id: '41141ff5-ef57-4900-93d4-642b4a9d254f'
title: 'Windows Update Report'
title_meta: 'Windows Update Report'
keywords: ['patches', 'report', 'windows', 'update', 'table']
description: 'This document provides a comprehensive guide on retrieving a detailed list of installed or available patches on a local machine and storing the information in a custom table named plugin_proval_windows_update_report. It includes sample runs, dependencies, variables, and a step-by-step process for execution.'
---

## Summary

Get a detailed list of patches that are installed or available on the local machine and store it in the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) custom table.

## Sample Run

![Sample Run](../../../static/img/Windows-Update-Report-DV/image_1.png)

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](<../../powershell/Get-WindowsUpdateReport.md>)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Dataview - Windows Update Report [Script]](<../dataviews/Windows Update Report Script.md>)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](<../tables/plugin_proval_windows_update_report.md>)
- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](<./OverFlowedVariable - SQL Insert - Execute.md>)

## Variables

| Name            | Description                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| InsertStatement  | Result of the PowerShell script that attempts to retrieve the Windows Update Report            |

## Process

1. Creating the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) table if it does not already exist.
2. Changing the structure of the table if the partner is still using the older structure. This step also removes duplicate entries from the table.
3. Running the PowerShell script to retrieve the Windows Update Report.
4. Verifying the outcome.
5. Parsing the outcome to ensure SQL compatibility.
6. Inserting the data into the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) table.
7. Logging any failures.

## Output

- Script Log
- Custom Table
- Dataview
