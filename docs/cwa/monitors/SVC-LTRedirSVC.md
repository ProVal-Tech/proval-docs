---
id: 'cwa-ltredirsrv-monitoring'
title: 'LTRedirSVC Monitoring for Automate Server'
title_meta: 'LTRedirSVC Monitoring for Automate Server'
keywords: ['automate', 'monitoring', 'service', 'alert', 'ticket']
description: 'This document outlines the monitoring setup for the LTRedirSVC service on the Automate server, including alert configurations and service check details to ensure timely notifications and ticket creation in Autotask.'
tags: ['alert', 'service', 'monitoring', 'ticket', 'configuration']
draft: false
unlisted: false
---
## Summary

LTRedirSVC is one of the important services for the Automate server. This monitor is intended to alert on the status of that service and creates an urgent ticket in our (ProVal's) Autotask portal if the status becomes failed. 

It should be created against the "Labtech Server" group for the on-prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server.

**Suggested Alert Style**: Once.

**Suggested Alert Template**: △ Custom - Autofix - Restart Service - Automate Server Monitoring

| Check Action | Server Address | Check Type     | Check Value | Comparator | Interval | Result |
|--------------|----------------|----------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Service Check  | LTRedirSVC  | Equals     | 60       | 1      |

## Target

Service [Plans.Windows](http://plans.Windows) servers.Server Roles.MSP Specific Servers.Labtech Server



