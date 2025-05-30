---
id: 'f73d6546-470e-448b-b3db-d7b57d3d8df4'
slug: /f73d6546-470e-448b-b3db-d7b57d3d8df4
title: 'SVC-CWAIISMgr'
title_meta: 'SVC-CWAIISMgr'
keywords: ['monitor', 'service', 'automate', 'ticket', 'labtech', 'server']
description: 'This document outlines the CWAIISMgr service monitor for the Automate server, detailing its purpose, configuration, and alert settings to ensure timely ticket creation in the Autotask portal when the service is down.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

CWAIISMgr is one of the important services for the Automate server. This monitor checks the service status and is intended to create an urgent ticket in our (ProVal's) Autotask portal if it is down. It should be created against the "Labtech Server" group for the on-prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server.  
**Suggested Alert Style**: Once.  
**Suggested Alert Template**: △ Custom - Autofix - Restart Service - Automate Server Monitoring  

| Check Action | Server Address | Check Type    | Check Value | Comparator | Interval | Result |
|--------------|----------------|---------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Service Check | CWAIISMgr   | Equals     | 60       | 1      |

## Target

Service Plans. Windows servers. Server Roles. MSP Specific Servers. Labtech Server.