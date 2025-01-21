---
id: ps-remove-sophos
title: 'Remove-Sophos'
title_meta: 'Remove-Sophos Command'
keywords: ['remove', 'sophos', 'uninstall', 'security']
description: 'Documentation for the Remove-Sophos command to completely remove the Sophos Agent Endpoint from the system.'
tags: ['security', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Description
Attempts a complete removal of the Sophos Agent Endpoint.

## Requirements
Requires the SophosZap binary to be saved to `$env:SystemDrive\temp\sophoszap.exe`. The `SkipZap` parameter can be provided if this is not available; however, some artifacts will remain after completion. SophosZap is available at [https://download.sophos.com/tools/SophosZap.exe](https://download.sophos.com/tools/SophosZap.exe) but requires (free) registration to download.

## Usage
Attempts to remove just the Endpoint via MSI first. Then it attempts all Sophos-related MSIs registered in the Uninstall Registry Key, and finally, it will force-remove any remaining remnants.

```powershell
.\Remove-Sophos.ps1 -SkipZap
```
Performs removal steps but skips SophosZap.

## Parameters
| Parameter  | Required | Type   | Description                                                                                               |
|------------|----------|--------|-----------------------------------------------------------------------------------------------------------|
| `SkipZap`  | True     | String | Skips running the SophosZap tool from the vendor, as it can be more destructive than some users may like. |

## Output
Location of output for log, result, and error files.

```
.\Remove-Sophos-Log.txt
.\Remove-Sophos-Error.txt
```
