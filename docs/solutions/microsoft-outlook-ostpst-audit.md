---
id: 'cefde8db-a69d-4d25-a5b2-dda08f468fb4'
slug: /cefde8db-a69d-4d25-a5b2-dda08f468fb4
title: 'Microsoft Outlook - OSTPST Audit'
title_meta: 'Microsoft Outlook - OSTPST Audit'
keywords: ['microsoft', 'outlook', 'ost', 'pst', 'audit', 'dataview', 'monitor']
description: 'This document outlines a solution for retrieving file path and size details of OST and PST files from Windows Workstations, and displaying this data in an Automate dataview. It helps identify unusually large OST or PST files, enhancing data management and monitoring capabilities.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This solution is designed to retrieve the file path and size details of OST and PST files from all Windows Workstations and display the data in an Automate dataview. This can be used to spot abnormally large OST or PST files.

## Associated Content

#### Data Collection

| Content                                                                 | Type          | Function               |
|-------------------------------------------------------------------------|---------------|------------------------|
| [Script - Microsoft Outlook - OST/PST - Audit](/docs/2029ecbe-c5f8-431e-9643-7aed63bec6d8)   | Script        | Fetch the data.        |
| [Dataview - Microsoft Outlook - OST/PST Audit](/docs/30279ec0-cbb0-40f5-95ea-fb8052cb093a)   | Dataview      | Display the data.      |
| [Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](/docs/d801eb05-05a3-4271-aa8c-a8ea4941f4eb) | Internal Monitor | Detects the machines.  |
| △ Custom - Execute Script - Microsoft Outlook - OST/PST - Audit       | Alert Template | Executes the script.   |

#### Other

| Content                                                                 | Type          | Function                       |
|-------------------------------------------------------------------------|---------------|--------------------------------|
| [Custom Table - pvl_outlook_pst_ost_audit](/docs/bea56cbb-3761-452a-9493-08a88bc6dbab) | Custom Table  | Stores data gathered by the script. |

## Implementation

1. Import the following content from the `ProSync` plugin:
   - [Script - Microsoft Outlook - OST/PST - Audit](/docs/2029ecbe-c5f8-431e-9643-7aed63bec6d8)
   - [Dataview - Microsoft Outlook - OST/PST Audit](/docs/30279ec0-cbb0-40f5-95ea-fb8052cb093a)
   - [Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](/docs/d801eb05-05a3-4271-aa8c-a8ea4941f4eb)
   - Alert Template - `△ Custom - Execute Script - Microsoft Outlook - OST/PST - Audit`

2. Reload System Cache:  
   ![Reload System Cache](../../static/img/docs/cefde8db-a69d-4d25-a5b2-dda08f468fb4/image_1.png)

3. Configure the solution as follows:
   - [Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](/docs/d801eb05-05a3-4271-aa8c-a8ea4941f4eb)
   - Configure with the alert template: `△ Custom - Execute Script - Microsoft Outlook - OST/PST - Audit`
   - Right-click and Run Now to start the monitor.


