---
id: 'de9337ff-a8ec-4d42-b182-436178eecbc6'
title: 'Query Domain and Azure Domain Join Status'
title_meta: 'Query Domain and Azure Domain Join Status'
keywords: ['dsregcmd', 'domain', 'azure', 'join', 'status']
description: 'This document provides a method to use dsregcmd.exe to query the system and determine the domain and Azure domain join status. It includes a detection string and applicable OS information for implementation.'
tags: ['active-directory', 'windows', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

Uses dsregcmd.exe to query system and determine domain / azure domain join status.

[https://docs.microsoft.com/en-us/azure/active-directory/devices/troubleshoot-device-dsregcmd](https://docs.microsoft.com/en-us/azure/active-directory/devices/troubleshoot-device-dsregcmd)

## Settings

| Detection String                                                                                                                                                                                                 | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| {%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : YES*') -and ($DSRegStatus -like '*DomainJoined : YES*')]"@%} | Equals     | True   | Windows        |







