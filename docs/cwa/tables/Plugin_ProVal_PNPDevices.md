---
id: 'd0d38e82-7faf-4e0f-86b3-81b01a9f18fb'
title: 'Plugin_ProVal_PNPDevices'
title_meta: 'Plugin_ProVal_PNPDevices'
keywords: ['pnpdevices', 'storage', 'script', 'connectwise', 'inventory']
description: 'This document outlines the purpose and dependencies of the PNP Devices Storage Script within ConnectWise Automate. It details the data structure used to store information about PNP devices, including their status and classification.'
tags: ['database']
draft: false
unlisted: false
---

## Purpose

Stores the data collected by the [CWM - Automate - Script - Get-PNPDevices [DV]](<../scripts/Get-PNPDevices DV.md>) script.

## Dependencies

- [CWM - Automate - Dataview - Get-PNPDevices [Script]](<../dataviews/Get-PNPDevices Script.md>)
- [CWM - Automate - Script - Get-PNPDevices [DV]](<../scripts/Get-PNPDevices DV.md>)
- [CWM - Automate - Solution - PNP Devices Inventory](<../../solutions/Pnp Devices Inventory.md>)

## Tables

#### plugin_proval_pnpdevices

| Column        | Type         | Explanation                          |
|---------------|--------------|--------------------------------------|
| Computerid    | int(11)     | Computer ID                           |
| FriendlyName   | varchar(1000) | Friendly name of the PNP device      |
| Status        | varchar(1000) | Current status of the PNP device     |
| Class         | varchar(1000) | Class of the PNP device               |
| Date          | datetime     | Script run time                      |



