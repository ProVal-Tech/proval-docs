---
id: 'd0d38e82-7faf-4e0f-86b3-81b01a9f18fb'
title: 'PNP Devices Storage Script'
title_meta: 'PNP Devices Storage Script for ConnectWise Automate'
keywords: ['pnpdevices', 'storage', 'script', 'connectwise', 'inventory']
description: 'This document outlines the purpose and dependencies of the PNP Devices Storage Script within ConnectWise Automate. It details the data structure used to store information about PNP devices, including their status and classification.'
tags: ['database']
draft: false
unlisted: false
---
## Purpose

Stores the data grabbed by the [CWM - Automate - Script - Get-PNPDevices [DV]](<../scripts/Get-PNPDevices DV.md>) script.

## Dependencies

- [CWM - Automate - Dataview - Get-PNPDevices [Script]](<../dataviews/Get-PNPDevices Script.md>)
- [CWM - Automate - Script - Get-PNPDevices [DV]](<../scripts/Get-PNPDevices DV.md>)
- [CWM - Automate - Solution - Pnp Devices Inventory](<../../solutions/Pnp Devices Inventory.md>)

## Tables

#### plugin_proval_pnpdevices

| Column        | Type         | Explanation                          |
|---------------|--------------|--------------------------------------|
| Computerid    | int(11)     | Computerid                           |
| FriendlyName   | varchar(1000) | Friendly Name of the PnpDevice      |
| Status        | varchar(1000) | Current Status of the PnpDevice     |
| Class         | Varchar(1000) | Class of the PnpDevice               |
| Date          | datetime     | Script Run Time                      |












