---
id: 'b89c97c8-2553-4ede-b89e-49647cf8d324'
slug: /b89c97c8-2553-4ede-b89e-49647cf8d324
title: 'Update-WindowsServer2022'
title_meta: 'Update-WindowsServer2022'
keywords: ['windows-server', 'windows-server-2022', 'in-place-upgrade', 'upgrade', 'windows-setup', 'iso', 'server-2019', 'server-2016']
description: 'Upgrades Windows Server 2019 to Windows Server 2022 in place from installation media, keeping apps, settings, and data.'
tags: ['upgrade', 'windows', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Description

Upgrades Windows Server 2019 to Windows Server 2022 in place. Apps, settings, and data stay on the server.

The script runs Windows Setup silently from your Windows Server 2022 media, then restarts the server to finish the upgrade. Servers already on Windows Server 2022 or later are not changed.

## Requirements

- Windows Server 2019. Windows Server 2016 also works, because Microsoft supports upgrading it to Windows Server 2022. Windows Setup decides whether the server can be upgraded.
- Run as SYSTEM or a local administrator.
- PowerShell 5 or later. Windows Server 2016 and 2019 include it.
- Windows Server 2022 installation media in the same language as the server. Use an ISO file, or a folder or drive that holds the media.
- A licensed edition. Evaluation editions must be converted first. See [Troubleshooting](#troubleshooting).
- A product key, if your media asks for one. Retail media usually does.

## Usage

Upgrade from an ISO file:

```powershell
.\Update-WindowsServer2022.ps1 -Source 'C:\ISO\Server2022.iso'
```

Upgrade from media attached as drive D:, such as an ISO attached to a virtual machine:

```powershell
.\Update-WindowsServer2022.ps1 -Source 'D:\'
```

Upgrade from an ISO on a network share, choosing the fourth image and entering a retail product key:

```powershell
.\Update-WindowsServer2022.ps1 -Source '\\fileserver\iso\Server2022.iso' -ImageIndex 4 -ProductKey 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'
```

### What happens

1. The script checks the server. Servers on Windows Server 2022 or later stop here with no changes.
2. It opens the media and confirms it is Windows Server 2022.
3. It picks the image that matches the server's edition (Standard or Datacenter) and type (Server Core or Desktop Experience).
4. It runs Windows Setup silently. Setup continues past compatibility warnings, but problems that block the upgrade still stop it.
5. It restarts the server after 60 seconds. Setup finishes the upgrade during the restarts that follow, usually in 30 to 90 minutes.

To cancel the restart, run `shutdown /a` within the 60 seconds. The next restart then finishes the upgrade.

## Parameters

| Parameter    | Alias | Required | Default | Type   | Description |
| ------------ | ----- | -------- | ------- | ------ | ----------- |
| `Source`     |       | True     |         | String | The ISO file, or a folder or drive that holds the Windows Server 2022 media. |
| `ImageIndex` |       | False    | `0`     | Int    | The image to install from the media. `0` picks the image that matches the server. Use another number to change edition, such as Standard to Datacenter. |
| `ProductKey` |       | False    |         | String | Product key for media that asks for one. The key is never written to the logs. |

An image is one edition of Windows Server on the media. Server Core is the installation without the desktop. Desktop Experience is the installation with it.

## Output

The script returns one line that starts with `Success:` or `Failure:`. A failure stops the script with an error, so your RMM platform reports the run as failed. The server is never restarted after a failure.

```text
Success: Windows Setup finished the first phase of the upgrade to Windows Server 2022 (exit code 0x00000003). The server restarts in 60 seconds to finish the upgrade.
Success: This server already runs Microsoft Windows Server 2022 Standard (build 20348), which is Windows Server 2022 or later. No changes were made.
Failure: Windows Setup returned 0xC1900208 and did not upgrade the server. The setup logs are in C:\$WINDOWS.~BT\Sources\Panther.
```

Logs are written to these files in the script's folder:

```text
Update-WindowsServer2022-log.txt
Update-WindowsServer2022-error.txt
```

The script installs the `Strapper` logging module from `contentrepo.net` and the PowerShell Gallery. If the server cannot reach them, these files are not created. The log appears in the script output instead.

You'll know it worked when you run the script again after the upgrade and it returns `Success: This server already runs ... Windows Server 2022`.

## Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| `The media has no image for edition ServerStandardEval` (or `ServerDatacenterEval`) | The server runs an evaluation edition, which Setup cannot upgrade. | Convert the server to a licensed edition, restart, and run again. Example: `DISM /Online /Set-Edition:ServerStandard /ProductKey:<key> /AcceptEula` |
| `Source ... was not found or is not accessible` | The path is wrong, or the account running the script cannot read the network share. When run as SYSTEM, this is the server's computer account. | Check the path. Give the server's computer account read access to the share, or copy the ISO to the server. |
| `... does not hold Windows installation media` | `Source` points to the folder that holds the ISO file, not the media itself. | Set `Source` to the ISO file's full path. |
| `The media in ... is build 17763, not Windows Server 2022` | `Source` points to media for another version, such as Windows Server 2019. | Use Windows Server 2022 media. |
| `Could not mount ...` | Windows could not mount the ISO with a drive letter. | Mount the ISO yourself and set `Source` to its drive, such as `'E:\'`. |
| `Windows Setup returned 0x...` | Setup found a problem, such as an unsupported version, a language mismatch, or a missing product key. | Check the setup logs in `C:\$WINDOWS.~BT\Sources\Panther`, fix the problem, and run again. |
| `A restart could not be scheduled` | Setup finished its first phase, but Windows could not schedule the restart. | Restart the server yourself to finish the upgrade. |

## References

- [Install, upgrade, or migrate to Windows Server](https://learn.microsoft.com/en-us/windows-server/get-started/install-upgrade-migrate)

## Changelog

### 2026-10-27

- Initial version of the document.
