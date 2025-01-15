---
id: '97e53493-0cd3-4b69-91b1-1e3f70111f5f'
title: 'Upgrade/Swap Agents Hard-Drives or SSDs in ConnectWise Automate'
title_meta: 'Upgrade/Swap Agents Hard-Drives or SSDs in ConnectWise Automate'
keywords: ['upgrade', 'swap', 'agents', 'hard-drives', 'ssd', 'connectwise', 'automate', 'monitoring']
description: 'This document addresses the issue of ConnectWise Automate not reflecting newly imaged hard drives or SSDs. It provides a state-based monitor to detect when Automate fails to pull the correct drive information and suggests alert configurations for managed Windows machines.'
tags: ['configuration', 'monitoring', 'windows', 'service', 'alerting']
draft: false
unlisted: false
---
## Summary

Issue:  Upgrade/Swap Agents Hard-Drives or SSDs with Imaged Drives and the Model Number in ConnectWise Automate® still reflects the original Hard-Drive / SSD.

Detects the machines where [Automate is not pulling newly imaged HDD or SSD.](https://docs.connectwise.com/ConnectWise_Automate_Support_Wiki/100/Automate_Not_Pulling_NEW_Imaged_HDD_or_SSD)

It is a State based monitor and the WARNING state indicates the PowerShell failures or any security program is blocking PowerShell from reading the registry keys.

## Details

**Suggested "Limit to"**: Managed Windows Machines

**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Incorrect Drive Inventory

## Dependencies

[CWM - Automate - Script - Incorrect Drive Inventory [Autofix]](https://proval.itglue.com/DOC-5078775-11801993)

## Target

- Service Plans.Windows Workstations.Managed 24x7
- Service Plans.Windows Workstations.Managed 8x5
- Service Plans.Windows Servers.Managed 8x5
- Service Plans.Windows Servers.Managed 24x7

## Screenshots

**Status Tab:**  
![Status Tab](../../../static/img/Incorrect-Drive-Inventory/image_1.png)

**Alerting Tab:**  
![Alerting Tab](../../../static/img/Incorrect-Drive-Inventory/image_2.png)

**Configuration Tab:**  
![Configuration Tab](../../../static/img/Incorrect-Drive-Inventory/image_3.png)






