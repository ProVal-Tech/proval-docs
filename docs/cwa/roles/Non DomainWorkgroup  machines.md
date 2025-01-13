---
id: 'cwa-detect-domain-join-status'
title: 'Detect Machines Not Joined to a Domain'
title_meta: 'Detect Machines Not Joined to a Domain'
keywords: ['detection', 'domain', 'windows', 'status', 'machine']
description: 'This document outlines a PowerShell script that detects machines that are not joined to a domain. It includes a detection string and settings relevant for Windows operating systems, providing a clear method to verify domain status.'
tags: ['detection', 'windows', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

This role will detect machines that are not joined to a domain.

## Settings

| Detection String | Comparator | Result | Applicable OS |
|------------------|------------|--------|----------------|
|                  | Equals     | True   | Windows        |

```
{%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : NO*')]/"@%}
```




