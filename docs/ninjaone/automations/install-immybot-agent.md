---
id: 'b0ed9c36-9a5b-44cc-a8b2-b5bbb7e2c3b7'
slug: /b0ed9c36-9a5b-44cc-a8b2-b5bbb7e2c3b7
title: 'Install ImmyBot Agent'
title_meta: 'Install ImmyBot Agent'
keywords: ['immybot', 'agent', 'installation', 'reinstallation']
description: 'This script automates the installation of the ImmyBot Agent MSI installer with option to reinstall if needed.'
tags: ['software', 'windows', 'installation']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Overview

This script automates the installation of the ImmyBot Agent MSI installer with option to reinstall if needed.

## Sample Run

![SampleRun1](../../../static/img/docs/b0ed9c36-9a5b-44cc-a8b2-b5bbb7e2c3b7/samplerun.webp)

## Dependencies

[Solution - Immybot Agent Deployment - NinjaOne](/docs/72284ce2-4cf0-402b-99c3-7c0cafa3d213)
[Custom Field - cPVAL ImmyBot Tenant](/docs/3f2fa791-6db5-448b-848c-0ee035af31d2)
[Custom Field - cPVAL ImmyBot Installer Key](/docs/10e4f602-510f-4ca1-8dcd-2845e06a3556)
[Custom Field - cPVAL ImmyBot Installer ID](/docs/22d1e1a4-68ab-4895-8694-134df61ea3ea)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `Reinstall Agent` | -- | -- | False | -- | `Checkbox` | This will reinstall the ImmyBot Agent |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/install-immybot-agent.ps1)

## Output

- Activity Details  

## Changelog

### 2026-10-14

- This is initial version of the document.