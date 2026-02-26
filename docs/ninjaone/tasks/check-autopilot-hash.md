---
id: '9a07b71d-98ae-4352-ae78-b568ab72b052'
slug: /9a07b71d-98ae-4352-ae78-b568ab72b052
title: 'Check Autopilot Hash'
title_meta: 'Check Autopilot Hash'
keywords: ['autopilot','custom-fields','auditing']
description: 'This task is used to run the script to update the Autopilot hash under the Custom Filed.'
tags: ['autopilot','custom-fields','auditing']
draft: true
unlisted: false
---

## Summary

This task is used to run the script to update the Autopilot hash under the Custom Filed [Custom Field - cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a).

## Dependencies

- [Custom Field - cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a)
- [Group - cPVAL Autopilot Hash - Not Updated](/docs/40f1253f-42d4-49ac-adad-26b940cd11b8)
- [Automation - Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5)
- [Solution - Get - AutoPilot Hash - NinjaOne](/docs/d5b749b5-eda4-43d2-8679-eb88f51a3527)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Check AutoPilot Hash | This task is used to run the script to update the Autopilot hash under the Custom Filed. | True | Daily | 1 day(s) | 02/26/2026 8:00 AM | Never | [Group - cPVAL Autopilot Hash - Not Updated](/docs/40f1253f-42d4-49ac-adad-26b940cd11b8) | [Automation - Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5) |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/check-autopilot-hash.toml)