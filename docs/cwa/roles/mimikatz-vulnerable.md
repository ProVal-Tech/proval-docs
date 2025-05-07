---
id: '58ebf02f-0bcc-458d-bc99-7ee5cc89a6d2'
slug: /58ebf02f-0bcc-458d-bc99-7ee5cc89a6d2
title: 'Mimikatz - Vulnerable'
title_meta: 'Mimikatz - Vulnerable'
keywords: ['mimikatz', 'vulnerability', 'tracking', 'registry', 'devices']
description: 'This document outlines the method for tracking devices vulnerable to Mimikatz using a registry-based detection string. It includes the necessary settings and applicable operating systems for effective monitoring.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the use of a registry to track devices vulnerable to Mimikatz.

## Settings

| Detection String                                          | Comparator | Result | Applicable OS |
|----------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest:UseLogonCredential-%} | Equals     | 0      | Windows        |
