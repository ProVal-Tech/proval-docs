---
id: 'd0d38e82-7faf-4e0f-86b3-81b01a9f18fb'
slug: /d0d38e82-7faf-4e0f-86b3-81b01a9f18fb
title: 'Plugin_ProVal_PNPDevices'
title_meta: 'Plugin_ProVal_PNPDevices'
keywords: ['pnpdevices', 'storage', 'script', 'connectwise', 'inventory']
description: 'This document outlines the purpose and dependencies of the PNP Devices Storage Script within ConnectWise Automate. It details the data structure used to store information about PNP devices, including their status and classification.'
tags: ['database']
draft: false
unlisted: false
---

## Purpose

Stores the data collected by the [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9) script.

## Dependencies

- [CWM - Automate - Dataview - Get-PNPDevices [Script]](/docs/f0f7231c-f13b-46a0-baa6-aebb8640adaf)
- [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9)
- [CWM - Automate - Solution - PNP Devices Inventory](/docs/f92a5e4c-9ade-4cb9-ba9f-4e8b7d6ae0da)

## Tables

#### plugin_proval_pnpdevices

| Column        | Type         | Explanation                          |
|---------------|--------------|--------------------------------------|
| Computerid    | int(11)     | Computer ID                           |
| FriendlyName   | varchar(1000) | Friendly name of the PNP device      |
| Status        | varchar(1000) | Current status of the PNP device     |
| Class         | varchar(1000) | Class of the PNP device               |
| Date          | datetime     | Script run time                      |

