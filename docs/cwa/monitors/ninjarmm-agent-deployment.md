---
id: '015605a7-a2b3-49c6-b773-2ebbdbbbc7ed'
slug: /015605a7-a2b3-49c6-b773-2ebbdbbbc7ed
title: 'NinjaRMM Agent Deployment Monitor'
title_meta: 'NinjaRMM Agent Deployment Monitor'
keywords: ['ninjarmm','rmm','agent']
description: 'This monitor is designed to set the automatic deployment of the NinjaRMMAgent where the Ninja Deployment is enabled.'
tags: ['application','installation']
draft: false
unlisted: false
last_update:
  date: 2025-05-23
---

## Summary

This monitor is designed to set the automatic deployment of the NinjaRMMAgent where the Ninja Deployment is enabled.

## Dependencies
`Alert Template:` △ Custom - Execute Script - NinjaRMMAgent Deployment   
[Script - NinjaRMM Deployment - [Windows, Mac, Linux]](/docs/372559cc-5af7-4075-a442-ef7909712fea)  
[Solution - NinjaRMM Agent Deployment ](/docs/c42dc847-beeb-4064-80de-3ce936a2ead7)  
## Target

Global

## Implementation

To enable ticketing please set the `Ticket Category` in the monitor:

![alerting tab](../../../static/img/docs/ninjarmm-agent-deployment/image.png)

The ticket creation will be then handled by the Autofix script.

## Changelog

### 2025-05-21

- Initial version of the document
