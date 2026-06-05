---
id: 'c4d012c0-192b-4313-8ba3-5745dfb70e67'
slug: /c4d012c0-192b-4313-8ba3-5745dfb70e67
title: 'Upgrade-WindowsToPro'
title_meta: 'Upgrade-WindowsToPro'
keywords: ['windows', 'upgrade', 'pro', 'license', 'edition']
description: 'Upgrades a Windows Home device to Windows Pro using a provided license key.'
tags: ['windows', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-06-05
---

## Description

Upgrades a Windows Home device to Windows Pro using a provided license key.

## Requirements

- PowerShell 5+
- Windows OS
- Must be run as an Administrator
- A valid Windows Pro product key

## Usage

Detects the current Windows edition and upgrades from Home to Pro using `changepk.exe`. If Windows Pro is already detected, no action is taken. A manual reboot is required after a successful upgrade.

```powershell
.\Upgrade-WindowsToPro.ps1 -LicenseKey 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'
```

## Parameters

| Parameter    | Alias | Required | Default | Type   | Description                                                                  |
| ------------ | ----- | -------- | ------- | ------ | ---------------------------------------------------------------------------- |
| `LicenseKey` |       | True     |         | String | A valid Windows Pro product key in the format XXXXX-XXXXX-XXXXX-XXXXX-XXXXX. |

## Output

- .\Upgrade-WindowsToPro-Log.txt
- .\Upgrade-WindowsToPro-Error.txt

## Changelog

### 2026-06-05

- Initial version of the document
