---
id: '032638bf-0020-4d36-b52a-665e4d62adc3'
slug: /032638bf-0020-4d36-b52a-665e4d62adc3
title: 'Install Claude Desktop'
title_meta: 'Install Claude Desktop'
keywords: ['claude', 'claude-desktop', 'cowork', 'claude-cowork']
description: 'Installs Claude Desktop for the currently logged-in user context using a downloaded installer and a temporary scheduled task.'
tags: ['application', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-30
---

## Summary

Installs Claude Desktop for the currently logged-in user context using a downloaded installer and a temporary scheduled task.

### Workflow

1. Confirms an interactive user session exists.
2. Creates a working directory under ProgramData and grants broad access needed by scheduled task execution.
3. Downloads the Claude installer executable from Anthropic.
4. Enables trusted app sideloading via AppModelUnlock registry settings if needed (we need this to install the application).
5. Enables the `VirtualMachinePlatform` optional Windows feature (we need this feature to use cowork).
6. Creates and runs a short-lived scheduled task to launch the installer silently.
7. Polls for Claude package installation, then removes the temporary scheduled task.

> **Note:** *A user must be logged-in to install the application*

## Sample Run

![Image1](../../../static/img/docs/032638bf-0020-4d36-b52a-665e4d62adc3/image1.webp)

## Output

- Script Log

## Changelog

### 2026-03-30

- Initial version of the document.
