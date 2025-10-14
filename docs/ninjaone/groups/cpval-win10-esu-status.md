---
id: '85bd58c3-9a63-4d35-a4ce-cff4d2feae26'
slug: /85bd58c3-9a63-4d35-a4ce-cff4d2feae26
title: 'Win10 ESU Status audit groups'
title_meta: 'Win10 ESU Status audit groups'
keywords: ['ESU', 'License', 'Extended', 'Windows 10']
description: 'This contains the list of Windows 10 devices where the ESU is activated/ not activated/ or script failed record in three different groups'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

This contains the list of Windows 10 devices where the ESU is activated/ not activated/ or script failed record in three different groups

## Details

| Name       | Description |
| ---------- | ----------- |
| Win10 ESU Activated | This contains the list of Windows 10 devices where the ESU is activated |
| Win10 ESU Not Activated | his contains the list of machines where the script detects that the ESU license was not activated |
| Win10 ESU Detection Failed | This contains the list of Windows 10 agents where the ESU license activation detection failed via script |


## Dependencies

[CF - cpval ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59)

[Script - ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015)

[Solution - Ninja Win10 ESU Licensing and Auditing](/docs/f1ae37d6-7fa7-414c-8550-1ae9ea11b987)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/cpval-win10-esu-status.toml)
