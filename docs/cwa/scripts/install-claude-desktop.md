---
id: '032638bf-0020-4d36-b52a-665e4d62adc3'
slug: /032638bf-0020-4d36-b52a-665e4d62adc3
title: 'Install Claude Desktop'
title_meta: 'Install Claude Desktop'
keywords: ['claude', 'claude-desktop', 'cowork', 'claude-cowork']
description: 'Installs Claude Desktop as per the Anthropic’s deployment guide, which recommends installing it as a system application to provision Claude for every user on the device.'
tags: ['application', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-06
---

## Summary

Installs Claude Desktop as per the Anthropic’s deployment guide, which recommends installing it as a system application to provision Claude for every user on the device.

## Sample Run

![Sample run output of the Install Claude Desktop script](../../../static/img/docs/032638bf-0020-4d36-b52a-665e4d62adc3/image1.webp)

## Global Variables

| Name | Value | Accepted Values | Description |
| ---- | ----- | --------------- | ----------- |
| ScriptEngineEnableLogger | `False` | `False`, `True` | When `True`, enables final (success/failure) logging; when `False` (default), these logs are suppressed to avoid adding entries to the `h_scripts` table. Set to `True` to assist with troubleshooting. |

## Output

- Script Log

## Changelog

### 2026-11-12

- Anthropic’s deployment guide, which recommends installing it as a system application to provision Claude for every user on the device to overcome the user admin permission issues from the previous version.

### 2026-04-06

- Code signed PowerShell script
- Updated the downloadUrl for both 7zr.exe and 7z.7z

### 2026-03-30

- Initial version of the document.
