---
id: '8c083d5d-a464-4937-91ef-980a062b26fd'
slug: /8c083d5d-a464-4937-91ef-980a062b26fd
title: 'Windows Upgrader'
title_meta: 'Windows Upgrader'
keywords: ['windows-upgrader', 'upgrade', 'windows-11']
description: 'An application designed to upgrade a target machine to Windows 11.'
tags: ['windows', 'update']
draft: false
unlisted: false
---

## Description

An application designed to upgrade Windows systems to the latest version. It can be used to:

- Upgrade Windows 10 to Windows 11
- Install Windows 11 feature updates (e.g., 21H2 → 22H2 → 23H2 → 24H2)

The application supports multiple source types including HTTP/HTTPS URLs, local files, and network shares (UNC paths).

## Dependencies

- [windows-os-support.json](https://content.provaltech.com/attachments/windows-os-support.json)

## Usage

*Download and install Windows 11 from a specified multipart URL, ignoring compatibility*

```shell
.\windows-upgrader.exe --uri "https://my.site/win11/Windows11.zip" --multipart --ignorecompat
```

*Install from a local ISO file*

```shell
.\windows-upgrader.exe --uri "C:\Downloads\Win11_24H2_English_x64.iso"
```

*Install from a UNC network path*

```shell
.\windows-upgrader.exe --uri "\\server\share\windows11\Win11.iso"
```

*Install from Azure Blob Storage URL with query parameters*

```shell
.\windows-upgrader.exe --uri "https://storage.blob.core.windows.net/isos/Win11_24H2.iso?sv=2025-07-05&sp=r&sig=..."
```

*Install without rebooting after completion*

```shell
.\windows-upgrader.exe --uri "C:\ISOs\Windows11.iso" --noreboot
```

## Arguments

| Usage            | Description                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| `--uri <URI>`    | The URI to download/access the Windows 11 payload from. Supports HTTP/HTTPS URLs, local file paths, and UNC network paths. Accepts both `.zip` and `.iso` formats. |
| `--multipart`    | Use this switch if the URI points to a multipart archive. i.e.: `Windows11.zip` → `Windows11.zip.001`, `Windows11.zip.002`, ... |
| `--noreboot`     | Do not reboot if upgrade is successful.                                                                           |
| `--ignorecompat` | Ignore Windows 11 compatibility requirements.                                                                     |
| `--debug`        | Enable debug logging.                                                                                             |

## Supported Source Types

- **HTTP/HTTPS URLs**: Direct download from web servers (with or without query parameters)
- **Local File Paths**: Files stored on local drives (e.g., `C:\path\to\file.iso`)
- **UNC Network Paths**: Files on network shares (e.g., `\\server\share\file.iso`)
- **File Formats**: Both `.zip` and `.iso` formats are supported

## Notes

- The application automatically detects the file format (`.zip` or `.iso`) from the URI
- Multipart files are automatically combined during processing
- Log files are created in the system temp directory for troubleshooting
- The application validates the Windows version and checks if the system is already running the latest build before proceeding