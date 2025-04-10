---
id: 'b1695ddc-ae81-4cd0-8622-c036d75fc7ad'
slug: /b1695ddc-ae81-4cd0-8622-c036d75fc7ad
title: 'VMWare ESXi Monitoring Solution'
title_meta: 'VMWare ESXi Monitoring Solution'
keywords: ['esxi', 'monitoring', 'alerts', 'datastores', 'communication']
description: 'This document outlines a solution for customizable monitoring of ESXi servers, detailing associated internal monitors and scripts for alert management. It provides step-by-step implementation guidance to enhance server monitoring capabilities.'
tags: ['esxi']
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to provide effective and customizable monitoring for ESXi servers, which was previously not possible through the plugin.

## Associated Content

| Content                                                                                     | Type            | Function                                         |
|---------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------|
| [CWA Internal Monitor - ProVal - Production - ESXi Bad Sensor](/docs/2f8424d7-00aa-4cee-a4fb-56cbc412108b)         | Internal Monitor | Alerts based on warnings/alerts on ESXi hosts   |
| [CWA Internal Monitor - ESXi Host Not Communicating > 3 Days](/docs/905bda70-64aa-4e66-a18f-c5d0eef2b7fd)         | Internal Monitor | Alerts when ESXi hosts are not communicating     |
| [CWA Internal Monitor - ESXi Storage Space < 10%](/docs/9b1477b3-6d88-4a1c-b313-50c638bb84ee)                     | Internal Monitor | Alerts when datastores are running low on space. |
| [CWM - Automate - Script - Ticket Creation - ESXi Bad Sensor](/docs/26780ede-b390-4f16-9d5a-de876ab180ee)         | Script          | Used for alert templates for the above monitors. |
| [CWM - Automate - Script - Ticket Creation - ESXi Not Communicating](/docs/7e7eb565-3b99-4e6f-89f8-6257f5b4e7d6) | Script          | Used for alert templates for the above monitors. |
| [CWM - Automate - Script - Ticket Creation - ESXi Storage < 10%](/docs/61158e8d-5349-418a-9cd8-81685d622846)     | Script          | Used for alert templates for the above monitors. |

## Implementation

1. Import 'ProVal - Production - ESXi Bad Sensor'.
2. Import 'ProVal - Production - ESXi Host Not Communicating > 3 Days'.
3. Import 'ProVal - Production - ESXi Storage Space < 10%'.
4. Import the ticket creation scripts outlined above.
5. Assign the ticket creation scripts as alert templates for each monitor (these should be importable via the plugin).
6. Enable the monitors.


