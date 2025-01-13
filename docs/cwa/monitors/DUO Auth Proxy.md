---
id: 'cwa-duo-authentication-proxy-monitor'
title: 'DUO Authentication Proxy Version Monitor'
title_meta: 'DUO Authentication Proxy Version Monitor'
keywords: ['duo', 'monitor', 'version', 'authentication', 'proxy', 'windows']
description: 'This document outlines a monitoring setup designed to identify computers with outdated versions of the DUO Authentication Proxy application installed. It includes specific details on check actions, server address, check types, and execution commands necessary for effective monitoring.'
tags: ['monitoring', 'windows', 'security', 'update', 'software']
draft: false
unlisted: false
---
## Summary

The monitor set's objective is to identify computers with older versions of the DUO Authentication Proxy application installed.

## Details

**Suggested "Limit to"**: Windows  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Update - DUO Auth Proxy  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$Progresspreference = 'SilentlyContinue';$Erroractionpreference = 'Silentlycontinue';$File = (Invoke-Webrequest -uri https://dl.duosecurity.com/duoauthproxy-latest.exe -Usebasicparsing -Method Head).headers.'Content-Disposition';[Version]$Latest = ($File -replace '.*duoauthproxy-','' -replace '\\.exe.$',''); [Version]$Current = (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Duo Security Authentication Proxy'}).DisplayVersion; if([version]$Latest -gt [version]$Current){return """$($Latest)""" }" | Regex | 86400 | '^(OK|\r\n)$|^$' |

## Target

- Group of windows machines having 'DUO Security Authentication Proxy' application installed



