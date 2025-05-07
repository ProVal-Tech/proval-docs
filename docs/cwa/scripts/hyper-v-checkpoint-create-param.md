---
id: 'e089e210-d2c5-498a-8c92-496c572ca705'
slug: /e089e210-d2c5-498a-8c92-496c572ca705
title: 'Hyper-V - Checkpoint Create Param'
title_meta: 'Hyper-V - Checkpoint Create Param'
keywords: ['checkpoint', 'hyper-v', 'virtual-machine', 'script', 'automation']
description: 'This document provides a script for creating a checkpoint of a virtual machine hosted on a Hyper-V Host Server. It includes details on intended targets, variable descriptions, user parameters, and sample runs to help users effectively utilize the script.'
tags: ['backup', 'hyper-v', 'virtualization', 'windows']
draft: false
unlisted: false
---

## Summary

The script can be used to create a checkpoint of a virtual machine hosted on a Hyper-V Host Server.

**Intended Target:** Hyper-V Host Server

**Checkpoint Name:** `Checkpoint_$(Get-Date -Format 'yyyyMMdd_HHmmss')`  
**Example:** Checkpoint_20230407_063842

## Sample Run

![Sample Run](../../../static/img/docs/e089e210-d2c5-498a-8c92-496c572ca705/image_1.png)

## Variables

| Name             | Description                                           |
|------------------|-------------------------------------------------------|
| ProjectName      | HyperV_Checkpoint                                    |
| WorkingDirectory  | C:/ProgramData/_automation/script/HyperV_Checkpoint  |
| ShellResult      | Output of the PowerShell script creating the checkpoint |

### User Parameters

| Name   | Example   | Required | Description                                          |
|--------|-----------|----------|------------------------------------------------------|
| VMName | Test-VM   | True     | Name of the virtual machine for which to create the checkpoint |

## Output

- Script logs

