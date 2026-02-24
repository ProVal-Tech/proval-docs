---
id: '26bda8e8-6bca-46c3-894f-3eb838340982'
slug: /26bda8e8-6bca-46c3-894f-3eb838340982
title: 'Intel® Driver & Support Assistant Solution'
title_meta: 'Intel® Driver & Support Assistant Solution'
keywords: ['intel', 'driver', 'assistant', 'support', 'uninstallation', 'installation']
description: 'This document contains the automation for the Intel DSA deployment and uninstallation.'
tags: ['drivers']
draft: false
unlisted: false
---

## Purpose

This document contains the automation for the Intel DSA deployment and uninstallation.

## Associated Deployment Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Intel DSA Install](/docs/956ab7bd-320c-49b9-be27-1783976994d2)      | Script | Silently installs `Intel® Driver & Support Assistant` (DSA) on eligible Windows Workstations |
| [Intel DSA Deployment](/docs/eff35c87-7793-4eae-bd7b-23daf13267b6)      | Internal Monitor | This detects the online Windows Workstations that have an Intel Processor, and the deployment EDF is selected at the client level, and the `Intel® Driver & Support Assistant` is not installed |
| `**△ Custom - Execute Script - Intel DSA Install**`      | Alert Template | Apply the alert template to the [Monitor - Intel DSA Deployment](/docs/eff35c87-7793-4eae-bd7b-23daf13267b6) so that Intel DSA can be installed via [Script - Intel DSA Install](/docs/956ab7bd-320c-49b9-be27-1783976994d2) on the detected agents.   |

## Associated Uninstallation Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Intel DSA uninstall](/docs/1d65e4c6-7d5c-419d-9e53-6cf3f12f6fff)      | Script | Silently uninstalls `Intel® Driver & Support Assistant` (DSA) on eligible Windows Workstations |
| [Intel DSA Uninstall](/docs/a0bada01-f2d4-4e3d-a4d4-7aa558ec27a3)      | Internal Monitor | This detects the online Windows Workstations that have the `Intel® Driver & Support Assistant` installed. |
| `**△ Custom - Execute Script - Intel DSA Uninstall**`      | Alert Template | Apply the alert template to the [Monitor - Intel DSA Uninstall](/docs/a0bada01-f2d4-4e3d-a4d4-7aa558ec27a3) so that Intel DSA can be uninstalled via [Script - Intel DSA uninstall](/docs/1d65e4c6-7d5c-419d-9e53-6cf3f12f6fff) on the detected agents.   |

## Implementation

- Import the [Script - Intel DSA Install](/docs/956ab7bd-320c-49b9-be27-1783976994d2)
- Import the [Script - Intel DSA uninstall](/docs/1d65e4c6-7d5c-419d-9e53-6cf3f12f6fff)
- Import the [Monitor - Intel DSA Deployment](/docs/eff35c87-7793-4eae-bd7b-23daf13267b6)
- Import the [Monitor - Intel DSA Uninstall](/docs/a0bada01-f2d4-4e3d-a4d4-7aa558ec27a3)
- Import the `Alert Template - △ Custom - Execute Script - Intel DSA Install`
- Import the `Alert Template - △ Custom - Execute Script - Intel DSA Uninstall`
- For the implementation please refer to the Monitor contents.
