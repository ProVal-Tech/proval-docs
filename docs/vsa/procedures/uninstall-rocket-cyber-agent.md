---
id: '71eaf31e-adb1-4fd7-84b2-31ecf4873ac5'
slug: /71eaf31e-adb1-4fd7-84b2-31ecf4873ac5
title: 'Uninstall - RocketCyber Agent'
title_meta: 'Uninstall - RocketCyber Agent'
keywords: ['rocket', 'cyber', 'agent']
description: 'Uninstalls the RocketCyber Agent from Windows endpoints by stopping and removing associated services, registry entries, and installation files.'
tags: ['antivirus', 'application', 'uninstallation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-11
---

## Summary

This script performs a complete removal of the RocketCyber Agent from Windows systems. It stops agent services, deletes uninstall records, and removes all RocketAgent files and directories.

## Sample Run

![Image1](../../../static/img/docs/71eaf31e-adb1-4fd7-84b2-31ecf4873ac5/sample-run.webp)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `Uninstall - RocketCyber Agent`   

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the < Name of the ps1 file > from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `rocketagent_uninstall.ps1`  

   ![Image1](../../../static/img/docs/71eaf31e-adb1-4fd7-84b2-31ecf4873ac5/managed-files.webp)

4. Map the `rocketagent_uninstall.ps1` into the `12th` step of the script in the client's environment.   

## Output

- Script Logs

## Changelog

### 2026-06-11

- Initial version of the document

