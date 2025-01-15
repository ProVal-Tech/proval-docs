---
id: '41141ff5-ef57-4900-93d4-642b4a9d254f'
title: 'Windows Update Report'
title_meta: 'Windows Update Report'
keywords: ['patches', 'report', 'windows', 'update', 'table']
description: 'This document provides a comprehensive guide on retrieving a detailed list of installed or available patches on a local machine and storing the information in a custom table named plugin_proval_windows_update_report. It includes sample runs, dependencies, variables, and a step-by-step process for execution
## Summary

Get a detailed list of patches that are installed or available on the local machine and store it in the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) custom table.

## Sample Run

![Sample Run](../../../static/img/Windows-Update-Report-DV/image_1.png)

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](https://proval.itglue.com/DOC-5078775-10861700)
- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355)

## Variables

| Name            | Description                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| InsertStatement  | Result of the PowerShell Script attempted to retrieve the Windows Update Report                |

## Process

Step 1: Creating the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) table if it already not exists.  
Step 2: Change the structure of the table, if the partner is still using the older structure. Also removes the duplicate entry from the table.  
Step 3: Running the PowerShell script to retrieve the Windows Update Report.  
Step 4: Verifying the Outcome.  
Step 5: Parsing the Outcome to ensure SQL compatibility.  
Step 6: Inserting the data to the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) Table.  
Step 7: Logging the Failure.  

## Output

- Script Log
- Custom Table
- Dataview






