---
id: '35bce608-7df7-4cc3-bd10-8037198f5025'
slug: /35bce608-7df7-4cc3-bd10-8037198f5025
title: 'Cluster Server Patch Audit Ticket'
title_meta: 'Cluster Server Patch Audit Ticket'
keywords: ['ticket', 'update', 'cluster', 'patching', 'cumulative', 'automation']
description: 'This client script creates a ticket for all cluster hosts with a Cumulative Update older than 60 days, facilitating manual patching for servers where Automate is not recommended for patching clusters.'
tags: ['cluster', 'patching', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This client script creates a ticket for all the cluster hosts where the currently installed Cumulative Update is older than 60 days, as indicated in the [Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a).

## Sample Run

![Sample Run](../../../static/img/docs/35bce608-7df7-4cc3-bd10-8037198f5025/image_1.png)

## Dependencies

[Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)

## Output

- Ticket
- Script log

## Ticketing

**Subject:**  
UPDATES - Cluster Server Patching for @ServerCount@ Servers at @sqlname@

**Body:**  
There are @ServerCount@ server(s) at @sqlname@ that are in need of manual patching, as Automate is not recommended for patching clusters. Please manually patch the machine(s) listed below:

%sqlresult%

Thank you!

