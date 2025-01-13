---
id: 'cwa-proval-audit'
title: 'ProVal Audit Solution for Syncing Scripts and Monitors'
title_meta: 'ProVal Audit Solution for Syncing Scripts and Monitors'
keywords: ['audit', 'sync', 'scripts', 'monitors', 'dataview']
description: 'This document outlines a solution for auditing scripts, internal monitors, and dataviews to ensure they are in sync with the ProSync Plugin. It provides guidance for consultants to assist partners in syncing or removing unnecessary content and highlights available resources.'
tags: ['audit', 'consultant', 'prosync', 'dataview', 'monitor', 'script']
draft: false
unlisted: false
---
## Purpose

This solution provides a way to audit the scripts, internal monitors, and dataviews if they are in sync with our ProSync Plugin. If anything on these lists ends up not being in use or that isn't synced in the plugin, the consultant can work with the end partner to sync up or remove anything they don't need. This will also give the consultant an opportunity to remind partners of content that we have and that they can use.

## Associated Content

| Content                                                                                      | Type     | Function                                                                                                                                                                                                 |
|----------------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Dataview - ProVal Script Audit](https://proval.itglue.com/DOC-5078775-12097784) | Dataview | Lists all the scripts which are in 'proval', 'Proval - client specific', 'Proval - development' folder. It depicts their sync status with ProSync plugin. Along with that, it helps to identify if script is being used in the environment or not. |
| [CWM - Automate - Dataview - ProVal Internal Monitor Audit](https://proval.itglue.com/DOC-5078775-12097997) | Dataview | Lists all the internal monitors which contain 'proval' or 'custom' in their names. It depicts their sync status with ProSync plugin. It also details the last scan, fail count, and the groups id it is applied for the monitor.                       |
| [CWM - Automate - Dataview - ProVal Dataview Audit](https://proval.itglue.com/DOC-5078775-12097873) | Dataview | Lists all the dataviews which are in 'proval' folder. It depicts their sync status with ProSync plugin.                                                                                               |

## Implementation

Import the [CWM - Automate - Dataview - ProVal Internal Monitor Audit](https://proval.itglue.com/DOC-5078775-12097997), [CWM - Automate - Dataview - ProVal Dataview Audit](https://proval.itglue.com/DOC-5078775-12097873), and [CWM - Automate - Dataview - ProVal Script Audit](https://proval.itglue.com/DOC-5078775-12097784) dataviews to clients' environment. No additional setup required.



