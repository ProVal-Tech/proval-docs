---
id: 'cwa-idle-monitor-solution'
title: 'Idle Monitor Solution for End User Activity Tracking'
title_meta: 'Idle Monitor Solution for End User Activity Tracking'
keywords: ['idle', 'monitor', 'enduser', 'tracking', 'utilization']
description: 'This document outlines the Idle Monitor solution designed to track end user activity by monitoring computer idle times and usage. It includes implementation steps, associated content, and best practices for effective monitoring.'
tags: ['configuration', 'software', 'report', 'performance', 'windows']
draft: false
unlisted: false
---
## Purpose

The solution's purpose is to keep tabs on end users to determine how long they leave their computers idle and if they are actually utilising them.

## Associated Content

| Content                                                                                         | Type         | Function                                      |
|-------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------|
| [CWM - Automate - Script - IdleMon Report [Globals]](https://proval.itglue.com/DOC-5078775-12869569) | Script       | Collects the data/samples from the machine    |
| [CWM - Automate - Custom Table - pvl_report_idlemon](https://proval.itglue.com/DOC-5078775-12869570) | Custom Table | Stores the samples collected by the script     |
| [CWM - Automate - Dataview - IdleMon Report](https://proval.itglue.com/DOC-5078775-12869574) | Dataview    | Displays the data gathered by the script       |

## Implementation

- Place the [IdleMon](https://proval.itglue.com/DOC-5078775-12641582) tool in the `Utilities` folder at `LTShare\Transfer` on Automate Server/WebDav.
- Import the script.
- Import the dataview.
- Schedule the script to run periodically against the concerned machines. It is suggested not to schedule the script against a bunch of computers as it needs to be executed frequently for proper output.
- Ask the user to log off of their computer or wait for them to log off after the first execution of the script. The script/tool cannot collect data/samples unless the logged-in user re-logins after the installation of the tool.

