---
id: 'c3ad2c46-6bae-4df4-980a-f937faf56dbc'
slug: /c3ad2c46-6bae-4df4-980a-f937faf56dbc
title: 'Uninstall Datto Backup Tool'
title_meta: 'Uninstall Datto Backup Tool'
keywords: ['datto', 'cloud', 'continuity']
description: 'This script uninstalls the Datto Windows Agent or Datto Cloud Continuity or both, depending on the option selected at the "Uninstall Datto Backup Tool" client-level EDF. It then grabs the quietuninstallstring from the registry of the installed application.'
tags: ['datto', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-05-19
---

## Summary
This script uninstalls the Datto Endpoint Backup, Datto Windows Agent or Datto Cloud Continuity or all, depending on the option selected at the `Uninstall Datto Backup Tool` client-level EDF. It then grabs the quietuninstallstring from the registry of the installed application.

## Sample Run

**First Run:** Execute the script with the user parameter `SetEnvironment` as 1 to import the EDFs needed for the script.    

![Sample Run](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image5.webp)  

**Regular Run:**  

![Sample Run](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image6.webp)


## Dependencies

[Solution - Uninstall Datto Backup Tool](/docs/cd3e8104-0edb-4bcf-933c-eb8d6e3b5022)

## EDFs

| Name | Level | Type | Section | Description |
| --------- | --------- | ------------ | --------- | -------------------------------------------- |
| `Uninstall Datto Backup tool` | Client | Drop-down | Datto | This dropdown allows to select the  `Datto Endpoint Backup`, `Datto Windows Agents` or `Datto Cloud Continuity` or `All` for uninstallation ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image7.webp)|
| `Exclude Datto Backup tool Removal` | Location | Checkbox | Exclusions | This excludes the location from the uninstallation of Datto backup tools.  ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image9.webp)|
|`Exclude Datto Backup tool Removal` | Computer | Checkbox | Exclusions | This exclude the computer from the uninstallation of Datto backup tools. ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image8.webp)|


## Process

- It checks if the agent has  `Datto Endpoint Backup`, `Datto Windows Agent` or `Datto Cloud Continuity` or all of these installed, depending on the option selected at the `Uninstall Datto Backup Tool` client-level EDF.
- If detected, then it writes a PS1 on the agent with file hashes (shown above) that can be used to whitelist if any third-party blocking application is installed in the environment that can restrict the PowerShell execution.
- The PS1 fetches the quiet uninstall command from the application registry and executes it using the system account, and uninstalls the application along with proper error handling

## Output

- Script Log

## Changelog

### 2026-05-19

- Updated the solution to uninstall `Datto Endpoint Backup` as well.
- Code signed the script.

### 2025-11-06

- Initial version of the document
