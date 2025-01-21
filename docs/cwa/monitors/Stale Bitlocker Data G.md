---
id: '8484cc0a-dc70-40e7-86d2-bd5f3c7ac0a9'
title: 'Monitor for BitLocker Key Retrieval Date'
title_meta: 'Monitor for BitLocker Key Retrieval Date'
keywords: ['bitlocker', 'monitor', 'key', 'retrieval', 'date']
description: 'This document outlines a monitor that runs on BitLocker-enabled machines to check if the key retrieval date is older than 30 days, ensuring compliance and security for your systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor runs on BitLocker-enabled machines and checks if the key retrieval date is older than 30 days.

## Dependencies

- [BitLocker - Key Retrieval](<../scripts/Bitlocker - Key Retrieval.md>) - This needs to be tied as an autofix with the monitor.
- [plugin_proval_bitlocker](<../tables/plugin_proval_bitlocker.md>)

## Target

Global

