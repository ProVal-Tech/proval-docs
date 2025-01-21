---
id: '4da626c5-0cec-454e-a517-fc7bf22f80f2'
title: 'Azure AD Joined Detection'
title_meta: 'Azure AD Joined Detection'
keywords: ['azure', 'ad', 'detection', 'joined', 'status']
description: 'This document provides details on detecting Azure AD joined machines using a specific PowerShell command. It includes the detection string, the comparator used, and the applicable operating systems. Understanding this detection mechanism is essential for managing Azure AD environments effectively.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to detect machines that are Azure AD joined.

## Settings

| Detection String                                                                                                                                                                                                                                           | Comparator | Result | Applicable OS |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `{%@powershell.exe -nologo -noprofile -command \"$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : YES*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : NO*')]\"}@%` | Contains   | True   | Windows        |
