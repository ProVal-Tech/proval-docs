---
id: '35bce608-7df7-4cc3-bd10-8037198f5025'
title: 'Cluster Server Patching Script'
title_meta: 'Cluster Server Patching Script for Automate'
keywords: ['ticket', 'update', 'cluster', 'patching', 'cumulative', 'automation']
description: 'This client script creates a ticket for all cluster hosts with a Cumulative Update older than 60 days, facilitating manual patching for servers where Automate is not recommended for patching clusters.'
tags: ['cluster', 'patching', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

This client script will create a ticket for all the cluster hosts where the currently installed Cumulative Update shows older than 60 days in the [Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>).

## Sample Run

![Sample Run](../../../static/img/Cluster-Server-Patch-Audit-Ticket/image_1.png)

## Dependencies

[Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)

## Output

- Ticket
- Script log

## Ticketing

**Subject:**  
UPDATES - Cluster Server Patching for @ServerCount@ Servers at @sqlname@

**Body:**  
There are @ServerCount@ server(s) at @sqlname@ that are in need of manual patching, since Automate is not recommended to patch clusters. Please manually patch the machine(s) listed below:

%sqlresult%

Thank You!












