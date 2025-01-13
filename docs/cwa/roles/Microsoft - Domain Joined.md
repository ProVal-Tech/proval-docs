---
id: 'cwa-track-domain-joined-machines'
title: 'Track Domain Joined Machines'
title_meta: 'Track Domain Joined Machines'
keywords: ['domain', 'joined', 'machines', 'tracking', 'status']
description: 'This document provides a role definition for tracking machines that are joined to a domain. It includes a detection string that checks the Azure AD and Enterprise join status to confirm if a machine is domain joined.'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This role definition helps you track machines which are domain joined.

## Settings

| Detection String                                                                                                                                                                     | Comparator | Result | Applicable OS |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `%{powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : YES*')]"@%}` | Equals     | True   | Windows        |



