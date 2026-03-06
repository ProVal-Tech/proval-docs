---
id: '1e483bae-ad35-437e-a963-fb7fab9f27e1'
slug: /1e483bae-ad35-437e-a963-fb7fab9f27e1
title: 'OS X FileVault'
title_meta: 'OS X FileVault'
keywords: ['filevault', 'mac', 'status', 'check', 'security']
description: 'This document outlines the role used to view the status of FileVault on Mac agents, including detection strings and applicable operating systems.'
tags: ['security']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This role is used to view the status of FileVault on Mac agents.

## Settings

| Detection String         | Comparator | Result               | Applicable OS |
|-------------------------|------------|----------------------|----------------|
| `%@fdesetup status@%`   | Contains   | FileVault is On      | Mac            |

## Changelog

### 2025-04-10

- Initial version of the document
