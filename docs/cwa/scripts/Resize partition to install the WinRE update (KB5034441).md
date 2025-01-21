---
id: '25717003-b658-47c5-abdf-978f9c2b5d5c'
title: 'Resize partition to install the WinRE update (KB5034441)'
title_meta: 'Resize partition to install the WinRE update (KB5034441)'
keywords: ['partition', 'winre', 'update', 'resize', 'windows']
description: 'This document provides a detailed overview of a script designed to manually resize a partition for the installation of the Windows Recovery Environment (WinRE) update, following Microsoft guidelines. It includes cautionary notes, sample runs, variable descriptions, user parameters, implementation steps, and expected output for users looking to execute this task effectively.'
tags: ['recovery', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script is based on the Microsoft article:  
[Instructions to Manually Resize Your Partition to Install the WinRE Update](https://support.microsoft.com/en-us/topic/kb5028997-instructions-to-manually-resize-your-partition-to-install-the-winre-update-400faa27-9343-461c-ada9-24c8229763bf)  

It creates the primary partition with the size increase, and a label 'Windows RE Tools' is assigned to it.

## Caution

![Image 1](../../../static/img/Resize-partition-to-install-the-WinRE-update-(KB5034441)/image_1.png)

![Image 2](../../../static/img/Resize-partition-to-install-the-WinRE-update-(KB5034441)/image_2.png)

![Image 3](../../../static/img/Resize-partition-to-install-the-WinRE-update-(KB5034441)/image_3.png)

## Sample Run

![Sample Run](../../../static/img/Resize-partition-to-install-the-WinRE-update-(KB5034441)/image_4.png)

## Variables

| Name                          | Description                                                                                                 |
|-------------------------------|-------------------------------------------------------------------------------------------------------------|
| Windows RE Update Fix (EDF)  | This EDF is checked when the script runs successfully to create the Windows RE Tools primary partition     |

### User Parameters

| Name           | Example | Required | Description                                                                                      |
|----------------|---------|----------|--------------------------------------------------------------------------------------------------|
| IncreasedMBSize| 250     | True     | This sets the MB size which will be shrunk from the primary partition and added to the new partition creation. Note: The size is provided here in MB. |

## Implementation

- Import the script 'Resize Partition to Install the WinRE Update (KB5034441)'.
- After import, reload the cache so the EDF is imported with the script.

## Output

- Script log



