---
id: 'd6f905af-3e99-4be4-a6eb-d1aa78410375'
title: 'Uninstalling the CrowdStrike Application'
title_meta: 'Uninstalling the CrowdStrike Application'
keywords: ['uninstall', 'crowdstrike', 'application', 'tool', 'removal']
description: 'This document provides a detailed guide on how to uninstall the CrowdStrike Application using the CSUninstallTool.exe. It includes requirements, dependencies, process steps, and output information to ensure a successful uninstallation.'
tags: ['uninstallation', 'software', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This script will uninstall the CrowdStrike Application.

## Requirements

1. The file CSUninstallTool.exe must be placed in the 'LTShare' directory in Software/Crowdstrike

This file is required to be downloaded from the Falcon site. Refer to the below link:

[Download the CrowdStrike Falcon Sensor Windows Uninstall Tool](https://www.dell.com/support/kbdoc/en-in/000126140/how-to-download-the-crowdstrike-falcon-sensor-windows-uninstall-tool)

## Sample Run

![Sample Run](../../static/img/Crowdstrike-Uninstall/image_1.png)

## Dependencies

CsUninstallTool.exe -- File

#### Global Parameters

| Name             | Example | Required | Description                |
|------------------|---------|----------|-----------------------------|
| TicketCreation    | 1 or 0  | False    | 1 - Ticket Create<br>0 - No Ticket |

## Process

1. Verifies CrowdStrike is installed.
2. Downloads the removal tool.
3. Executes the removal of the application.
4. Verifies it was removed.
5. Creates tickets based on results.

## Output

- Script log







