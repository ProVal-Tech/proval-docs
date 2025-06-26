---
id: '3641dd0d-82d8-4137-b987-0b6c0d8238da'
slug: /3641dd0d-82d8-4137-b987-0b6c0d8238da
title: 'Set Time Zone - Windows Servers'
title_meta: 'Set Time Zone - Windows Servers'
keywords: ['time', 'time-zone', 'windows']
description: 'This document outlines the steps for implementing the time zone management solution to manage time zone on Windows machines from Ninja One.'
tags: ['timezone', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution is designed to manage the members in the local admin group for Windows machines.

## Associated Content

### Custom Field

| Content | Definition Scope | Required | Type | Available Options | Applicable OS | Function |
| ------- | ---------------- | -------- | ---- | ----------------- | ------------- | -------- |
| [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) | `Organization`, `Location`, `Device` | True | Drop-down | `Windows`, `Windows Workstations`, `Windows Servers`, `Disabled` | `Windows` | Select the operating system to enable the time zone management solution for the client. Set this field to `Disable` at the location or device level to exclude it. |
| [cPVAL Time Zone To Set](/docs/23bc744a-aef7-40dd-bfc6-058138a4d302) | `Organization`, `Location`, `Device` | True | Text | | `Windows` | Enter the Windows time zone ID to set (e.g., 'Pacific Standard Time'). If not specified or set to 'Default', the script will attempt to detect the time zone automatically based on the device's public IP address. |

### Automation

| Content | Function |
| ------- | -------- |
| [Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) | Gets or sets the Windows time zone using a NinjaOne custom field or runtime variables, with automatic detection and IANA-to-Windows mapping if 'Default' is specified. |

### Conditions

| Content | Function |
| ------- | -------- |
| [Set Time Zone - Windows Workstations](/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1) | Runs the [Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) automation one per day on windows workstations where the [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) custom field is enabled. |
| [Set Time Zone - Windows Servers](/docs/9d3b6624-5e4a-48cb-babb-f355fcd1f6d9) | Runs the [Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) automation one per day on Windows Servers where the [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) custom field is enabled. |

## Implementation

### Step 1

Create the following custom fields:

- [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03)
- [cPVAL Time Zone To Set](/docs/23bc744a-aef7-40dd-bfc6-058138a4d302)

### Step 2

Create the [Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) automation.

### Step 3

Create the [Set Time Zone - Windows Workstations](/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1) compound condition for default `Windows Workstation [Default]` agent policy.  
![DefaultWindowsWorkstation](../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.webp)

### Step 4

Create the [Set Time Zone - Windows Servers](/docs/9d3b6624-5e4a-48cb-babb-f355fcd1f6d9) compound condition for default `Windows Server [Default]` agent policy.  
![DefaultWindowsServer](../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsservers.webp)

## FAQ

### What does the "Manage Time Zone" solution do?

The "Manage Time Zone" solution allows you to centrally manage and set the time zone on Windows machines using NinjaOne automation, custom fields, and conditions.

### How does the automation determine which machines to target?

The automation runs on machines where the [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) custom field is enabled. You can set this field at the organization, location, or device level.

### What happens if the "Time Zone To Set" field is left blank or set to "Default"?

If the [cPVAL Time Zone To Set](/docs/23bc744a-aef7-40dd-bfc6-058138a4d302) field is blank or set to `Default`, the script will attempt to detect the appropriate time zone automatically based on the device's public IP address.

### Can I run the script manually on a single agent?

Yes, you can execute the script manually against a single agent. Refer to the sample screenshots in the [script's document](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) for guidance on running the script and using Runtime Input variables.

### What are Runtime Input variables and how are they used?

Runtime Input variables allow you to provide values to the script at execution time, enabling dynamic configuration without modifying the script itself. Sample screenshots in the [script's document](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) show how to use these variables.

### Can I exclude certain devices from the time zone management solution?

Yes, set the [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) custom field to `Disabled` at the location or device level to exclude those devices from the automation.
