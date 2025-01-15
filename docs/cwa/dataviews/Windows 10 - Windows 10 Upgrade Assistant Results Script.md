---
id: '7d204393-b187-49fe-ba22-17a2e0eb8e3c'
title: 'Windows 10 Upgrade Data Overview'
title_meta: 'Windows 10 Upgrade Data Overview'
keywords: ['upgrade', 'windows', 'data', 'script', 'client', 'location', 'computer', 'version', 'status', 'date']
description: 'This document provides an overview of the data structure used for tracking the Windows 10 Upgrade process, including details on client, location, computer, versioning, and the status of each upgrade attempt.'
tags: ['windows', 'upgrade', 'version', 'data', 'status', 'client', 'location', 'computer']
draft: false
unlisted: false
---
## Columns

| Column              | Type    | Description                                                                                                                  |
|---------------------|---------|------------------------------------------------------------------------------------------------------------------------------|
| Client              | VARCHAR | The name of the client.                                                                                                     |
| Location            | VARCHAR | The name of the location.                                                                                                   |
| Computer            | VARCHAR | The name of the computer.                                                                                                   |
| Starting Version    | VARCHAR | This script state is created by the Windows 10 Upgrade Assistant Script when it is run. It will only update after that script completes. |
| End Version         | VARCHAR | This script state is created by the Windows 10 Upgrade Assistant Follow Up Script when it is run. It will only update after that script completes. |
| Start Date          | VARCHAR | The day and time that the script was run.                                                                                  |
| End Date            | VARCHAR | The day and time that the follow-up script ran to verify the new data.                                                    |
| Last Run Status     | VARCHAR | The calculated column based on the result comparing the starting version and the end version displayed as "Success" and "Failure". |

## Dependencies

This data is populated by the Windows 10 - Upgrade Assistant script as well as a secondary Windows 10 - Upgrade Assistant Follow Up script. Without these scripts, this dataview will not be able to effectively display the data.







