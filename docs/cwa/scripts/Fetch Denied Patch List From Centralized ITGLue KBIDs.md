---
id: 'cwa-denied-patch-replace-script'
title: 'Denied Patch Replace Script'
title_meta: 'Denied Patch Replace Script'
keywords: ['patches', 'script', 'itglue', 'file', 'email', 'denied']
description: 'This document outlines the Denied Patch Replace Script that runs twice daily on the file server PVL-EUR-FILE-01. It retrieves a list of denied patches from the ITGlue Flexible Asset, saves it to a specified SQL file, and sends informational emails in case of failures.'
tags: ['file', 'email', 'itglue', 'script', 'sql', 'configuration']
draft: false
unlisted: false
---
## Summary

This runs twice per day against our file server "PVL-EUR-FILE-01".  
The script retrieves a list of denied patches from our [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) Flexible Asset.  
This list is then saved to the URL [DeniedPatchReplace.sql](https://file.provaltech.com/repo/config/DeniedPatchReplace.sql). As well as sending an informational email to [ram.kishor@provaltech.com](mailto:ram.kishor@provaltech.com) and [support@provaltech.com](mailto:support@provaltech.com) in the event of failures.  

Note: The script must not be imported to any of our partners.

## Sample Run

![Sample Run](5078775/docs/9563113/images/13227680)

## Dependencies

- [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records)
- [DeniedPatchesReplace.sql](https://file.provaltech.com/repo/config/DeniedPatchReplace.sql)  
- PVL-EUR-FILE-01

## Variables

| Name     | Description                                                                 |
|----------|-----------------------------------------------------------------------------|
| OutFile  | Result of the powershell script writing E:\repo\config\DeniedPatchReplace.sql file. |

#### Global Parameters

| Name                    | Example                           | Required | Description                                                  |
|-------------------------|-----------------------------------|----------|--------------------------------------------------------------|
| repoFilePath            | E:\repo\config\DeniedPatchReplace.sql | Yes      | Path to write the file on PVL-EUR-FILE-01                   |
| API_Key                 |                                   | Yes      | API Key to communicate with ITGlue                           |
| ITGlueFlexAssetName     | Denied Patches                    | Yes      | Name of the flexible asset                                    |
| ITGlueOrganizationID     | 5078775                           | Yes      | Organization ID for the organization hosting the Flexible Asset |

## Process

1. Verifies if the Name of the computer is "PVL-EUR-FILE-01"
2. Executes the PowerShell script to fetch and store the denied patches from ITGlue Flexible Asset to the E:\repo\config\DeniedPatchReplace.sql file.
3. Run a Get-Content Command to verify the content of E:\repo\config\DeniedPatchReplace.sql file.
4. Exits if it finds "REPLACE INTO Plugin_ProVal_Denied_Patches" in the file. Otherwise, will send an informational email to [ram.kishor@provaltech.com](mailto:ram.kishor@provaltech.com) and [support@provaltech.com](mailto:support@provaltech.com).

## Output

[DeniedPatchReplace.sql](https://file.provaltech.com/repo/config/DeniedPatchReplace.sql)

For Failure:  
- Script Log  
- Email  


