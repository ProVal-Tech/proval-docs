---
id: '73762538-8fee-4594-add7-788c89711776'
slug: /73762538-8fee-4594-add7-788c89711776
title: 'Manage - Windows Installer Cache'
title_meta: 'Manage - Windows Installer Cache'
keywords: ['msi', 'cache', 'windows', 'installer']
description: 'The script does not remove Unverified entries. It only removes installers identified as Safe Orphan. Unverified files are retained because their usage cannot be confirmed, and removing them could affect application repair, update, or uninstall operations.'
tags: ['solution','datto', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Overview

The script does not remove Unverified entries. It only removes installers identified as Safe Orphan. Unverified files are retained because their usage cannot be confirmed, and removing them could affect application repair, update, or uninstall operations.

## Dependencies

Agnostic Content: [Agnostic - Manage-WindowsInstallerCache](/docs/fb30b46a-ae2e-498f-b049-48f687fea928)

## Implementation

1. Download the component `Manage - Windows Installer Cache` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/73762538-8fee-4594-add7-788c89711776/IMPORT.webp)  

## Sample Run

To execute the `Manage - Windows Installer Cache` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Manage - Windows Installer Cache` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/73762538-8fee-4594-add7-788c89711776/quick-job.webp)  

3. Search the component `Manage - Windows Installer Cache` and click on `Select`
 ![Image 3](../../../static/img/docs/73762538-8fee-4594-add7-788c89711776/find.webp)

4. ![Image 4](../../../static/img/docs/73762538-8fee-4594-add7-788c89711776/run.webp)

## Output

- Activity log
- C:\programdata\_automation\script\Manage-WindowsInstallerCache-log.txt
- C:\programdata\_automation\script\Manage-WindowsInstallerCache-error.txt

## Attachments  

[Manage-WindowsInstallerCache](../../../static/attachments/Manage-WindowsInstallerCache.cpt)

## Changelog
 
### 2026-06-15
 
- Initial version of the document
