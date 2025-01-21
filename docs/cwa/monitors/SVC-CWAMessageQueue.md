---
id: 'a1fb4b3c-b08f-4090-9df7-66e7d80ca93d'
title: 'SVC-CWAMessageQueue'
title_meta: 'SVC-CWAMessageQueue'
keywords: ['cwa', 'monitoring', 'service', 'alert', 'ticket']
description: 'This document outlines the monitoring setup for the CWAMessageQueue service in ConnectWise Automate. It details the alert configuration, suggested parameters, and target server roles to ensure timely notifications and ticket creation in Autotask when the service becomes unavailable.'
tags: []
draft: false
unlisted: false
---

## Summary

CWAMessageQueue is one of the important services for the Automate server. This monitor is intended to alert on the status of that service and create an urgent ticket in our (ProVal's) Autotask portal in the event that the service becomes unavailable. It should be created against the "Labtech Server" group for the on-prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server.  
**Suggested Alert Style**: Once.  
**Suggested Alert Template**: △ Custom - Autofix - Restart Service - Automate Server Monitoring  

| Check Action | Server Address | Check Type    | Check Value       | Comparator | Interval | Result |
|--------------|----------------|---------------|--------------------|------------|----------|--------|
| System       | 127.0.0.1     | Service Check | CWAMessageQueue    | Equals     | 60       | 1      |

## Target

Service [Plans.Windows](http://plans.Windows) servers. Server Roles. MSP Specific Servers. Labtech Server  



