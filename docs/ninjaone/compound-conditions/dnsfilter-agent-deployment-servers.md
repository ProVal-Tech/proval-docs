---
id: '580e01e0-5216-4421-b1c0-c0b27a1819e4'
slug: /580e01e0-5216-4421-b1c0-c0b27a1819e4
title: 'DNSFilter Agent Deployment - Servers'
title_meta: 'DNSFilter Agent Deployment - Servers'
keywords: ['DNS', 'Filter', 'Agent']
description: 'Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](</docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows Servers where deployment is enabled.'
tags: ['installation', 'dns']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

## Summary

Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](</docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows Servers where deployment is enabled.

## Details

- **Name:** `DNSFilter Agent Deployment - Servers`
- **Description:** `Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](</docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows Servers where deployment is enabled.`
- **Recommended Agent Policies:** `Windows Servers`

## Dependencies

* [Automation - Install DNSFilter Agent And Certificate - Windows](</docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3)
* [Custom Field - cPVAL DNSFilter Deployment](</docs/1030e639-e615-4618-ae49-9db20ee907da) 
* [Solution - DNSFilter Deployment](</docs/1c257867-5a6f-4887-a383-7c5af4cf1c98)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/dnsfilter-agent-deployment-servers.toml)

## Changelog

### 2026-10-22

- Initial version of the document