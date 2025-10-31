---
id: 'cd3e8104-0edb-4bcf-933c-eb8d6e3b5022'
slug: /cd3e8104-0edb-4bcf-933c-eb8d6e3b5022
title: 'Uninstall Datto Windows Agent Or Datto Cloud Continuity'
title_meta: 'Uninstall Datto Windows Agent Or Datto Cloud Continuity'
keywords: ['datto', 'cloud', 'continuity']
description: 'This solution contains the contents that perform the Datto Windows Agent or Datto Cloud Continuity uninstallation'
tags: ['datto']
draft: false
unlisted: false
---

## Purpose

This solution contains the contents that perform the Datto Windows Agent or Datto Cloud Continuity uninstallation.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)      | Script | This script uninstalls the Datto Windows Agent and Datto Cloud Continuity by grabbing the quietuninstallstring from the registry of the installed application. |
| [Monitor - Uninstall Datto Windows Agents And Datto Cloud Continuity](/docs/34ba8b59-6973-43e5-8729-d821f669a00c) | Internal Monitor | This monitor detects the online Windows agent where the Datto Windows Agent or Datto Cloud Continuity is installed and the client-level EDF "Uninstall Datto Windows And Cloud Continuity" is checked whereas location-level and computer-level exclusion EDFs "Exclude Uninstall Datto Windows|Cloud Continuity" are not checked. |
| Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity | Alert Template | This alert template triggers the [Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) on the detected agents of the monitor to perform the uninstallation of the Datto Windows Agent or Datto Cloud Continuity |

## Implementation

- Import the [Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)
- Import the [Monitor - Uninstall Datto Windows Agents And Datto Cloud Continuity](/docs/34ba8b59-6973-43e5-8729-d821f669a00c)
- Import the `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`
- Check the client level-EDF `Uninstall Datto Windows And Cloud Continuity` where the Datto Windows Agent or Datto Cloud Continuity is required to uninstall.
  ![Client-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image.webp)

- If the location or any computer required to be excluded from the detection of the monitor to perform the uninstallation of Datto Windows Agent or Datto Cloud Continuity, then check the location/computer level exclusion EDF `Exclude Uninstall Datto Windows|Cloud Continuity`
  ![Location-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image2.webp)
  ![Computer-EDF](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image3.webp)

- Once EDFs are set, the monitor will detect 20 online Windows agents every hour where the Datto Windows Agent or Datto Cloud Continuity are installed and perform the uninstallation by triggering the script [Script - Uninstall Datto Windows Agent Or Datto Cloud Continuity](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) using `Alert Template - △ Custom - Execute Script - Uninstall Datto Windows|Cloud Continuity`.