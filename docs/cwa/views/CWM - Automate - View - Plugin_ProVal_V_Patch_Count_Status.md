---
id: 'cwa-client-level-patch-breakdown'
title: 'Client-Level Breakdown of Machines Missing Patches'
title_meta: 'Client-Level Breakdown of Machines Missing Patches'
keywords: ['patches', 'client', 'machines', 'breakdown', 'count', 'status']
description: 'This document provides a detailed view of the client-level breakdown of machines that are missing a specific number of patches, along with sample data and dependencies for better understanding.'
tags: ['database', 'report', 'status', 'configuration']
draft: false
unlisted: false
---
## Purpose

This view provides a client-level breakdown of machines missing a certain number of patches.

Sample data:  
![Sample Data](5078775/docs/11867749/images/16625682)

## Dependencies

[CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](https://proval.itglue.com/DOC-5078775-11867748)

## Tables

#### plugin_proval_v_patch_count_status

| Column        | Type       | Explanation                                                                                   |
|---------------|------------|-----------------------------------------------------------------------------------------------|
| clientid     | int(11)   | Clientid                                                                                      |
| os            | varchar(11) | Operating System (Workstation | Server)                                                      |
| category      | varchar(18) | Category Name (Full | 1-2 Missing | 3-4 Missing | 5+ Missing | Missing Patch Info)       |
| Machine Count | int(5)    | Number of machines falling under the concerned category for the client.                      |

