---
id: '5ae52dd7-e476-49dd-823f-582cbf6de17e'
title: 'SVC-CWAFileService'
title_meta: 'SVC-CWAFileService'
keywords: ['monitor', 'service', 'automate', 'ticket', 'status']
description: 'This document outlines the CWAFileService monitor for the Automate server, detailing its purpose to check the service status and create urgent tickets in Autotask if the service is down, specifically for on-prem partners.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

CWAFileService is one of the important services for the Automate server. This monitor checks the service status and is intended to create an urgent ticket in our (ProVal's) Autotask portal if it is down. It should be created against the "Labtech Server" group for on-prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server.  
**Suggested Alert Style**: Once.  
**Suggested Alert Template**: △ Custom - Autofix - Restart Service - Automate Server Monitoring  

| Check Action | Server Address | Check Type    | Check Value     | Comparator | Interval | Result |
|--------------|----------------|---------------|------------------|------------|----------|--------|
| System       | 127.0.0.1     | Service Check | CWAFileservice   | Equals     | 600      | 1      |

## Target

Service Plans. Windows servers. Server Roles. MSP Specific Servers. Labtech Server

