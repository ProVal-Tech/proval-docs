---
id: '34ba8b59-6973-43e5-8729-d821f669a00c'
slug: /34ba8b59-6973-43e5-8729-d821f669a00c
title: 'Uninstall Datto Backup Tool'
title_meta: 'Uninstall Datto Backup Tool'
keywords: ['datto', 'cloud', 'continuity']
description: 'This monitor detects the online Windows agent where the Datto Windows Agent or Datto Cloud Continuity is installed and uninstalls it'
tags: ['datto']
draft: false
unlisted: false
---

## Summary
This monitor runs every hour to check for the online Windows agents , to uninstall the Datto backup tools where the client EDF `Uninstall Datto Backup tool` option are selected, and location/computer-level exclusion EDF `Exclude Datto Backup tool Removal` are not checked.

It also ensures the agent has the Datto Windows Agent or Datto Cloud Continuity installed.

It has an alert template "△ Custom - Execute Script - Uninstall Datto Backup Tool" applied.

## EDFs
| Name | Level | Type | Section | Description |
| --------- | --------- | ------------ | --------- | -------------------------------------------- |
| `Uninstall Datto Backup tool` | Client | Drop-down | Datto | This dropdown allows to select the `Datto Windows Agents` or `Datto Cloud Continuity` or `All` for uninstallation ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image7.webp)|
| `Exclude Datto Backup tool Removal` | Location | Checkbox | Exclusions | This excludes the location from the uninstallation of Datto Windows Agents or Cloud Continuity ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image9.webp)|
|`Exclude Datto Backup tool Removal` | Computer | Checkbox | Exclusions | This exclude the computer from the uninstallation of Datto Windows Agents or Cloud Continuity ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image8.webp)|

## Dependencies

- [Script - Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)
- **Alert Template** `△ Custom - Execute Script - Uninstall Datto Backup Tool`
- [Solution - Uninstall Datto Backup Tool](/docs/cd3e8104-0edb-4bcf-933c-eb8d6e3b5022)

## Target

Windows OS

## Implementation

- Import the monitor from the ProSync plugin 
- Set the **Alert Template** `△ Custom - Execute Script - Uninstall Datto Backup Tool`.
- Select the option from the client level-EDF `Uninstall Datto Backup Tool` where the Datto Windows Agent or Datto Cloud Continuity is required to uninstall.
  ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image7.webp)

- If the location or any computer required to be excluded from the detection of the monitor to perform the uninstallation of Datto Windows Agent or Datto Cloud Continuity, then check the location/computer level exclusion EDF `Exclude Datto Backup tool Removal`

  ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image9.webp)

  ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image8.webp)

- Once EDFs are set, the monitor will detect 50 online Windows agents every hour where the Datto Windows Agent or Datto Cloud Continuity are installed and perform the uninstallation by triggering the script [Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) using **Alert Template** `△ Custom - Execute Script - Uninstall Datto Backup Tool`.