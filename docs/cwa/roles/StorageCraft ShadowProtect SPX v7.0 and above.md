---
id: '8157d6e9-cac2-4def-a4f5-6ae6be897713'
title: 'ShadowProtect SPX Version Check'
title_meta: 'ShadowProtect SPX Version Check'
keywords: ['shadowprotect', 'backup', 'version', 'management', 'endpoint']
description: 'This document outlines a role that checks if the primary build number for ShadowProtect SPX is version 7. It provides details on how this data can be utilized for effective backup management based on the software version present on an endpoint.'
tags: ['backup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This role will determine if the primary build number for ShadowProtect SPX is version 7. This data is used to help coordinate backup management based on the version of the software on an endpoint. This information is viewable in the role definitions screen of the computer management window.

## Settings

| Detection String                                         | Comparator    | Result | Applicable OS |
|---------------------------------------------------------|---------------|--------|----------------|
| `{%-HKLM/SOFTWARE/StorageCraft Technology Corporation/spx:InstalledVersion-%}` | Regex Match   | ^7/..  | Windows OS     |

