---
id: 'd0241d14-c13f-4113-99ed-e267befd3103'
slug: /d0241d14-c13f-4113-99ed-e267befd3103
title: 'Windows 10 22H2 ESU Audit'
title_meta: 'Windows 10 22H2 ESU Audit'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'Executes "ESU License Activation Detection" script once per day against Windows 10 22H2 machines.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

Executes [ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015) script once per day against [Windows 10 22H2](/docs/de098cf9-4ed4-49bb-b302-df3b76d70590) machines.

## Dependencies

- [Custom Field - cPVAL ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59)
- [Automation - ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015)
- [Group - cPVAL Windows 10 22H2](/docs/de098cf9-4ed4-49bb-b302-df3b76d70590)
- [Solution - Ninja Win10 ESU Licensing and Auditing](/docs/f1ae37d6-7fa7-414c-8550-1ae9ea11b987)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Windows 10 22H2 ESU Audit | Executes 'ESU License Activation Detection' script once per day against Windows 10 22H2 machines. | true | Daily | 1 day | 11:30 AM | Never | cPVAL Windows 10 22H2 | ESU License Activation Detection |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/windows-10-22h2-esu-audit.toml)