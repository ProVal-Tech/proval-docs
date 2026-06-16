---
id: 'aaaecd48-e82a-408c-8e6f-12adc2f15374'
slug: /aaaecd48-e82a-408c-8e6f-12adc2f15374
title: 'Manage - Windows Installer Cache'
title_meta: 'Manage - Windows Installer Cache'
keywords: ['msi', 'cache', 'windows', 'installer']
description: 'The script does not remove Unverified entries. It only removes installers identified as Safe Orphan. Unverified files are retained because their usage cannot be confirmed, and removing them could affect application repair, update, or uninstall operations.'
tags: ['solution','kaseya', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Summary

The script does not remove Unverified entries. It only removes installers identified as Safe Orphan. Unverified files are retained because their usage cannot be confirmed, and removing them could affect application repair, update, or uninstall operations.

## Sample Run

![Image](../../../static/img/docs/aaaecd48-e82a-408c-8e6f-12adc2f15374/sample-run.webp)

## Dependencies

Agnostic Content: [Agnostic - Manage-WindowsInstallerCache](/docs/fb30b46a-ae2e-498f-b049-48f687fea928)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** Manage - Windows Installer Cache   

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the `Manage-WindowsInstallerCache-KI.ps1` from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `Manage-WindowsInstallerCache-KI.ps1`  

  ![Image](../../../static/img/docs/aaaecd48-e82a-408c-8e6f-12adc2f15374/managed-files.webp)

4. Map the `Manage-WindowsInstallerCache-KI.ps1` into the `25th` step of the script in the client's environment.
   
## Output

- Script Logs
- C:\programdata\_automation\script\Manage-WindowsInstallerCache-log.txt
- C:\programdata\_automation\script\Manage-WindowsInstallerCache-error.txt

## Changelog

### 2026-06-15

- Initial version of the document