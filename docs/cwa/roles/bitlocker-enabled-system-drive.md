---
id: '65d800d5-0bb9-4101-a6e9-289ab737557e'
slug: /65d800d5-0bb9-4101-a6e9-289ab737557e
title: 'Bitlocker Enabled - System Drive'
title_meta: 'Bitlocker Enabled - System Drive'
keywords: ['bitlocker', 'endpoint', 'status', 'protection', 'windows']
description: 'This document outlines the process to determine if the C: drive on an endpoint has BitLocker enabled. It includes information on accessing the data through BitLocker dataviews or the roles tab in ConnectWise Automate, along with the necessary detection string and settings.'
tags: ['bitlocker', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This role will determine if the C: drive on an endpoint has BitLocker enabled.

This data is visible in the BitLocker dataviews or the roles tab in Automate.

## Settings

| Detection String                                     | Comparator | Result        | Applicable OS |
|-----------------------------------------------------|------------|---------------|----------------|
| `\\\{%@manage-bde -status C: | find "Protection Status"@%}` | Contains   | Protection On | Windows OS     |