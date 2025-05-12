---
id: 'de9337ff-a8ec-4d42-b182-436178eecbc6'
slug: /de9337ff-a8ec-4d42-b182-436178eecbc6
title: 'Microsoft - On-premises DRS Joined'
title_meta: 'Microsoft - On-premises DRS Joined'
keywords: ['dsregcmd', 'domain', 'azure', 'join', 'status']
description: 'This document provides a method to use dsregcmd.exe to query the system and determine the domain and Azure domain join status. It includes a detection string and applicable OS information for implementation.'
tags: ['active-directory', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to use `dsregcmd.exe` to query the system and determine the domain and Azure domain join status.

For more information, visit the official documentation: [Troubleshoot device dsregcmd](https://docs.microsoft.com/en-us/azure/active-directory/devices/troubleshoot-device-dsregcmd).

## Settings

| Detection String                                                                                                                                                                                                 | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `{%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : YES*') -and ($DSRegStatus -like '*DomainJoined : YES*')]"}@%` | Equals     | True   | Windows        |