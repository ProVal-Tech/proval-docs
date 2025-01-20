---
id: 'b1695ddc-ae81-4cd0-8622-c036d75fc7ad'
title: 'Customizable Monitoring for ESXi Servers'
title_meta: 'Customizable Monitoring for ESXi Servers'
keywords: ['esxi', 'monitoring', 'alerts', 'datastores', 'communication']
description: 'This document outlines a solution for customizable monitoring of ESXi servers, detailing associated internal monitors and scripts for alert management. It provides step-by-step implementation guidance to enhance server monitoring capabilities.'
tags: ['esxi']
draft: false
unlisted: false
---
## Purpose

The goal of this solution is to provide very good and customizable monitoring for ESXi servers, which is previously not possible through the plugin.

## Associated Content

| Content                                                                                     | Type            | Function                                         |
|---------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------|
| [CWA Internal Monitor - ProVal - Production - ESXi Bad Sensor](<../cwa/monitors/ESXi Bad Sensor.md>)         | Internal Monitor | Alerts based on Warnings/Alerts on ESXi Hosts   |
| [CWA Internal Monitor - ESXi Host Not Communicating > 3 Days](<../cwa/monitors/ESXi Host Not Communicating  3 Days.md>)         | Internal Monitor | Alerts when ESXi hosts are not communicating     |
| [CWA Internal Monitor - ESXi Storage Space \< 10%](<../cwa/monitors/ESXi Storage Space  10.md>)                     | Internal Monitor | Alerts when Datastores are running low on space.|
| [CWM - Automate - Script - Ticket Creation - ESXi Bad Sensor](<../cwa/scripts/Ticket Creation - ESXi Bad Sensor.md>)         | Script          | Used for Alert Templates for the above monitors. |
| [CWM - Automate - Script - Ticket Creation - ESXi Not Communicating](<../cwa/scripts/Ticket Creation - ESXi Not Communicating.md>) | Script          | Used for Alert Templates for the above monitors. |
| [CWM - Automate - Script - Ticket Creation - ESXi Storage \< 10%](https://proval.itglue.com/DOC-5078775-10094519)     | Script          | Used for Alert Templates for the above monitors. |

## Implementation

1. Import 'ProVal - Production - ESXi Bad Sensor'
2. Import 'ProVal - Production - ESXi Host Not Communicating > 3 Days'
3. Import 'ProVal - Production - ESXi Storage Space \< 10%'
4. Import the Ticket Creation Scripts outlined above
5. Assign the Ticket Creation Scripts as Alert Templates for each monitor (These should be importable via the Plugin)
6. Enable the monitors












