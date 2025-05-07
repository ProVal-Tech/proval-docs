---
id: 'c5a8578c-c085-438c-acd9-303596067b96'
slug: /c5a8578c-c085-438c-acd9-303596067b96
title: 'Internet Speed - Audit'
title_meta: 'Internet Speed - Audit'
keywords: ['internet', 'speed', 'audit', 'monitoring', 'network']
description: 'This document details the implementation of an internet speed audit solution that measures network speed during script execution. It includes associated scripts, tables, dataviews, and monitors for effective speed testing and reporting.'
tags: []
draft: false
unlisted: false
---

## Purpose

The internet speed audit solution measures the network speed that the machine is receiving during script execution.

## Associated Content

| Content                                                                                          | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6)                | Script        | This is the Automate implementation script that stores/modifies the data from the agnostic script into the custom table. |
| [plugin_proval_speedtest_audit](/docs/38fbe617-1c50-443b-b69b-07eae7135652)             | Table         | This table stores the data from the script                                                                         |
| [Dataview - Internet Speed - Audit](/docs/706c1dcb-998c-4d1e-a046-ab7538429aa7)             | Dataview      | This dataview populates the complete information of the speed test                                                |
| [Dataview - Internet Latest Speed - Audit](/docs/9cd465c4-1fed-40fb-8ac2-0b170c9c50b4) | Dataview      | This dataview populates the last script execution report of the speed test                                        |
| [Test-InternetSpeed](/docs/12946fed-d74f-4977-b59d-85d5c639b56b)                                   | Agnostic      | This agnostic script performs the complete speed test audit                                                        |
| [Internal Monitor - Execute Script - Internet Speed Test](/docs/863ba816-8f4f-47e1-aa66-420b428b7188) | Monitor       | This internal monitor detects the Windows agent where the script [EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6) was not run for the last 10 days. |
| △ CUSTOM - Execute Script - Internet Speed Audit                                                 | Alert Template | Refer to this alert template for the schedule with the monitor in the client environment                          |
| [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81)                           | Role          | This role is required for the monitor to function. If you do not plan to use the monitor to deploy the script, then it is not required. |

## Implementation

1. Import the Alert Template △ CUSTOM - Execute Script - Internet Speed Audit.  
2. Import one or both dataviews: [Internet Speed - Audit](/docs/706c1dcb-998c-4d1e-a046-ab7538429aa7) / [Internet Latest Speed - Audit](/docs/9cd465c4-1fed-40fb-8ac2-0b170c9c50b4).  
3. Import the role: [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81).  
4. Import the internal monitor [Internet Speed Test](/docs/863ba816-8f4f-47e1-aa66-420b428b7188).  
5. Import the script [Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6) and run it once on any machine with the environment variable set to 1.  
6. Assign the monitor to whatever groups you would like audited (e.g., Managed Servers 24x7).  
7. Assign the Alert Template to the Monitor and validate that there are results showing.  
8. Run the monitor to begin the auditing.

