---
id: '203e9aa3-5081-487b-b71c-ee8c37a6f769'
slug: /203e9aa3-5081-487b-b71c-ee8c37a6f769
title: 'Reboot Pending Prompt - Macintosh'
title_meta: 'Reboot Pending Prompt - Macintosh'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt', 'macos']
description: 'Compound condition that triggers the user reboot prompt sequence on macOS when the detection script identifies a pending reboot state.'
tags: ['reboot', 'notifications', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This compound condition orchestrates the [Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) solution for macOS. It utilizes the [Detection](/docs/0a3f085c-11da-4567-80c3-8ba2f4047e4a) script to check if a Mac requires a reboot (based on Uptime or Manual Override) and if the current time is suitable for a prompt, respecting the client-level `cPVAL Reboot Prompt For MAC` opt-in gate. If the detection script returns an exit code indicating action is needed (Exit Code 1), this condition triggers the [Autofix](/docs/93c3e0c2-8c43-4829-8bee-81267b8f151c) script to display the `OmniPrompt` GUI directly to the logged-in user.

## Details

- **Name:** `Reboot Pending Prompt - Macintosh`  
- **Description:** `Triggers the Reboot Pending Prompt Autofix on macOS when the Detection script identifies a pending reboot and valid prompting conditions.`  
- **Recommended Agent Policies:** `Mac Desktops and Laptops Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Reboot Prompt For MAC](/docs/fafa4c99-8301-46bd-a195-07ff66ea713f)
- [Custom Field: cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01)
- [Custom Field: cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33)
- [Automation: Reboot Pending Prompt - Detection [Macintosh]](/docs/0a3f085c-11da-4567-80c3-8ba2f4047e4a)
- [Automation: Reboot Pending Prompt - Autofix [Macintosh]](/docs/93c3e0c2-8c43-4829-8bee-81267b8f151c)
- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/reboot-pending-prompt-macintosh.toml)

## Changelog

### 2026-07-20

- Initial version of the document
