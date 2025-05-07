---
id: 'cb1ab987-657f-4503-a3e1-f4f6345b6fdf'
slug: /cb1ab987-657f-4503-a3e1-f4f6345b6fdf
title: 'SMB1 Autofix'
title_meta: 'SMB1 Autofix'
keywords: ['smb1', 'monitor', 'autofix', 'windows', 'agents']
description: 'This document details an internal monitor that detects online Windows agents and performs autofix on computers with the "Audit with Autofix" setting for the SMB1 Vulnerability. It highlights dependencies, target scope, and ticketing setup for effective management.'
tags: ['ticketing', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor detects online Windows agents and performs autofix on computers where the "Audit with Autofix" is set via client, location, or computer-level EDF "SMB1 Vulnerability." The [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d) shows failure, and the autofix [Script - SMBv1 Status Audit/Autofix [DV, Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) has not run in the past week.

## Dependencies

- [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)
- [Script - SMBv1 Status Audit/Autofix [DV, Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b)

## Target

Global

## Ticketing

**_To enable ticketing, please set the ticket category in the monitor as shown below:_**

![Ticket Category Setup](../../../static/img/docs/cb1ab987-657f-4503-a3e1-f4f6345b6fdf/image_1.png)

Once the ticket category is set, the autofix [Script - SMBv1 Status Audit/Autofix [DV, Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) will automatically create a ticket to the service board using the ticket category set.