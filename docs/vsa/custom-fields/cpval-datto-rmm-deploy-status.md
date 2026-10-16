---
id: '96ff33e8-e893-421a-981c-5af9fa6a798e'
slug: /96ff33e8-e893-421a-981c-5af9fa6a798e
title: 'cPVALDattoRmmDeployStatus'
title_meta: 'cPVALDattoRmmDeployStatus'
keywords: ['vsa', 'kaseya', 'datto-rmm', 'migration', 'agent-deployment', 'agent-procedure', 'custom-fields', 'centrastage']
description: 'VSA 9 custom field that records the result of the latest Datto RMM agent install attempt on each agent. Use it to track migration progress in VSA 9.'
tags: ['automation', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Summary

Records the result of the latest Datto RMM agent install attempt on each VSA 9 agent. Use it to see which devices are done and which need attention, directly in VSA 9.

The [Sync Datto RMM Sites [VSA 9 Migration]](/docs/4ba42f91-1ffb-4e9c-b704-2238bb02beb6) agent procedure creates this field. The [Install Datto RMM Agent [VSA 9 Migration]](/docs/7a1f0dda-b650-40c1-bedb-277ccd373b10) agent procedure fills it in.

| Value | Meaning |
| ----- | ------- |
| `Completed - Datto RMM agent installed` | The agent was installed and detected. |
| `Completed - Datto RMM agent already present` | The agent was already installed. Nothing changed. |
| `Failed - Datto RMM agent not detected after install` | The installer ran, but the agent was not detected afterwards. |
| `Failed - cPVALDattoRmmSiteUid is empty` | The device has no Datto RMM site. Run the Sync Datto RMM Sites [VSA 9 Migration] agent procedure first. |
| `Failed - cPVALDattoRmmAgentUrl is empty` | The device has no download address. Check the Datto RMM API URL and run the Sync Datto RMM Sites [VSA 9 Migration] agent procedure again. |
| *(empty)* | The install procedure has not run on this device yet. |

:::note  
Every value starts with `Completed` or `Failed`. Filter on `*Completed*` or `*Failed*` to build VSA 9 views that track progress.  
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
| `cPVALDattoRmmDeployStatus` | Machine | String. Result of the latest Datto RMM agent install attempt, for example `Completed - Datto RMM agent installed`. Written by the Install Datto RMM Agent [VSA 9 Migration] agent procedure. |

## Changelog

### 2026-10-16

- Initial version of the document.
