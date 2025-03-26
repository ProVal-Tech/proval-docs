---
id: '4f7c1abe-2d4b-4ad3-81a7-48e3111015ac'
slug: /4f7c1abe-2d4b-4ad3-81a7-48e3111015ac
title: "ProVal's Denied Patches"
title_meta: "ProVal's Denied Patches"
keywords: ['dataview', 'patches', 'itglue', 'denied', 'policy']
description: 'This document provides a detailed overview of the Denied Patches Dataview, which populates information about denied patches after executing the Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset script. It includes dependencies and a description of the columns used in the dataview.'
tags: ['database', 'report']
draft: false
unlisted: false
---

## Summary

This Dataview populates information about the [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) after running the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script.

## Dependencies

- [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142)  
- [plugin_proval_denied_patches](/docs/9ee3657f-dff8-4599-a4c3-68ca3ba171f4)

## Columns

| Column | Description                       |
|--------|-----------------------------------|
| KBID   | KBID of the Denied Patch.        |
| Title  | Title of the denied patch.       |
| Reason | Reason behind denying the patch.  |


