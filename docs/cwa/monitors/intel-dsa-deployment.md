---
id: 'eff35c87-7793-4eae-bd7b-23daf13267b6'
slug: /eff35c87-7793-4eae-bd7b-23daf13267b6
title: 'Intel DSA Deployment'
title_meta: 'Intel DSA Deployment'
keywords: ['intel', 'driver', 'assistant', 'support', 'installation']
description: 'This detects the online Windows Workstations that have an Intel Processor, and the deployment EDF is selected at the client level, and the `Intel® Driver & Support Assistant` is not installed'
tags: ['drivers']
draft: false
unlisted: false
last_update:
  date: 2026-02-25
---

## Summary

This detects the online Windows Workstations that have an Intel Processor, the deployment EDF is selected at the client level, and the `Intel® Driver & Support Assistant` is not installed.

## Dependencies

- `Alert Template - △ Custom - Execute Script - Intel DSA Install`
- [Script - Intel DSA Install](/docs/956ab7bd-320c-49b9-be27-1783976994d2)
- [Intel® Driver & Support Assistant Solution](/docs/26bda8e8-6bca-46c3-894f-3eb838340982)


## Target

- Windows Workstations with Intel Processor

## Implementation

- Import the monitor
- Import the [Script - Intel DSA Install](/docs/956ab7bd-320c-49b9-be27-1783976994d2)
- Import the alert template - `△ Custom - Execute Script - Intel DSA Install`
- Apply the alert template - `△ Custom - Execute Script - Intel DSA Install` to the monitor
- Right click the monitor and then click `Run now and Reset`
  ![Sample Run 1](../../../static/img/docs/fb522a1e-8ebd-43fd-9f18-f47bfd63f6df/image3.webp)

## Changelog

### 2026-02-24

- Initial version of the document
