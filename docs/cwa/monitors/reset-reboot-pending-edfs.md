---
id: '79256871-2745-4096-8892-c4554926ed18'
slug: /79256871-2745-4096-8892-c4554926ed18
title: 'Reset Reboot Pending EDFs'
title_meta: 'Reset Reboot Pending EDFs'
keywords: ['monitor', 'reboot', 'windows', 'edf', 'automation']
description: 'This document outlines an internal monitor designed to detect agents that have undergone a reboot through a specific script. It triggers another script to clear pending EDFs, allowing for re-triggering at a later time. This monitor is specifically intended for Windows workstations and is automation-driven.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor is designed to detect agents whose reboot was initiated by the script [EPM - Windows Configuration - Script - User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8). It identifies these agents and triggers the script [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c) to clear the EDFs so they can be re-triggered at a later time.

## Dependencies

- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c)

## Target

This monitor is an automation-driven reboot prompt removal tool. It should only be applied to Windows workstations.

- **Windows Workstations**: This monitor should be run on non-server machines that are running Windows.