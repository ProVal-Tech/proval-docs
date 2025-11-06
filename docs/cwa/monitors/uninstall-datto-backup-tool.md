---
id: '34ba8b59-6973-43e5-8729-d821f669a00c'
slug: /34ba8b59-6973-43e5-8729-d821f669a00c
title: 'ProVal - Production - Uninstall Datto Backup tool'
title_meta: 'ProVal - Production - Uninstall Datto Backup tool'
keywords: ['datto', 'cloud', 'continuity']
description: 'This monitor detects the online Windows agent where the Datto Windows Agent or Datto Cloud Continuity is installed and the client-level EDF "Uninstall Datto Backup tool" option is selected whereas location-level and computer-level exclusion EDFs "Exclude Datto Backup tool Removal" are not checked.'
tags: ['datto']
draft: false
unlisted: false
---

## Summary
This monitor runs every hour to check for the online Windows agents, where the client EDF `Uninstall Datto Backup tool` option are selected, and location/computer-level exclusion EDF `Exclude Datto Backup tool Removal` are not checked.

It also ensures the agent has the Datto Windows Agent or Datto Cloud Continuity installed.

It has an alert template "△ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity" applied.

## EDFs
| Name | Level | Type | Editable | Description |
| --------- | --------- | ------------ | --------- | -------------------------------------------- |
| `Uninstall Datto Backup tool` | Client | DropDown | Yes | This dropdown allows to select the `Datto Windows Agents` or `Datto Cloud Continuity` or `All` uninstallation ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image7.webp)|
| `Exclude Datto Backup tool Removal` | Location | Checkbox | Yes | This excludes the location from the uninstallation of Datto Windows Agents or Cloud Continuity ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image9.webp)|
| `Exclude Datto Backup tool Removal` | Computer | Checkbox | Yes | This exclude the computer from the uninstallation of Datto Windows Agents or Cloud Continuity ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image8.webp)|

## Dependencies

[Script - Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)

`Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`

## Target

Windows OS

## Implementation

- Import the monitor
- Set the `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`.
- Select the option from the client level-EDF `Uninstall Datto Backup tool` where the Datto Windows Agent or Datto Cloud Continuity is required to uninstall.
  ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image7.webp)

- If the location or any computer required to be excluded from the detection of the monitor to perform the uninstallation of Datto Windows Agent or Datto Cloud Continuity, then check the location/computer level exclusion EDF `Exclude Datto Backup tool Removal`
  ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image9.webp)
  ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image8.webp)

- Once EDFs are set, the monitor will detect 20 online Windows agents every hour where the Datto Windows Agent or Datto Cloud Continuity are installed and perform the uninstallation by triggering the script [Script - Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) using `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`.