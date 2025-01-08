---
id: 'cwa-bitlocker-status-check'
title: 'Bitlocker Status Check for C: Drive'
title_meta: 'Bitlocker Status Check for C: Drive'
keywords: ['bitlocker', 'endpoint', 'status', 'protection', 'windows']
description: 'This document outlines the process to determine if the C: drive on an endpoint has Bitlocker enabled. It includes information on accessing the data through Bitlocker dataviews or the roles tab in ConnectWise Automate, along with the necessary detection string and settings.'
tags: ['bitlocker', 'endpoint', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This role will determine if the C: drive on an endpoint has Bitlocker enabled.

This data is visible in the Bitlocker dataviews or the roles tab in Automate.

## Settings

| Detection String                                     | Comparator | Result        | Applicable OS |
|-----------------------------------------------------|------------|---------------|----------------|
| `{%@manage-bde -status C: | find "Protection Status"@%}` | Contains   | Protection On | Windows OS     |

