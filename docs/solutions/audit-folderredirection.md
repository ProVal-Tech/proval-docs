---
id: '4ffcbf2c-6ba7-4373-a4f0-558f969557ca'
slug: /4ffcbf2c-6ba7-4373-a4f0-558f969557ca
title: 'Audit-FolderRedirection'
title_meta: 'Audit-FolderRedirection'
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
| [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](/docs/025887c2-41a2-4e85-b706-dc0841a104d9) | Custom Table | Holds returned data from the target and is called by the dataview.                                                        |
| [EPM - Data Collection - Dataview - Redirection-Audit](/docs/85f4745d-0f15-425d-a6a0-d11bc27ce0f7)    | Dataview     | Displays data from targets.                                                                                                |
| [EPM - Data Collection - Script - Audit - GPO Redirection Settings](/docs/aa50a67f-a0b6-4b97-8e89-18b0155265cc) | Script       | This script will audit the registry settings associated with any group policy redirection settings. It will populate [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](/docs/025887c2-41a2-4e85-b706-dc0841a104d9) with its returned data. |
| [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) | Script       | Used by [EPM - Data Collection - Script - Audit - GPO Redirection Settings](/docs/aa50a67f-a0b6-4b97-8e89-18b0155265cc) to populate the data into the table as a safety precaution against potential overflowed variables coming into the RMM. |
| [CWM - Automate - Script - PowerShell Response - All Errors - Check](/docs/89346170-6657-4784-93cf-c0aa024b4386) | Script       | This script will take a parent's `psout` variable and check it for known common errors, convert that error into a human-readable format, and log that error in human-readable format on the script log. This is particularly useful when attempting to determine why a PowerShell command didn't run as expected and can be instrumental in testing, troubleshooting, and development of future scripts. This script has been used in 12 scripts as a method of troubleshooting; it has gone from 3 known errors to now 7 and can be added to quite easily. |

## Implementation

1. Import the [EPM - Data Collection - Script - Audit - GPO Redirection Settings](/docs/aa50a67f-a0b6-4b97-8e89-18b0155265cc) script.
2. Import the [EPM - Data Collection - Dataview - Redirection-Audit](/docs/85f4745d-0f15-425d-a6a0-d11bc27ce0f7) dataview.
3. Schedule the script as desired, via monitor or scheduled script.
4. Review the Dataview for results.

## FAQ

1. What happens if I run this on a schedule? Will the table bloat?
   1. Not necessarily. If the script is run multiple times on the same machine, it will update the 'value' column in the custom table only, using the `computerID`, the `User`, and the `PropertyName` as the primary keys. So, unless a new user is added, data will simply be changed rather than added. On average, one computer with one user will render about 16 KiB of data in the table.

