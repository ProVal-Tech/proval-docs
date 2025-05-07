---
id: '588520f3-c262-4b80-8c56-0b9411ab0bdc'
slug: /588520f3-c262-4b80-8c56-0b9411ab0bdc
title: 'DUO Auth Proxy'
title_meta: 'DUO Auth Proxy'
keywords: ['duo', 'monitor', 'version', 'authentication', 'proxy', 'windows']
description: 'This document outlines a monitoring setup designed to identify computers with outdated versions of the DUO Authentication Proxy application installed. It includes specific details on check actions, server address, check types, and execution commands necessary for effective monitoring.'
tags: ['security', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The objective of this monitor is to identify computers with older versions of the DUO Authentication Proxy application installed.

## Details

**Suggested "Limit to"**: Windows  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Update - DUO Auth Proxy  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; $ErrorActionPreference = 'SilentlyContinue'; $File = (Invoke-WebRequest -uri https://dl.duosecurity.com/duoauthproxy-latest.exe -UseBasicParsing -Method Head).Headers.'Content-Disposition'; [Version]$Latest = ($File -replace '.*duoauthproxy-', '' -replace '//.exe.$', ''); [Version]$Current = (Get-ChildItem -Path HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall, HKLM:/SOFTWARE/Wow6432Node/Microsoft/Windows/CurrentVersion/Uninstall | Get-ItemProperty | Where-Object \{ $_.DisplayName -match 'Duo Security Authentication Proxy' }).DisplayVersion; if ([Version]$Latest -gt [Version]$Current) \{ return """$($Latest)""" }" | Regex | 86400 | '^(OK|/r/n)$|^$' |

## Target

- Group of Windows machines having the 'DUO Security Authentication Proxy' application installed.


