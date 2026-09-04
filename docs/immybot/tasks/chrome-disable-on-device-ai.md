---
id: 'abf1b1f2-f051-4ba9-8411-662133c7fc75'
slug: /abf1b1f2-f051-4ba9-8411-662133c7fc75
title: 'Chrome - Disable On-Device AI'
title_meta: 'Chrome - Disable On-Device AI'
keywords: ['chrome', 'Disable']
description: 'Configures a Google Chrome enterprise policy to disable Chrome on-device AI models, such as Gemini Nano.'
tags: ['chrome']
draft: false
unlisted: false
last_update:
  date: 2025-04-11
---

## Description

This Immy script configures a Google Chrome enterprise policy to disable Chrome's on-device AI models, such as Gemini Nano.

It creates the required Chrome policy registry path under:

HKLM:\SOFTWARE\Policies\Google\Chrome

and sets the GenAILocalFoundationalModelSettings policy to 1 as a DWORD. This prevents Chrome from downloading or using supported local/on-device AI models.

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/chrome-disable-on-device-ai.toml)

## Changelog

### 2026-09-04

- Initial version of the document

