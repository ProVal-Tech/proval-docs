---
id: '2929d042-dfa6-4721-b60d-9fd78269b942'
title: 'Windows Fast Boot Check'
title_meta: 'Windows Fast Boot Check'
keywords: ['windows', 'fast-boot', 'shutdown', 'system', 'uptime']
description: 'This document outlines the role that determines if the Windows Fast Boot feature is enabled on a system. Fast Boot is a Windows 10 feature that allows the system to enter a deep sleep mode instead of a full shutdown, affecting system uptime. The document includes settings and detection strings for checking the Fast Boot status.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Summary

This role determines if the agent has Windows Fast Boot enabled.

Fast Boot is a Windows 10 feature that puts the system into a deep sleep rather than a true shutdown. Disabling Fast Boot causes the system uptime to reset when the system is shut down.

## Settings

| Detection String                                        | Comparator | Result | Applicable OS |
|--------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/Session Manager/Power:HiberbootEnabled-%} | Equals     | 1      | Windows        |

