---
id: 'cwa-shadow-copy-status'
title: 'Shadow Copy Status Report'
title_meta: 'Shadow Copy Status Report'
keywords: ['shadowcopy', 'report', 'client', 'location', 'computer']
description: 'This document provides a detailed report on the status of Shadow Copy for various machines, indicating which machines have Shadow Copy enabled. It pulls data from the custom table "plugin_proval_shadowcopystats" and includes client names, location names, and computer names for clarity.'
tags: ['report', 'client', 'location', 'computer', 'shadowcopy', 'status']
draft: false
unlisted: false
---
## Summary

This picks the data from the custom table "plugin_proval_shadowcopystats" and adds the client name, location name, computer name to show data properly. This indicates which machines have Shadow Copy enabled.

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


