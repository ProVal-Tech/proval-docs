---
id: 'b540cb53-0d54-4d63-9ce4-073732fd1aa3'
slug: /b540cb53-0d54-4d63-9ce4-073732fd1aa3
title: 'Reboot Pending Prompt - Windows Workstation'
title_meta: 'Reboot Pending Prompt - Windows Workstation'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Compound condition that triggers the user reboot prompt sequence when the detection script identifies a pending reboot state.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Summary

This compound condition orchestrates the "Reboot Pending Prompt" solution. It utilizes the **Detection** script to check if a machine requires a reboot (based on Registry keys, Uptime, or Manual Override) and if the current time is suitable for a prompt. If the detection script returns an exit code indicating action is needed (Exit Code 1), this condition triggers the **Autofix** script to display the GUI prompt to the user.

## Details

- **Name:** `Reboot Pending Prompt - Windows Workstation`  
- **Description:** `Triggers the Reboot Pending Prompt Autofix when the Detection script identifies a pending reboot and valid prompting conditions.`  
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01)
- [Custom Field: cPVAL Reboot Prompt When Pending Reboot ](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278)
- [Custom Field: cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33)
- [Automation: Reboot Pending Prompt - Detection](/docs/9817ce6b-6f8c-4718-844f-4f44f6c66376)
- [Automation: Reboot Pending prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8)
- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/reboot-pending-prompt-windows-workstation.toml)
