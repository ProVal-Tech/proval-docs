---
id: 'cwa-checks-current-automate-license-availability'
title: 'Checks Current Automate License Availability'
title_meta: 'Checks Current Automate License Availability'
keywords: ['automate', 'license', 'monitor', 'alert', 'tickets']
description: 'This document provides an overview of how to check the current availability of Automate licenses, including suggested monitor failure thresholds and alert templates for ticket generation. It also outlines important considerations for on-prem and hosted partners regarding ticket generation.'
tags: ['monitoring', 'alert', 'ticket', 'clientid', 'usage']
draft: false
unlisted: false
---
## Summary

Checks current Automate license availability. Suggested monitor failure is 90% usage.  
The suggested alert template is Default Create Automate Ticket.

## Important Notes

For the on-prem partners, tickets will be generated for the Automate server.  
For the hosted partners, it will be the minimum computerid of Clientid 1. If Clientid 1 is not the primary client for a hosted partner then the clientid should be updated in the Additional Field:  
![Image](../../../static/img/Over-90%-Licenses-Used-G/image_1.png)

## Target

The suggested target for the monitor.  
Global - Should be run without explicitly defined targets.



