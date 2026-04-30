---
id: '6b7226dd-fab8-47f6-be79-72d6936e3875'
slug: /6b7226dd-fab8-47f6-be79-72d6936e3875
title: 'HP Image Assistant Scan'
title_meta: 'HP Image Assistant Scan'
keywords: ['hp', 'hpia', 'hp-image-assistant', 'image-assistant', 'drivers', 'firmware', 'driver-updates', 'bios']
description: 'This monitor executes the HP Image Assistant - Install + Command Handler [DV,Param,Autofix] script once per day against HP workstations.'
tags: ['hp', 'firmware', 'bios', 'drivers']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

This monitor executes the [HP Image Assistant - Install + Command Handler [DV,Param,Autofix]](/docs/8d551cc4-c4db-465a-a0df-2649e0eef711) script once per day against HP workstations.

## Dependencies

- [Script: HP Image Assistant - Install + Command Handler [DV,Param,Autofix]](/docs/8d551cc4-c4db-465a-a0df-2649e0eef711)
- [Custom Table: pvl_hpimageassistant_audit](/docs/d41f1905-bc6a-412f-9de9-88010c502010)
- [Solution: HP Image Assistant Handler](/docs/ddf20590-a18c-43f2-9e14-4ce2606187bc)

## Target

Global

## Alert Template

- `△ Custom - Execute Script - HP Image Assistant Scan`

## Changelog

### 2026-04-30

- Initial version of the document
