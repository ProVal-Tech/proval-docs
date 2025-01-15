---
id: 'c5a8578c-c085-438c-acd9-303596067b96'
title: 'Internet Speed Audit Solution'
title_meta: 'Internet Speed Audit Solution - Network Speed Monitoring'
keywords: ['internet', 'speed', 'audit', 'monitoring', 'network']
description: 'This document details the implementation of an internet speed audit solution that measures network speed during script execution. It includes associated scripts, tables, dataviews, and monitors for effective speed testing and reporting.'
tags: ['audit', 'monitor', 'network', 'script', 'dataview', 'alert', 'role']
draft: false
unlisted: false
---
## Purpose

The internet speed audit solution performs the network speed that the machine is getting during script execution.

## Associated Content

| Content                                                                                          | Type     | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|----------|--------------------------------------------------------------------------------------------------------------------|
| [Script - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226)                | Script   | This is the Automate implementation script that stores/modifies the data from the agnostic script into the table custom |
| [plugin_proval_speedtest_audit](https://proval.itglue.com/DOC-5078775-9166228)                 | Table    | This table stores the data from the script                                                                         |
| [Dataview - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166225)             | Dataview | This dataview populates the complete information of the speed test                                                |
| [Dataview - Internet Latest Speed - Audit](https://proval.itglue.com/DOC-5078775-13170954)     | Dataview | This dataview populates the last script execution report of the speed test                                        |
| [Test-InternetSpeed](https://proval.itglue.com/DOC-5078775-9099825)                            | Agnostic | This agnostic script performs the complete speed test audit                                                        |
| [Internal Monitor - Execute Script - Internet Speed Test](https://proval.itglue.com/DOC-5078775-13170161) | Monitor  | This internal monitor detects the Windows agent where the script [EPM - Network - Script - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226) was not run for the last 10 days. |
| △ CUSTOM - Execute Script - Internet Speed Audit                                                 | Alert Template | Refer to this alert template for the schedule with monitor in client environment                                   |
| [Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872)                      | Role     | This role is required for the monitor to function. If you do not plan to use the monitor to deploy the script, then it is not required. |

## Implementation

1. Import the Alert Template △ CUSTOM - Execute Script - Internet Speed Audit.  
2. Import one or both dataviews [Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166225) / [Internet Latest Speed - Audit](https://proval.itglue.com/DOC-5078775-13170954).  
3. Import the role: [Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872)  
4. Import the internal monitor [Internet Speed Test](https://proval.itglue.com/DOC-5078775-13170161).  
5. Import the script [Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226) + run it once on any machine with the set environment variable set to 1  
6. Assign the monitor to whatever groups you would like audited. (Ex. Managed Servers 24x7)  
7. Assign the Alert Template to the Monitor and validate there are results showing  
8. Run the monitor to begin the auditing.






