---
id: 'cwa-hyperv-checkpoint'
title: 'Create a Checkpoint for a Hyper-V Virtual Machine'
title_meta: 'Create a Checkpoint for a Hyper-V Virtual Machine'
keywords: ['checkpoint', 'hyper-v', 'virtual-machine', 'script', 'automation']
description: 'This document provides a script for creating a checkpoint of a virtual machine hosted on a Hyper-V Host Server. It includes details on intended targets, variable descriptions, user parameters, and sample runs to help users effectively utilize the script.'
tags: ['hyper-v', 'virtualization', 'windows', 'backup', 'configuration']
draft: false
unlisted: false
---
## Summary

The script can be used to create a checkpoint of a virtual machine hosted on a Hyper-V Host Server.

**Intended Target:** Hyper-V Host Server

**Checkpoint Name:** `"Checkpoint_$(Get-Date -Format 'yyyyMMdd_HHmmss')"`  
**Example:**  Checkpoint_20230407_063842

## Sample Run

![Sample Run](..\..\..\static\img\Hyper-V---Checkpoint-Create-Param\image_1.png)

## Variables

| Name             | Description                                           |
|------------------|-------------------------------------------------------|
| ProjectName      | HyperV_Checkpoint                                    |
| WorkingDirectory  | C:\ProgramData\_automation\script\HyperV_Checkpoint  |
| ShellResult      | Output of the PowerShell script creating the CheckPoint |

#### User Parameters

| Name   | Example   | Required | Description                                          |
|--------|-----------|----------|------------------------------------------------------|
| VMName | Test-VM   | True     | Name of the virtual machine to create the checkpoint for |

## Output

- Script logs



