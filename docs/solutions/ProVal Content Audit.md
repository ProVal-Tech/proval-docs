---
id: '54ca5ad4-d580-4056-92f0-fc3896ac5438'
title: 'ProVal Audit Solution for Syncing Scripts and Monitors'
title_meta: 'ProVal Audit Solution for Syncing Scripts and Monitors'
keywords: ['audit', 'sync', 'scripts', 'monitors', 'dataview']
description: 'This document outlines a solution for auditing scripts, internal monitors, and dataviews to ensure they are in sync with the ProSync Plugin. It provides guidance for consultants to assist partners in syncing or removing unnecessary content and highlights available resources.'
tags: []
draft: false
unlisted: false
---

## Purpose

This solution provides a way to audit the scripts, internal monitors, and dataviews to determine if they are in sync with our ProSync Plugin. If any items on these lists are found to be unused or not synced in the plugin, the consultant can work with the end partner to either sync them up or remove anything that is not needed. This process also gives the consultant an opportunity to remind partners of the content available for their use.

## Associated Content

| Content                                                                                      | Type     | Function                                                                                                                                                                                                 |
|----------------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Dataview - ProVal Script Audit](<../cwa/dataviews/ProVal Script Audit.md>) | Dataview | Lists all the scripts located in the 'proval', 'Proval - client specific', and 'Proval - development' folders. It depicts their sync status with the ProSync plugin and helps identify if a script is being used in the environment. |
| [CWM - Automate - Dataview - ProVal Internal Monitor Audit](<../cwa/dataviews/ProVal Internal Monitor Audit.md>) | Dataview | Lists all the internal monitors that contain 'proval' or 'custom' in their names. It depicts their sync status with the ProSync plugin and details the last scan, fail count, and the group IDs to which the monitor is applied.                       |
| [CWM - Automate - Dataview - ProVal Dataview Audit](<../cwa/dataviews/ProVal Dataview Audit.md>) | Dataview | Lists all the dataviews located in the 'proval' folder and depicts their sync status with the ProSync plugin.                                                                                               |

## Implementation

Import the [CWM - Automate - Dataview - ProVal Internal Monitor Audit](<../cwa/dataviews/ProVal Internal Monitor Audit.md>), [CWM - Automate - Dataview - ProVal Dataview Audit](<../cwa/dataviews/ProVal Dataview Audit.md>), and [CWM - Automate - Dataview - ProVal Script Audit](<../cwa/dataviews/ProVal Script Audit.md>) dataviews into the client's environment. No additional setup is required.

