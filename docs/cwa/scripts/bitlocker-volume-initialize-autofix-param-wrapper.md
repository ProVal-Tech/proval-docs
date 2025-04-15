---
id: '85513764-8240-40fb-be86-7be910ea62cf'
slug: /85513764-8240-40fb-be86-7be910ea62cf
title: 'Bitlocker - Volume - Initialize Autofix,Param - Wrapper'
title_meta: 'Bitlocker - Volume - Initialize Autofix,Param - Wrapper'
keywords: ['bitlocker', 'encryption', 'deployment', 'monitor', 'script']
description: 'This document provides details on a script designed for the automatic deployment of BitLocker initialization to agents detected by the Internal Monitor for BitLocker. It includes sample runs, dependencies, user parameters, and output details.'
tags: ['deployment', 'encryption']
draft: false
unlisted: false
---

## Summary

This script runs as an autofix to deploy the BitLocker initialization to the agents detected by the monitor [Internal Monitor - BitLocker - Initialize Volume Deployment](/docs/925adfc5-e119-4c56-937a-a31c3e171371).

## Sample Run

Run it with `SetEnvironment = 1` to set the EDFs required for this script once after importing it.

![Sample Run](../../../static/img/Bitlocker---Volume---Initialize-Autofix,Param---Wrapper/image_1.png)

## Dependencies

- [Internal Monitor - BitLocker - Initialize Volume Deployment](/docs/925adfc5-e119-4c56-937a-a31c3e171371)
- [SEC - Encryption - Script - BitLocker - Volume - Initialize](/docs/759a5a88-17ef-42e0-9145-4760aff7a3c9)
- [SEC - Encryption - Script - BitLocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a)

#### EDFs

| Name                                              | Level     | Type     | Editable | Description                                                                                                                                                                                                                                                                                                                                         |
|---------------------------------------------------|-----------|----------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| BitLocker Encryption Automation - Enable [Wks]    | Location  | Dropdown | Yes      | This location EDF provides two options: AllDrives - Select this to enable the initialization of BitLocker to all NTFS, internal, and non-missing drives. SystemDrive - Select this to enable the initialization of BitLocker to the (C:) volume.                                                                                             |
| BitLocker Enable Exclude                           | Computer  | Flag     | Yes      | This computer EDF, if checked, will exclude the agent from the BitLocker auto-initialization.                                                                                                                                                                                                                                                       |

#### User Parameters

| Name            | Example | Required | Description                                                                                                                                                                     |
|-----------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SetEnvironment   | 1 or 0 | False    | Executing the script for the first time with SetEnvironment = 1 is mandatory to set the EDFs in the partner environment.                                                     |

## Script State

| Variable Name                     | Value    | Required | Description                                                                                                                                                                                                                     |
|-----------------------------------|----------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| BitLocker_Enable_Fail_Count       | 1 or 2  | True     | The script records the count of failed attempts of the BitLocker initialization in this script state. If it fails twice (2) times, the computer will be excluded from the monitor [Internal Monitor - BitLocker - Initialize Volume Deployment](/docs/925adfc5-e119-4c56-937a-a31c3e171371). |

## Output

- Script log
- Dataview



