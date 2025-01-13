---
id: 'cwa-mimikatz-vulnerability-tracking'
title: 'Mimikatz Vulnerability Tracking'
title_meta: 'Mimikatz Vulnerability Tracking'
keywords: ['mimikatz', 'vulnerability', 'tracking', 'registry', 'devices']
description: 'This document outlines the method for tracking devices vulnerable to Mimikatz using a registry-based detection string. It includes the necessary settings and applicable operating systems for effective monitoring.'
tags: ['security', 'windows', 'configuration', 'detection']
draft: false
unlisted: false
---
## Summary

The role uses a registry to track any Mimikatz vulnerable devices.

## Settings

| Detection String                                          | Comparator | Result | Applicable OS |
|----------------------------------------------------------|------------|--------|----------------|
| {%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest:UseLogonCredential-%} | Equals     | 0      | Windows        |




