---
id: '01e513a0-0764-4d2d-ae60-871e42010526'
slug: /01e513a0-0764-4d2d-ae60-871e42010526
title: 'Disable Sleep Windows Workstation'
title_meta: 'Disable Sleep Windows Workstation'
keywords: ['disable-sleep', 'sleep', 'auto-sleep', 'device-standard']
description: 'This condition ensures that the Disable Sleep script runs on Windows workstations where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the cPVAL Disable Sleep custom field.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Summary

This condition ensures that the [Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91) script runs on Windows workstations where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the [cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3) custom field.

## Details

- **Name:** `Disable Sleep`  
- **Description:** `This condition ensures that the Disable Sleep script runs on Windows workstations where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the cPVAL Disable Sleep custom field.`  
- **Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3)
- [Automation - Get Sleep Status](/docs/49127c19-f3b2-4006-9d48-ccd01290eafa)
- [Automation - Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91)
- [Solution - Disable Sleep](/docs/a34e3293-b46a-485d-ae72-c30d235a2531)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-sleep-windows-workstation.toml)
