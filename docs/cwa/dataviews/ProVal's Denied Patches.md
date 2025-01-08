---
id: 'cwa-denied-patches-dataview'
title: 'Denied Patches Dataview'
title_meta: 'Denied Patches Dataview'
keywords: ['dataview', 'patches', 'itglue', 'denied', 'policy']
description: 'This document provides a detailed overview of the Denied Patches Dataview, which populates information about denied patches after executing the Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset script. It includes dependencies and a description of the columns used in the dataview.'
tags: ['itglue', 'denied', 'patches', 'database', 'report']
draft: false
unlisted: false
---
## Summary

This Dataview populates information about the [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) after running the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script.

## Dependencies

- [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142)  
- [plugin_proval_denied_patches](https://proval.itglue.com/DOC-5078775-9563176)

## Columns

| Column | Description                       |
|--------|-----------------------------------|
| KBID   | KBID of the Denied Patch.        |
| Title  | Title of the denied patch.       |
| Reason | Reason behind denying the patch.  |

