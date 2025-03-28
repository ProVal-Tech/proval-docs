---
id: '855f03ce-5b2e-42d5-9798-7460a0b379f6'
title: 'IdleMon Report'
title_meta: 'IdleMon Report'
keywords: ['idle', 'monitor', 'enduser', 'tracking', 'utilization']
description: 'This document outlines the Idle Monitor solution designed to track end user activity by monitoring computer idle times and usage. It includes implementation steps, associated content, and best practices for effective monitoring.'
tags: ['performance', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to monitor end users to determine how long they leave their computers idle and whether they are actually utilizing them.

## Associated Content

| Content                                                                                         | Type         | Function                                      |
|-------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------|
| [CWM - Automate - Script - IdleMon Report [Globals]](<../cwa/scripts/IdleMon Report Globals.md>) | Script       | Collects the data/samples from the machine    |
| [CWM - Automate - Custom Table - pvl_report_idlemon](<../cwa/tables/pvl_report_idlemon.md>) | Custom Table | Stores the samples collected by the script     |
| [CWM - Automate - Dataview - IdleMon Report](https://proval.itglue.com/DOC-5078775-12869574) | Dataview     | Displays the data gathered by the script       |

## Implementation

- Place the [IdleMon](https://proval.itglue.com/DOC-5078775-12641582) tool in the `Utilities` folder at `LTShare/Transfer` on the Automate Server/WebDav.
- Import the script.
- Import the dataview.
- Schedule the script to run periodically against the relevant machines. It is recommended not to schedule the script against a large number of computers simultaneously, as it needs to be executed frequently for optimal output.
- Ask the user to log off their computer or wait for them to log off after the first execution of the script. The script/tool cannot collect data/samples unless the logged-in user re-logs in after the installation of the tool.



