---
id: 'b9e7f45e-b830-44b0-b296-121905ec770f'
slug: /b9e7f45e-b830-44b0-b296-121905ec770f
title: 'Clear-ChromiumCache'
title_meta: 'Clear-ChromiumCache'
keywords: ['clear', 'cache', 'chromium', 'browser']
description: 'Documentation for the Clear-ChromiumCache command to clear browser caches for Chromium-based browsers.'
tags: ['chrome', 'setup', 'web-browser']
draft: false
unlisted: false
---

## Description
Clears browser caches for Chromium-based browsers.

## Usage
1. Searches for well-known Chromium cache folders under each user's AppData directory.
2. Deletes all cache data from these discovered directories.
   1. Browser instances will be terminated if `-Force` is passed and they hold a handle to the target cache files.

*Clears detected Chromium browser caches from the target machine. Files with an active handle to the browser process will not be removed.*

```powershell
.\Clear-ChromiumCache.ps1
```

*Clears detected Chromium browser caches from the target machine, closing existing browser processes if required.*

```powershell
.\Clear-ChromiumCache.ps1 -Force
```

## Parameters
| Parameter | Alias | Required | Default | Type | Description                                                                |
| --------- | ----- | -------- | ------- | ---- | -------------------------------------------------------------------------- |
| `Force`   |       | False    |         | Bool | Closes existing browser processes with handles open to target cache files. |

## Output
`.\Clear-ChromiumCache-log.txt`


