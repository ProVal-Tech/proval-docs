---
id: 'cd3e8104-0edb-4bcf-933c-eb8d6e3b5022'
slug: /cd3e8104-0edb-4bcf-933c-eb8d6e3b5022
title: 'Uninstall Datto Backup Tool'
title_meta: 'Uninstall Datto Backup Tool'
keywords: ['datto', 'cloud', 'continuity']
description: 'This solution contains the contents that perform the Datto Windows Agent or Datto Cloud Continuity uninstallation'
tags: ['datto']
draft: false
unlisted: false
---

## Purpose

This solution contains the contents that perform the Datto Windows Agent or Datto Cloud Continuity uninstallation on CW Automate.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)      | Script | This script uninstalls the Datto Windows Agent or Datto Cloud Continuity or both, depending on the option selected at the `Uninstall Datto Backup tool` client-level EDF. |
| [Uninstall Datto Backup tool](/docs/34ba8b59-6973-43e5-8729-d821f669a00c) | Internal Monitor | This monitor runs every hour to check for the online Windows agents, where the client EDF `Uninstall Datto Backup tool` option are selected, and location/computer-level exclusion EDF `Exclude Datto Backup tool Removal` are not checked, to uninstall the application. |
| △ Custom - Execute Script - Uninstall Datto Backup Tool | Alert Template | This alert template triggers the [Script - Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc) on the detected agents of the monitor to perform the uninstallation of the Datto Windows Agent or Datto Cloud Continuity |

## Implementation

- Import the [Script - Uninstall Datto Backup Tool](/docs/c3ad2c46-6bae-4df4-980a-f937faf56dbc)
- Import the [Monitor -Uninstall Datto Backup tool](/docs/34ba8b59-6973-43e5-8729-d821f669a00c)
- Import the **Alert Template** `△ Custom - Execute Script - Uninstall Datto Backup Tool`
- Follow the [Monitor -Uninstall Datto Backup tool](/docs/34ba8b59-6973-43e5-8729-d821f669a00c) documentation to enable its implementation.