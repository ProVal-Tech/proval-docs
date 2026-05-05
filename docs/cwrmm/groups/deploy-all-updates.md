---
id: 'f5a97ff3-ac6c-4d50-a826-5fcfa40cb341'
slug: /f5a97ff3-ac6c-4d50-a826-5fcfa40cb341
title: 'Deploy All Updates'
title_meta: 'Deploy All Updates'
keywords: ['vendor-specific','windows','patching','updates','application','installation','software','dell','lenovo','hp','drivers','bios','firmware']
description: 'This includes Windows workstations that have been opted into the “Unified System Update Orchestrator” solution.'
tags: ['windows','patching','application','installation','software','dell','lenovo','hp','drivers','bios','firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-29
---

## Summary
This includes Windows workstations that have been opted into the [Unified System Update Orchestrator](/docs/84a1de4d-0f17-407a-8c98-7ffc76e1d150) solution.

## Dependencies

- [Solution - Unified System Update Orchestrator](/docs/84a1de4d-0f17-407a-8c98-7ffc76e1d150)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

**Group Name:** `Deploy All Updates`  
**Description:** `This includes Windows workstations that have been opted into the “Unified System Update Orchestrator” solution.`

![Image](../../../static/img/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341/image1.webp)

## Group Criteria

The group is defined by the following **criteria** joined by `AND` condition.

| Criteria Name   | Operator   | Value(s)   |
|------------|--------|-----------|
| Available   | Equal  | `True` |
| OS Type  | Equal   | `Windows` |
| OS Product | Does Not Contain any of   | `Server` |
| Enable Unified Update Manager | Equal  | `True` |
| Disable All Updates (Site) | Equal   | `False` |
| Disable All Updates (Endpoint) | Equal   | `False` |

## Completed Group

![Image](../../../static/img/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341/image2.webp)


## Changelog

### 2026-04-29

- Initial version of the document