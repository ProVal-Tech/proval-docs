---
id: '34ba8b59-6973-43e5-8729-d821f669a00c'
slug: /34ba8b59-6973-43e5-8729-d821f669a00c
title: 'Uninstall Datto Windows Agents And Datto Cloud Continuity'
title_meta: 'Uninstall Datto Windows Agents And Datto Cloud Continuity'
keywords: ['datto', 'cloud', 'continuity']
description: 'This monitor detects the online Windows agent where the Datto Windows Agent or Datto Cloud Continuity is installed and the client-level EDF "Uninstall Datto Windows And Cloud Continuity" is checked whereas location-level and computer-level exclusion EDFs "Exclude Uninstall Datto Windows|Cloud Continuity" are not checked.'
tags: ['datto']
draft: false
unlisted: false
---

## Summary
This monitor runs every hour to check for the online Windows agents, where the client EDF "Uninstall Datto Windows And Cloud Continuity" is checked, and location/computer-level exclusion EDF "Exclude Uninstall Datto Windows|Cloud Continuity" are not checked.

It also ensures the agent has the Datto Windows Agent or Datto Cloud Continuity installed.

It has an alert template "△ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity" applied.

## EDFs
| Name | Level | Type | Editable | Description |
| --------- | --------- | ------------ | --------- | -------------------------------------------- |
| Uninstall Datto Windows And Cloud Continuity | Client | Checkbox | Yes | This checkbox enables the Datto Windows Agents or Datto Cloud Continuity uninstallation ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image.webp)|
| Exclude Uninstall Datto Windows Cloud Continuity | Location | Checkbox | Yes | This excludes the location from the uninstallation of Datto Windows Agents or Cloud Continuity ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image2.webp)|
| Exclude Uninstall Datto Windows Cloud Continuity | Computer | Checkbox | Yes | This exclude the computer from the uninstallation of Datto Windows Agents or Cloud Continuity ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image3.webp)|

## Dependencies

[Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)
`Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`

## Target

Windows OS

## Implementation

- Import the monitor
- Set the `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`.
- Check the client level-EDF `Uninstall Datto Windows And Cloud Continuity` where the Datto Windows Agent or Datto Cloud Continuity is required to uninstall.
  ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image.webp)

- If the location or any computer required to be excluded from the detection of the monitor to perform the uninstallation of Datto Windows Agent or Datto Cloud Continuity, then check the location/computer level exclusion EDF `Exclude Uninstall Datto Windows|Cloud Continuity`
  ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image2.webp)
  ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image3.webp)

- Once EDFs are set, the monitor will detect 20 online Windows agents every hour where the Datto Windows Agent or Datto Cloud Continuity are installed and perform the uninstallation by triggering the script [Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) using `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`.