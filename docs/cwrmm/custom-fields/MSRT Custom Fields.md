---
id: 'c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363'
title: 'MSRT custom fields'
title_meta: 'MSRT custom fields'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This document provides a detailed guide on creating a custom fields for the MSRT(Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations.'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Summary

This document provides a detailed guide on creating a custom fields for the MSRT(Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations. It is utilized by the [Task - Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>)
and [Task - Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>) tasks.

## Dependencies

[Task - Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>)

[Task - Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>)

## Create the Custom Field
Create Custom Field

![Create Custom field](../../../static/img/Huntress-Org_Key/image_1.png)

Create MSRT Scanner Result

![MSRT Scanner Result](<../../../static/img/docs/MSRT Custom Fields/{898F1953-6777-4DE9-B466-FC141CCB0A21}.png>)

Create MSRT Scanner Enable

![MSRT Scanner Enable](<../../../static/img/docs/MSRT Custom Fields/{18AB4A35-2DE6-4B91-8049-035CE6348E80}.png>)

Create MSRT Disable Uninstall

![MSRT Disable Uninstall](<../../../static/img/docs/MSRT Custom Fields/{418FA56A-F92C-4CB9-915D-9D94BF6133A8}.png>)

Create Exclude MSRT Scanning

![Exclude MSRT Scanning](<../../../static/img/docs/MSRT Custom Fields/{4D413CD1-E1C5-4536-96D9-9048A16F6031}.png>)

Create Exclude MSRT Disable Uninstall

![Exclude MSRT Disable Uninstall](<../../../static/img/docs/MSRT Custom Fields/{0F914FF7-BBBF-4964-9047-4102338E1837}.png>)
## Details

| Field Name                | Level    | Type     | Default Value | Description                                                                 | Editable |
|---------------------------|----------|----------|---------------|-----------------------------------------------------------------------------|----------|
| MSRT Scanner Result       | Endpoint | Text Box | Leave blank   | This stores the scanner or MSRT disabling output and the date when the last changes were made | No       |
| MSRT Scanner Enable       | Company  | Flag     | No            | This checkbox allows to scan the agent using Malicious Software Removal Tool and create ticket if malware detected. | Yes      |
| MSRT Disable Uninstall    | Company  | Flag     | No            | This checkbox ensures the agents of the client get its MSRT disabled and uninstalled. | Yes      |
| Exclude MSRT Scanning     | Endpoint | Flag     | No            | This excludes the agent from the MSRT scanning.                              | Yes      |
| Exclude MSRT Disable Uninstall | Endpoint | Flag     | No            | This checkbox excludes the agent from the MSRT disabling.                    | Yes      |


## Screenshot

All MSRT custom fields list

![All MSRT custom fields](<../../../static/img/docs/MSRT Custom Fields/{9E094A20-FA3B-48C8-8B6F-E9D4AEE54AC5}.png>)