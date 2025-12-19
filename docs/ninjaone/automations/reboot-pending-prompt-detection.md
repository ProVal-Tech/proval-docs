---
id: '9817ce6b-6f8c-4718-844f-4f44f6c66376'
slug: /9817ce6b-6f8c-4718-844f-4f44f6c66376
title: 'Reboot Pending Prompt - Detection'
title_meta: 'Reboot Pending Prompt - Detection'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Detection script for the "Reboot Pending Prompt" solution. Determines if a machine requires a reboot and if the current conditions permit a user prompt.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Overview

This script serves as the detection logic for the [Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) solution. Its primary function is to intelligently decide whether a reboot prompt should be displayed to the user.

It performs checks in three key areas:

1. **Operational Safety:** Before evaluating necessity, the script checks if the [Reboot Pending prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8) is currently active (specifically checking for the scheduled task it manages). If a prompt cycle is already in progress, this script exits immediately to prevent conflicting or duplicate actions.
2. **Necessity:** It determines if a reboot is actually required by checking Windows Registry keys (for pending updates), comparing system uptime against a configured threshold, or checking for a manual administrator override.
3. **Timing & Convenience:** If a reboot is needed, the script then validates if the current moment is appropriate for a prompt. It checks constraints such as "Quiet Hours" (suppress windows), weekend exclusions, user presence (logged in vs. lock screen), and ensures the user isn't prompted too frequently.

If the script determines a reboot is needed, the timing is valid, and no conflicting prompts are active, it returns an exit code that triggers the remediation script.

## Sample Run

> **Note:** This script is specifically engineered to operate as the detection condition within the [Reboot Pending Prompt - Windows Workstation](/docs/b540cb53-0d54-4d63-9ce4-073732fd1aa3) policy. Manual execution is not recommended, as the script's output is intended to trigger automated remediation actions rather than provide direct feedback.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Fields

| Custom Field | Description |
| :--- | :--- |
| [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) | Manual override to force a prompt cycle. |
| [cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395) | Timestamp of the last successful prompt. Managed automatically. |
| [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) | Counter for how many times the user has been prompted. Managed automatically. |
| [cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278) | Enable/Disable detection based on Windows Registry keys. |
| [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) | Uptime threshold (days) to trigger a reboot. Set to 0 to disable. |
| [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) | Max number of prompts allowed before the cycle resets (or force reboot occurs). |
| [cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098) | Minimum hours to wait between consecutive prompts. |
| [cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83) | Enable to suppress prompts on Saturdays and Sundays. |
| [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d) | 24-hour time range (HHmm-HHmm) to suppress prompts (e.g., '1800-0800'). |
| [cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562) | Enable to reboot immediately if no user is signed in. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/reboot-pending-prompt-detection.ps1)

## Output

- **Activity Details:** Text output indicating if a reboot is required and if conditions were met.
- **Custom Field:** Updates `cPVAL Pending Reboot`, `cPVAL Last Prompted`, and `cPVAL Times Prompted` when resetting state (self-healing).
