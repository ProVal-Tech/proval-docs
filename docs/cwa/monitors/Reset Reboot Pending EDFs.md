---
id: 'cwa-internal-monitor-reboot-prompt-removal'
title: 'Internal Monitor for Reboot Prompt Removal'
title_meta: 'Internal Monitor for Reboot Prompt Removal'
keywords: ['monitor', 'reboot', 'windows', 'edf', 'automation']
description: 'This document outlines an internal monitor designed to detect agents that have undergone a reboot through a specific script. It triggers another script to clear pending EDFs, allowing for re-triggering at a later time. This monitor is specifically intended for Windows workstations and is automation-driven.'
tags: ['monitor', 'windows', 'automation', 'edf', 'reboot']
draft: false
unlisted: false
---
## Summary

This internal monitor is designed to detect the agents whose reboot was done by the script [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644). It detects the agents and triggers the script [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421) to clear the EDFs so they can be re-triggered at another time.

## Dependencies

[EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421)

## Target

This monitor is an automation-driven reboot prompt removal monitor. This should only be applied to Windows Workstations.

Windows Workstations - Should be run on non-servers and must be running Windows.



