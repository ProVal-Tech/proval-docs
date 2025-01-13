---
id: 'rmm-folder-redirection-audit'
title: 'Folder Redirection Audit'
title_meta: 'Folder Redirection Audit'
keywords: ['folder', 'redirection', 'audit', 'gpo', 'data']
description: 'This document outlines a solution for auditing folder redirection policies on target machines, allowing users to visualize effective policies, redirected folders, and their destinations. It includes associated content, implementation steps, and FAQs regarding the script and data collection.'
tags: ['audit', 'configuration', 'data', 'gpo', 'monitoring', 'report', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution will provide data related to folder redirection on target machines.  
It can be utilized to visually see users with an effective folder redirection policy, what folders are being redirected, and to where they are being redirected. Redirected folders will be displayed in red in the dataview.

## Associated Content

| Content                                                                                                     | Type         | Function                                                                                                                     |
|-------------------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](https://proval.itglue.com/DOC-5078775-11736631) | Custom Table | Holds returned data from the target and is called by the dataview.                                                        |
| [EPM - Data Collection - Dataview - Redirection-Audit](https://proval.itglue.com/DOC-5078775-11424331)    | Dataview     | Displays data from targets.                                                                                                |
| [EPM - Data Collection - Script - Audit - GPO Redirection Settings](https://proval.itglue.com/DOC-5078775-11735434) | Script       | This script will audit the registry settings associated with any group policy redirection settings. It will populate [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](https://proval.itglue.com/DOC-5078775-11736631) with its returned data. |
| [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355) | Script       | Used by [EPM - Data Collection - Script - Audit - GPO Redirection Settings](https://proval.itglue.com/DOC-5078775-11735434) to populate the data into the table as a safety precaution of potential overflowed variables coming into the rmm. |
| [CWM - Automate - Script - PowerShell Response - All Errors - Check](https://proval.itglue.com/DOC-5078775-11738521) | Script       | This script will take a parents psout variable and check it for known common errors, convert that error into a human readable format, and log that error in human readable format on the script log. This is particularly useful when attempting to determine why a PowerShell command didn't run as expected, and can be instrumental in testing, troubleshooting, and development of future scripts. This script has been used in 12 scripts as a method of troubleshooting, it has gone from 3 known errors to now 7 and can be added to quite easily. |

## Implementation

1. Import the [EPM - Data Collection - Script - Audit - GPO Redirection Settings](https://proval.itglue.com/DOC-5078775-11735434) script.
2. Import the [EPM - Data Collection - Dataview - Redirection-Audit](https://proval.itglue.com/DOC-5078775-11424331) dataview.
3. Schedule the script as desired, via monitor, scheduled script.
4. Review the Dataview for result.

## FAQ

1. What happens if I run this on a schedule, will the table bloat?
   1. Not necessarily. If the script is run multiple times on the same machine, it will update the 'value' column in the custom table only, using the computerID, the User, and the PropertyName as the primary keys. So, unless a new user is added, data will simply be changed rather than added. On average, 1 computer with 1 user will render about 16kib of data in the table.


