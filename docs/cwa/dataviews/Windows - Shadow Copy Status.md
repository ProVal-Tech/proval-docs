---
id: '0f2ae395-2139-418c-bb21-8dd87dde20fc'
title: 'Shadow Copy Status Report'
title_meta: 'Shadow Copy Status Report'
keywords: ['shadowcopy', 'report', 'client', 'location', 'computer']
description: 'This document provides a detailed report on the status of Shadow Copy for various machines, indicating which machines have Shadow Copy enabled. It pulls data from the custom table "plugin_proval_shadowcopystats" and includes client names, location names, and computer names for clarity.'
tags: ['report']
draft: false
unlisted: false
---

## Summary

This report pulls data from the custom table "plugin_proval_shadowcopystats" and adds the client name, location name, and computer name to present the data clearly. It indicates which machines have Shadow Copy enabled.

## Dependencies

- @ShadowCopy (script)
- @plugin_proval_shadowcopy (custom table)

## Columns

| Column                  | Description                                               |
|------------------------|-----------------------------------------------------------|
| Client                 | Client Name                                              |
| Location               | Location Name                                            |
| Computer               | Computer Name                                            |
| Shadow Copy Enabled     | Enabled/Disabled status of Shadow Copy on the machine    |
