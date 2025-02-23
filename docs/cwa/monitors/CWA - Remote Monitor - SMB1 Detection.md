---
id: '8b1cd8a8-6684-4896-ae30-a39b3bdb485e'
title: 'CWA - Remote Monitor - SMB1 Detection'
title_meta: 'CWA - Remote Monitor - SMB1 Detection'
keywords: ['smb1', 'detection', 'vulnerability', 'windows', 'server']
description: 'This document outlines a method to check whether SMB1 is enabled on end machines using a PowerShell command. It includes details about the check action, server address, check type, and results. This is essential for vulnerability management and ensuring system security.'
tags: ['security', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

Check whether SMB1 is enabled on the end machine. It runs the OS version [compatible command](https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server#how-to-detect-status-enable-and-disable-smb-protocols) to fetch the data.

## Details

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File    | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -nologo -noprofile -Command "$ErrorActionPreference= 'SilentlyContinue';  $ver = [Version](get-WmiObject -Class Win32_OperatingSystem).version; /"$($ver.Major).$($ver.Minor)/"; if($ver -ge [version]'6.3') \{if ( ( (Get-SmbServerConfiguration).EnableSMB1Protocol )  -ne 'True') \{return 'False'} else \{return 'True'} } else \{ $s =  (Get-Item HKLM:/SYSTEM/CurrentControlSet/Services/LanmanServer/Parameters \| ForEach-Object \{Get-ItemProperty $_.pspath -Name SMB1} );  if ( ( -not $s ) -or ( $s -contains 1 )) \{return 'True'} else \{return 'False'} }" | Does Not Contain | 7200 | True |

## Target

**Custom Group -** `Vulnerability Management`

## How to Import

[Import - Remote Monitor - SMB1 Detection Query](<./SMB1 Detection Query.md>)




