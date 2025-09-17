---
id: '047f1fc9-f296-42c0-bad6-3498b9160609'
slug: /047f1fc9-f296-42c0-bad6-3498b9160609
title: 'Disable Sleep Windows Server'
title_meta: 'Disable Sleep Windows Server'
keywords: ['disable-sleep', 'sleep', 'auto-sleep', 'device-standard']
description: 'This condition ensures that the Disable Sleep script runs on Windows servers where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the cPVAL Disable Sleep custom field.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Summary

This condition ensures that the [Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91) script runs on Windows servers where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the [cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3) custom field.

## Details

**Name:** `Disable Sleep`  
**Description:** `This condition ensures that the Disable Sleep script runs on Windows servers where auto-sleep is enabled for the active power plan, and the disabling mechanism is enabled through the cPVAL Disable Sleep custom field.`  
**Recommended Agent Policies:** `Windows Server [Default]`

## Dependencies

- [Custom Field - cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3)
- [Automation - Get Sleep Status](/docs/49127c19-f3b2-4006-9d48-ccd01290eafa)
- [Automation - Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91)
- [Solution - Disable Sleep](/docs/)
- [Solution - Device Standards](/docs/)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-sleep-windows-server.toml)
