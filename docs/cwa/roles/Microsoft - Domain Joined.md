---
id: '8708cf1b-fdf5-4128-a8f9-4e864052b8ae'
title: 'Microsoft - Domain Joined'
title_meta: 'Microsoft - Domain Joined'
keywords: ['domain', 'joined', 'machines', 'tracking', 'status']
description: 'This document provides a role definition for tracking machines that are joined to a domain. It includes a detection string that checks the Azure AD and Enterprise join status to confirm if a machine is domain joined.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition helps you track machines that are domain joined.

## Settings

| Detection String                                                                                                                                                                     | Comparator | Result | Applicable OS |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `%{powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : YES*')]}"@%` | Equals     | True   | Windows        |



