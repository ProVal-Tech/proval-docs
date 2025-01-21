---
id: 'b412647a-447b-4fd3-a179-87885cdd06f5'
title: 'OneDrive User Folder Redirection'
title_meta: 'OneDrive User Folder Redirection'
keywords: ['onedrive', 'redirection', 'detection', 'user', 'folder']
description: 'This document outlines the detection of machines with OneDrive User Folder redirection enabled, detailing the relevant settings and detection strings used to identify this configuration.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the detection of machines on which OneDrive User Folder redirection is enabled.

## Settings

| Detection String                                               | Comparator | Result | Applicable OS |
|--------------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SOFTWARE/Policies/Microsoft/OneDrive:KFMSilentOptIn-%}` | Exists     |        | Windows        |



