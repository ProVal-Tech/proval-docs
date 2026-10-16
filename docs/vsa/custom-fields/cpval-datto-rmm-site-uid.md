---
id: 'bfb2c75f-75e2-44a1-90eb-eb0740e23aab'
slug: /bfb2c75f-75e2-44a1-90eb-eb0740e23aab
title: 'cPVALDattoRmmSiteUid'
title_meta: 'cPVALDattoRmmSiteUid'
keywords: ['vsa', 'kaseya', 'datto-rmm', 'migration', 'agent-deployment', 'agent-procedure', 'custom-fields', 'centrastage']
description: 'VSA 9 custom field that stores the UID of the Datto RMM site an agent moves to. Used to install the Datto RMM agent into the correct site.'
tags: ['automation', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Summary

Stores the UID of the Datto RMM site that a VSA 9 agent moves to. The [Install Datto RMM Agent [VSA 9 Migration]](/docs/7a1f0dda-b650-40c1-bedb-277ccd373b10) agent procedure uses it to install the Datto RMM agent into that site.

The [Sync Datto RMM Sites [VSA 9 Migration]](/docs/4ba42f91-1ffb-4e9c-b704-2238bb02beb6) agent procedure creates this field and fills it in for every agent. No manual entry is needed.

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
| `cPVALDattoRmmSiteUid` | Machine | String. UID of the Datto RMM site for this agent, for example `5b0e4f8a-2c1d-4e6b-9a7f-3d2c1b0a9e8f`. Written by the Sync Datto RMM Sites [VSA 9 Migration] agent procedure. Read by the Install Datto RMM Agent [VSA 9 Migration] agent procedure. Empty when the agent has no matching Datto RMM site. |

## Changelog

### 2026-10-16

- Initial version of the document.
