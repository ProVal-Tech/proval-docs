---
id: 'b5078e56-0a3a-4126-81a7-ec586b16aa77'
slug: /b5078e56-0a3a-4126-81a7-ec586b16aa77
title: 'Nutanix VM'
title_meta: 'Nutanix VM'
keywords: ['nutanix', 'vm', 'role', 'database', 'automate']
description: 'This document outlines a role that detects whether a machine is a Nutanix VM and subsequently applies this role in the Automate database, ensuring proper management of virtual environments.'
tags: ['database', 'virtualization', 'windows']
draft: false
unlisted: false
---

## Summary

This role detects if the machine is a Nutanix VM and, if so, applies this role in the Automate database.

## Settings

| Detection String                                                                                     | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| %@powershell.exe "Get-WmiObject -Query 'SELECT Manufacturer FROM Win32_ComputerSystem' | Select-Object -ExpandProperty Manufacturer@% | Equals     | True   | All OS's       |


