---
id: '8484cc0a-dc70-40e7-86d2-bd5f3c7ac0a9'
slug: /8484cc0a-dc70-40e7-86d2-bd5f3c7ac0a9
title: 'Stale Bitlocker Data G'
title_meta: 'Stale Bitlocker Data G'
keywords: ['bitlocker', 'monitor', 'key', 'retrieval', 'date']
description: 'This document outlines a monitor that runs on BitLocker-enabled machines to check if the key retrieval date is older than 30 days, ensuring compliance and security for your systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor runs on BitLocker-enabled machines and checks if the key retrieval date is older than 30 days.

## Dependencies

- [BitLocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5) - This needs to be tied as an autofix with the monitor.
- [plugin_proval_bitlocker](/docs/dfddb88b-37c2-4d42-b8a0-bb7ebe4da6d0)

## Target

Global