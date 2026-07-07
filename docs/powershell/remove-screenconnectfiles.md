---
id: 'a3d5b3a3-e494-462a-ac5b-cd39daf11960'
slug: /a3d5b3a3-e494-462a-ac5b-cd39daf11960
title: 'Remove-ScreenConnectFiles'
title_meta: 'Remove-ScreenConnectFiles'
keywords: ['screenconnect', 'cleanup', 'version', 'folders', 'soc']
description: 'Removes all but the newest ScreenConnect version folder from the ScreenConnect working directory to prevent accumulating version-named folders from being flagged by SOC tooling.'
tags: ['software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Description
Removes all but the newest ScreenConnect version folder from the ScreenConnect working directory (`C:\WINDOWS\SystemTemp\ScreenConnect`). ScreenConnect leaves a version-named folder behind on every client update, and the accumulating folders are being flagged by SOC tooling.

## Usage
1. Verifies the ScreenConnect working directory exists.
2. Enumerates the immediate child folders and keeps only those whose names are valid version numbers (e.g. `25.1.10.9197`). Any folder that is not a version number is logged and left untouched.
3. Sorts the version folders newest-to-oldest and retains only the single newest one. If more than one folder resolves to the newest version, only one is kept.
4. Removes every other version folder.

*Removes every ScreenConnect version folder except the newest one.*

```powershell
.\Remove-ScreenConnectFiles.ps1
```

## Output
`.\Remove-ScreenConnectFiles-log.txt`

## Changelog

### 2026-07-07

- Initial version of the document.
