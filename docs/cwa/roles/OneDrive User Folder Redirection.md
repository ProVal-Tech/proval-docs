---
id: 'cwa-onedrive-user-folder-redirection'
title: 'OneDrive User Folder Redirection Detection'
title_meta: 'OneDrive User Folder Redirection Detection'
keywords: ['onedrive', 'redirection', 'detection', 'user', 'folder']
description: 'This document outlines the detection of machines with OneDrive User Folder redirection enabled, detailing the relevant settings and detection strings used to identify this configuration.'
tags: ['windows', 'configuration', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This role is detected on machines on which OneDrive User Folder redirection is enabled.

## Settings

| Detection String                          | Comparator | Result | Applicable OS |
|-------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SOFTWARE/Policies/Microsoft/OneDrive:KFMSilentOptIn-%}` | Exists     |        | Windows        |




