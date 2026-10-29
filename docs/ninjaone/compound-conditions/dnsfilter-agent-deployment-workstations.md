---
id: '9a2990eb-1abf-479e-8dc5-4724ded26eb2'
slug: /9a2990eb-1abf-479e-8dc5-4724ded26eb2
title: 'DNSFilter Agent Deployment - Workstations'
title_meta: 'DNSFilter Agent Deployment - Workstations'
keywords: ['DNS', 'Filter', 'Agent']
description: 'Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows workstations where deployment is enabled.'
tags: ['installation', 'dns']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Summary

Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows workstations where deployment is enabled.

## Details

- **Name:** `DNSFilter Agent Deployment - Workstations`
- **Description:** `Triggers the "Install DNSFilter Agent And Certificate - Windows" automation on Windows workstations where deployment is enabled.`
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

* [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3)
* [Custom Field - cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da) 
* [Solution - DNSFilter Deployment](/docs/1c257867-5a6f-4887-a383-7c5af4cf1c98)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/dnsfilter-agent-deployment-workstations.toml)

## Changelog

### 2026-10-29

- Initial version of the document