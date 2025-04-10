---
id: 'd06a0253-328e-4a80-860f-b1b5055b9dda'
slug: /d06a0253-328e-4a80-860f-b1b5055b9dda
title: 'Repair - CW Control Client'
title_meta: 'Repair - CW Control Client'
keywords: ['connectwise', 'automate', 'offline', 'repair', 'agent', 'monitor', 'script']
description: 'This document outlines a solution for identifying offline computers in the ConnectWise Automate application that are online or missing from the ConnectWise Control application, and details the process for installing or repairing the Automate Agent on those machines.'
tags: ['connectwise', 'installation']
draft: false
unlisted: false
---

## Purpose

This solution, built for the ConnectWise platform, aims to identify all offline computers in the ConnectWise Automate application that are online or missing from the ConnectWise Control application, and subsequently install or repair the Automate Agent on those machines. To achieve this, a ConnectWise Automate script called [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status*](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) is used, which fetches the online status of all machines from CW Control on a periodic basis.

Following this, the solution uses a ConnectWise Automate internal monitor named [CWM - Control - Monitor - Agent - CW Control Needs Repair](/docs/b06ee4ed-7da2-41cd-88f0-e9ddba25e6f7) to detect the offline machines that are online in Automate but not in Control, based on the results of the EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status* script. This monitor is then assigned a ConnectWise Automate alert template named △ CUSTOM - Autofix Action - Repair CW Control, which is configured to run the autofix script named [CWM - Control - Script - CW Control - Repair [RMM+, Autofix, Globals]](/docs/43225bbe-98a0-4352-8fb2-79e7431dea10) on the machines identified by the internal monitor.

The ConnectWise Automate autofix script, CWM - Control - Script - CW Control - Repair [RMM+, Autofix, Globals], attempts to repair the issue with the installed CW Control instance and can generate a ticket if the fix fails. By using this solution, all offline machines can be identified, and the connectivity issues with the CW Control instance can be resolved effectively.

## Associated Content

| Content                                                                                          | Type            | Function                                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status*](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) | Script          | The script EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status* fetches the online status of all machines in ConnectWise Control and inserts those states into a custom table for the solution to identify offline computers. |
| [CWM - Control - Monitor - Agent - CW Control Needs Repair](/docs/b06ee4ed-7da2-41cd-88f0-e9ddba25e6f7) | Internal Monitor | The monitor set detects machines that are offline according to the [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status*](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) script result but are online in Automate. |
| △ CUSTOM - Autofix Action - Repair CW Control                                                   | Alert Template   | To run the autofix script on the machines detected by the internal monitor.                                                                                             |
| [CWM - Control - Script - CW Control - Repair [RMM+, Autofix, Globals]](/docs/43225bbe-98a0-4352-8fb2-79e7431dea10) | Autofix Script   | This script attempts to repair the problem with the installed CW Control instance and can create a ticket on failures.                                                      |

## Implementation

- Import [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status*](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) script.
- Execute the script against any machine to create [EPM - Data Collection - Custom Table - plugin_proval_control_session_status](/docs/d468b194-6df4-46b0-8dbc-657b623209ff) table.
- Import the [CWM - Control - Monitor - Agent - CW Control Needs Repair](/docs/b06ee4ed-7da2-41cd-88f0-e9ddba25e6f7) monitor set.
- Import [CWM - Control - Script - CW Control - Repair [RMM+, Autofix, Globals]](/docs/43225bbe-98a0-4352-8fb2-79e7431dea10) script.
- Import/create the `△ CUSTOM - Autofix Action - Repair CW Control` alert template.
- Schedule the [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status*](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) script to run twice per day. It is suggested to use the Labtech Server group for on-prem partners and the Domain Controller of the primary client for hosted partners.  
  ![Schedule](../../static/img/Repair---CW-Control-Client/image_1.png)  
- Update the run time of the [CWM - Control - Monitor - Agent - CW Control Needs Repair](/docs/b06ee4ed-7da2-41cd-88f0-e9ddba25e6f7) monitor set to run 20-30 minutes after the scheduled script run.  
  ![Update Run Time](../../static/img/Repair---CW-Control-Client/image_2.png)  


