---
id: 'cwa-windows-installer-properties-script'
title: 'CWM - Automate - Script - Windows Installer Properties [DV]'
title_meta: 'CWM - Automate - Script - Windows Installer Properties [DV]'
keywords: ['windows', 'installer', 'properties', 'script', 'dataview', 'sql', 'applications', 'management']
description: 'The CWM - Automate - Script - Windows Installer Properties [DV] gathers and stores properties of applications installed on a machine, providing users with a structured overview of software management through SQL tables and dataviews.'
tags: ['database', 'installation', 'setup', 'report', 'software']
draft: false
unlisted: false
---
## Summary

The "CWM - Automate - Script - Windows Installer Properties [DV]" is a script that gathers a set of properties for the applications installed on a machine. This script is designed to collect information for the applications that are listed in the software table only. The information that is collected includes properties such as the product name, version, installation date, and more.

Once the information has been gathered, the script stores it in an SQL table named "pvl_win_installer_properties". Users can then review the gathered information in the dataview named "Windows Installer Properties [Script]". The dataview presents the gathered information in a tabular format, making it easy for users to analyze and interpret the data.

Overall, the "CWM - Automate - Script - Windows Installer Properties [DV]" script provides a useful tool for users who need to manage and monitor the applications installed on their machine. The script's ability to store the gathered information in an SQL table and present it in a dataview adds value and convenience to the data management process. Fetches a set of properties for the installed applications on the machine. The result is limited to the application list present in the `software` table only.

## Sample Run

![Sample Run](5078775/docs/12404266/images/17519861)

## Dependencies

- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355)
- [CWM - Automate - Script - PowerShell Response - All Errors - Check](https://proval.itglue.com/DOC-5078775-11738521)

## Variables

| Name                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| TableName             | Name of the custom table to dump the output, `pvl_win_installer_properties`. |
| Installedapplications  | Distinct name of the applications installed for the machine from software table. |
| psout                 | Output of the powershell script attempting to grab the information.        |

## Output

- Custom Table
- Dataview
- Script Logs

