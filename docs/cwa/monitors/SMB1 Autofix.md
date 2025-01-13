---
id: 'rmm-smb1-vulnerability-monitor'
title: 'SMB1 Vulnerability Monitor'
title_meta: 'SMB1 Vulnerability Monitor'
keywords: ['smb1', 'monitor', 'autofix', 'windows', 'agents']
description: 'This document details an internal monitor that detects online Windows agents and performs autofix on computers with the "Audit with Autofix" setting for the SMB1 Vulnerability. It highlights dependencies, target scope, and ticketing setup for effective management.'
tags: ['monitor', 'autofix', 'windows', 'ticketing', 'vulnerability']
draft: false
unlisted: false
---
## Summary

This internal monitor detects online Windows agents and performs autofix on computers where the "Audit with Autofix" is set via client, location, or computer level EDF "SMB1 Vulnerability". The [Remote Monitor - SMB1 Detection](https://proval.itglue.com/DOC-5078775-17241874) shows failure, and the autofix [Script - SMBv1 Status Audit/Autofix [DV, Param]](https://proval.itglue.com/DOC-5078775-15811522) has not run in the past week.

## Dependencies

- [Remote Monitor - SMB1 Detection](https://proval.itglue.com/DOC-5078775-17241874)
- [Script - SMBv1 Status Audit/Autofix [DV, Param]](https://proval.itglue.com/DOC-5078775-15811522)

## Target

Global

## Ticketing

**_To enable ticketing, please set the ticket category in the monitor as shown below:_**

![Ticket Category Setup](../../../static/img/SMB1-Autofix/image_1.png)

Once the ticket category is set, the Autofix [Script - SMBv1 Status Audit/Autofix [DV, Param]](https://proval.itglue.com/DOC-5078775-15811522) will automatically create a ticket to the service board using the ticket category set.



