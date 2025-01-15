---
id: 'eb53c8e9-ec2f-4efe-a36c-eeb3f8487981'
title: 'Client-Level Ticket Creation Script'
title_meta: 'Client-Level Ticket Creation Script for ConnectWise Automate'
keywords: ['ticket', 'client', 'creation', 'alert', 'monitor']
description: 'This document details a script that replicates the CWM - Automate - Script - Ticket Creation - Computer, focusing on generating client-level tickets instead of computer-level tickets. It emphasizes the importance of incorporating the Clientid in the SQL query for effective alerting and monitoring.'
tags: ['alert', 'client', 'monitor', 'ticket', 'setup']
draft: false
unlisted: false
---
## Summary

This script is a replication of the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script, with the key distinction being that it generates client-level tickets instead of computer-level tickets.

It is imperative to incorporate the `Clientid` in the SQL query of a RAWSQL monitor set when utilizing this script for alerting in conjunction with the monitor set. This ensures that the script functions correctly and aligns with the monitoring and alerting requirements.

## Alert Template

`△ Custom - Ticket Creation - Client`

## Output

- Script Log
- Client-level Ticket






