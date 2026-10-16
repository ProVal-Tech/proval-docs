---
id: '2fe9acfb-f1ef-4a4e-9d91-5725fb271da6'
slug: /2fe9acfb-f1ef-4a4e-9d91-5725fb271da6
title: 'cPVALDattoRmmAgentUrl'
title_meta: 'cPVALDattoRmmAgentUrl'
keywords: ['vsa', 'kaseya', 'datto-rmm', 'migration', 'agent-deployment', 'agent-procedure', 'custom-fields', 'centrastage']
description: 'VSA 9 custom field that stores the address the Datto RMM agent installer is downloaded from during a VSA 9 to Datto RMM migration.'
tags: ['automation', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Summary

Stores the base address that the Datto RMM agent installer is downloaded from. The [Install Datto RMM Agent [VSA 9 Migration]](/docs/7a1f0dda-b650-40c1-bedb-277ccd373b10) agent procedure adds the platform and the site UID to this address to download the right installer.

The [Sync Datto RMM Sites [VSA 9 Migration]](/docs/4ba42f91-1ffb-4e9c-b704-2238bb02beb6) agent procedure creates this field and fills it in for every agent. The address is built from the Datto RMM API URL entered when that procedure runs.

:::warning  
The field stays empty when the Datto RMM API URL does not have the form `https://servername-api.centrastage.net`. Agents with an empty field cannot install the Datto RMM agent. Enter the API URL exactly as shown on your Datto RMM user record, then run the Sync Datto RMM Sites [VSA 9 Migration] agent procedure again.  
:::

:::note  
If the field is missing, run the Sync Datto RMM Sites [VSA 9 Migration] agent procedure again; it creates the field. To create it manually, go to `Audit` > `View Individual Data` > `Machine Summary`, select **New Custom Field**, and enter the name exactly as shown below with the type `String`.  
:::

## Dependencies

- [Solution: VSA 9 to Datto RMM Migration](/docs/38446fc5-ce0a-4319-9471-ce7e327d8a8d)
- [Agent Procedure: Sync Datto RMM Sites [VSA 9 Migration]](/docs/4ba42f91-1ffb-4e9c-b704-2238bb02beb6)
- [Agent Procedure: Install Datto RMM Agent [VSA 9 Migration]](/docs/7a1f0dda-b650-40c1-bedb-277ccd373b10)

## Details

| Field Name | Type of Field (Machine or Organization) | Description |
| ---------- | --------------------------------------- | ----------- |
| `cPVALDattoRmmAgentUrl` | Machine | String. Base download address for the Datto RMM agent, for example `https://merlot.rmm.datto.com/download-agent/`. Written by the Sync Datto RMM Sites [VSA 9 Migration] agent procedure. Read by the Install Datto RMM Agent [VSA 9 Migration] agent procedure. |

## Changelog

### 2026-10-16

- Initial version of the document.
