---
id: 'b3d41d1c-e687-4e39-811a-83d6fb99c14d'
title: 'Over 90 Percent Licenses Used G'
title_meta: 'Over 90 Percent Licenses Used G'
keywords: ['automate', 'license', 'monitor', 'alert', 'tickets']
description: 'This document provides an overview of how to check the current availability of Automate licenses, including suggested monitor failure thresholds and alert templates for ticket generation. It also outlines important considerations for on-prem and hosted partners regarding ticket generation.'
tags: ['usage']
draft: false
unlisted: false
---

## Summary

This document checks the current Automate license availability. The suggested monitor failure threshold is 90% usage.  
The recommended alert template is "Default Create Automate Ticket."

## Important Notes

For on-prem partners, tickets will be generated for the Automate server.  
For hosted partners, it will be the minimum computer ID of Client ID 1. If Client ID 1 is not the primary client for a hosted partner, then the Client ID should be updated in the Additional Field:  
![Image](../../../static/img/Over-90-Licenses-Used-G/image_1.png)

## Target

The suggested target for the monitor is as follows:  
Global - Should be run without explicitly defined targets.



