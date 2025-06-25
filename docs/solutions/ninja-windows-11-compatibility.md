---
id: 'fa172fda-07d3-4a7c-bb17-5e7179db991a'
slug: /fa172fda-07d3-4a7c-bb17-5e7179db991a
title: 'Windows 11 Compatibility Validation'
title_meta: 'Windows 11 Compatibility Validation'
keywords: ['Windows', 'incompatible', 'upgrade', 'Windows10']
description: 'This solution is built to fetch the Windows 11 compatible device list and store it in the group'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution is built to fetch the Windows 11 compatible device list and store it in the groups for auditing.

## Associated Content

| **Name**                                 | **Function**   | **Description**                                                                                           |
|------------------------------------------|----------------|-----------------------------------------------------------------------------------------------------------|
| [Group - cpval - Windows 11 Compatible Device](/docs/e4de7e04-7ea5-4f1a-8d44-3ff7ebcbaf4e)     | Group          | This group contains the Windows 10 lists that are compatible with the Windows 11 upgrade. It depends on the script *Windows 11 Compatibility* for fetching this data. |
| [Group - pval - Windows 11 Incompatible device](/docs/ac1500b2-aa22-48fe-b1c2-4d57f9b955de)   | Group          | This group contains the Windows 11 incompatible devices detected by the script *Windows 11 Compatibility*. |
| [Group - Windows 10 Device](/docs/3b41d9f6-f7f2-44f2-9ec3-3d9349e584f0)                        | Group          | This group contains the Windows 10 devices.                                                               |
| [Custom field - cPVAL Win 11 Compatibility](/docs/7967028d-d2ff-4afe-a89e-437541c70208)               | Custom field   | This stores the Windows 11 Compatibility result in it (Capable, Not Capable, or Undetermined).            |
| [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540)                 | Script         | Runs the Microsoft Hardware Readiness Script to verify the hardware compliance.                           |


## Implementation

- The [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540) is default script, if not available, then create it.
- The [Custom field - cPVAL Win 11 Compatibility](/docs/7967028d-d2ff-4afe-a89e-437541c70208) is a default custom field, if not available, then create it.
- Create the [Group - cpval - Windows 11 Compatible Device](/docs/e4de7e04-7ea5-4f1a-8d44-3ff7ebcbaf4e)
- Create the [Group - pval - Windows 11 Incompatible device](/docs/ac1500b2-aa22-48fe-b1c2-4d57f9b955de)
- Create the  [Group - Windows 10 Device](/docs/3b41d9f6-f7f2-44f2-9ec3-3d9349e584f0), if not already created.
- Schedule the script [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540) to the group [Group - Windows 10 Device](/docs/3b41d9f6-f7f2-44f2-9ec3-3d9349e584f0) once a month as recommended, it the frequency can be changed based on partner requirement.
- Once it is scheduled and executed, the groups [Group - cpval - Windows 11 Compatible Device](/docs/e4de7e04-7ea5-4f1a-8d44-3ff7ebcbaf4e) and [Group - pval - Windows 11 Incompatible device](/docs/ac1500b2-aa22-48fe-b1c2-4d57f9b955de) will be automatically updated with the Windows 10 machines that are compatible and incompatible respectively.