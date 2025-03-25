---
id: 'd2168fe5-e9f2-4265-ad4d-ce98ee14cf26'
slug: /d2168fe5-e9f2-4265-ad4d-ce98ee14cf26
title: 'iDRAC Version - Dell Servers'
title_meta: 'iDRAC Version - Dell Servers'
keywords: ['idrac', 'dell', 'servers', 'version', 'rmm']
description: 'This document provides an overview of the iDRAC version on Dell servers. It includes instructions for scheduling the data view script to run daily on the Dell Servers group to collect relevant data, along with details on the columns displayed in the dataview.'
tags: ['database', 'dell', 'report']
draft: false
unlisted: false
---

## Summary

This dataview shows the version of iDRAC on Dell servers. The script [Get iDRAC Version - Dell Servers [DV]](<../scripts/Get iDRAC Version - Dell Servers DV.md>) should be scheduled to run daily on the "Dell Servers" group to gather the corresponding data.

## Dependencies

[Get iDRAC Version - Dell Servers [DV]](<../scripts/Get iDRAC Version - Dell Servers DV.md>)

## Columns

| Column            | Description                                                 |
|-------------------|-------------------------------------------------------------|
| Client Name       | Shows the name of the client for the concerned server.     |
| Location Name     | Shows the name of the location for the concerned server.   |
| Computer Name     | Shows the name of the concerned server.                     |
| Manufacturer      | Shows the manufacturer of the concerned server.            |
| Operating System   | Shows the OS of the concerned server.                      |
| iDRAC Version     | Shows the iDRAC version of the concerned server.           |
| Last Contact      | Shows the last contact of the concerned server with RMM.   |


