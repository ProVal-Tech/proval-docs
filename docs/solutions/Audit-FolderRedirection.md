---
id: '4ffcbf2c-6ba7-4373-a4f0-558f969557ca'
title: 'Folder Redirection Audit'
title_meta: 'Folder Redirection Audit'
keywords: ['folder', 'redirection', 'audit', 'gpo', 'data']
description: 'This document outlines a solution for auditing folder redirection policies on target machines, allowing users to visualize effective policies, redirected folders, and their destinations. It includes associated content, implementation steps, and FAQs regarding the script and data collection.'
tags: ['gpo', 'report', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution will provide data related to folder redirection on target machines.  
It can be utilized to visually see users with an effective folder redirection policy, what folders are being redirected, and to where they are being redirected. Redirected folders will be displayed in red in the dataview.

## Associated Content

| Content                                                                                                     | Type         | Function                                                                                                                     |
|-------------------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](<../cwa/tables/plugin_proval_gpo_redirection_audit.md>) | Custom Table | Holds returned data from the target and is called by the dataview.                                                        |
| [EPM - Data Collection - Dataview - Redirection-Audit](<../cwa/dataviews/Redirection-Audit.md>)    | Dataview     | Displays data from targets.                                                                                                |
| [EPM - Data Collection - Script - Audit - GPO Redirection Settings](<../cwa/scripts/Audit - GPO Redirection Settings.md>) | Script       | This script will audit the registry settings associated with any group policy redirection settings. It will populate [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](<../cwa/tables/plugin_proval_gpo_redirection_audit.md>) with its returned data. |
| [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](<../cwa/scripts/OverFlowedVariable - SQL Insert - Execute.md>) | Script       | Used by [EPM - Data Collection - Script - Audit - GPO Redirection Settings](<../cwa/scripts/Audit - GPO Redirection Settings.md>) to populate the data into the table as a safety precaution of potential overflowed variables coming into the rmm. |
| [CWM - Automate - Script - PowerShell Response - All Errors - Check](<../cwa/scripts/PowerShell Response - All Errors - Check.md>) | Script       | This script will take a parents psout variable and check it for known common errors, convert that error into a human readable format, and log that error in human readable format on the script log. This is particularly useful when attempting to determine why a PowerShell command didn't run as expected, and can be instrumental in testing, troubleshooting, and development of future scripts. This script has been used in 12 scripts as a method of troubleshooting, it has gone from 3 known errors to now 7 and can be added to quite easily. |

## Implementation

1. Import the [EPM - Data Collection - Script - Audit - GPO Redirection Settings](<../cwa/scripts/Audit - GPO Redirection Settings.md>) script.
2. Import the [EPM - Data Collection - Dataview - Redirection-Audit](<../cwa/dataviews/Redirection-Audit.md>) dataview.
3. Schedule the script as desired, via monitor, scheduled script.
4. Review the Dataview for result.

## FAQ

1. What happens if I run this on a schedule, will the table bloat?
   1. Not necessarily. If the script is run multiple times on the same machine, it will update the 'value' column in the custom table only, using the computerID, the User, and the PropertyName as the primary keys. So, unless a new user is added, data will simply be changed rather than added. On average, 1 computer with 1 user will render about 16kib of data in the table.












