---
id: '2a4259c9-915e-42de-a5d4-3d92dca5a8a1'
slug: /2a4259c9-915e-42de-a5d4-3d92dca5a8a1
title: 'Remove-DattoRmmAgent'
title_meta: 'Remove-DattoRmmAgent'
keywords: ['remove', 'datto', 'rmm', 'cleanup']
description: 'Documentation for the Remove-DattoRmmAgent command to fully remove Datto RMM from an endpoint.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Description
Fully removes Datto RMM from an endpoint.

## Usage
- Runs the uninstall string from the Windows Registry.
- Manually removes any remaining files or registry keys.
- Iterates through all user appdata/local folders and removes any remaining Datto directories.

```powershell
.\Remove-DattoRmmAgent.ps1
```

## Output
.\Remove-DattoRmmAgent-log.txt