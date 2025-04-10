---
id: 'eb53c8e9-ec2f-4efe-a36c-eeb3f8487981'
slug: /eb53c8e9-ec2f-4efe-a36c-eeb3f8487981
title: 'CWM - Automate - Ticket Creation - Client'
title_meta: 'CWM - Automate - Ticket Creation - Client'
keywords: ['ticket', 'client', 'creation', 'alert', 'monitor']
description: 'This document details a script that replicates the CWM - Automate - Script - Ticket Creation - Computer, focusing on generating client-level tickets instead of computer-level tickets. It emphasizes the importance of incorporating the Client ID in the SQL query for effective alerting and monitoring.'
tags: ['setup']
draft: false
unlisted: false
---

## Summary

This script replicates the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script, with the key distinction being that it generates client-level tickets instead of computer-level tickets.

It is imperative to incorporate the `Client ID` in the SQL query of a RAWSQL monitor set when utilizing this script for alerting in conjunction with the monitor set. This ensures that the script functions correctly and aligns with the monitoring and alerting requirements.

## Alert Template

`△ Custom - Ticket Creation - Client`

## Output

- Script Log
- Client-level Ticket


