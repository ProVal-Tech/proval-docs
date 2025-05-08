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

An application designed to upgrade a target machine to Windows 11.

## Usage

*Download and install Windows 11*

```shell
./windows-upgrader.exe
```

*Download and install Windows 11 from a specified multipart URL, ignoring compatibility*

```shell
./windows-upgrader.exe --uri "https://my.site/win11/Windows11.zip" --multipart --ignorecompat
```

## Arguments

| Usage            | Description                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| `--uri <URI>`    | The URI to download the Windows 11 payload from.                                                                  |
| `--multipart`    | Use this switch if the Uri is a multipart URL. i.e.: `Windows11.zip -> Windows11.zip.001, Windows11.zip.002, ...` |
| `--noreboot`     | Do not reboot if upgrade is successful.                                                                           |
| `--ignorecompat` | Ignore Windows 11 compatibility requirements.                                                                     |
| `--debug`        | Enable debug logging.                                                                                             |