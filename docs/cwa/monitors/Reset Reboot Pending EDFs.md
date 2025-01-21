---
id: '79256871-2745-4096-8892-c4554926ed18'
title: 'Internal Monitor for Reboot Prompt Removal'
title_meta: 'Internal Monitor for Reboot Prompt Removal'
keywords: ['monitor', 'reboot', 'windows', 'edf', 'automation']
description: 'This document outlines an internal monitor designed to detect agents that have undergone a reboot through a specific script. It triggers another script to clear pending EDFs, allowing for re-triggering at a later time. This monitor is specifically intended for Windows workstations and is automation-driven.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor is designed to detect agents whose reboot was initiated by the script [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644). It identifies these agents and triggers the script [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421) to clear the EDFs so they can be re-triggered at a later time.

## Dependencies

- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421)

## Target

This monitor is an automation-driven reboot prompt removal tool. It should only be applied to Windows workstations.

- **Windows Workstations**: This monitor should be run on non-server machines that are running Windows.

