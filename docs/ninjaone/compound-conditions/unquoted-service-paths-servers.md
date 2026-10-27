---
id: '2d18a56f-bbec-46ef-84c7-229643a76c4b'
slug: /2d18a56f-bbec-46ef-84c7-229643a76c4b
title: 'Unquoted Service Paths - Servers'
title_meta: 'Unquoted Service Paths - Servers'
keywords: ['unquoted-service-path','services','vulnerability','server']
description: 'Runs Unquoted Service Paths - Detection on Windows servers covered by cPVAL Unquoted Service Path Mode, and Unquoted Service Paths - Autofix when the detection script finds services to fix.'
tags: ['security','vulnerability','windows','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Summary

Runs [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d) every 12 hours on Windows servers where [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) is `Audit All`, `Audit Servers Only`, `Autofix All`, `Autofix Servers Only`, `Autofix Workstations and Audit Servers` or `Autofix Servers and Audit Workstations`. The detection script records the server's unquoted service paths in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196). When the option fixes servers and a service is found, the script exits with 1 and writes `Detected:`, and the compound condition runs [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30).

Servers include domain controllers.

The condition resets 6 hours after it triggers, so the next check picks up new services and services the autofix could not fix.

## Details

- **Name:** `Unquoted Service Paths - Servers`
- **Description:** `Runs Unquoted Service Paths - Detection on Windows servers where cPVAL Unquoted Service Path Mode is Audit All, Audit Servers Only, Autofix All, Autofix Servers Only, Autofix Workstations and Audit Servers or Autofix Servers and Audit Workstations, and Unquoted Service Paths - Autofix when the detection script finds services to fix.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field - cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387)
- [Automation - Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d)
- [Automation - Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30)
- [Solution - Unquoted Service Paths - NinjaOne](/docs/463a9e42-df91-406d-b53c-285f4cbdabac)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/unquoted-service-paths-servers.toml)

## Changelog

### 2026-10-27

- Initial version of the document
