---
id: 'cwa-power-shell-version-in-serial-key'
title: 'PowerShell Version in Serial Key'
title_meta: 'PowerShell Version in Serial Key'
keywords: ['powershell', 'serial', 'version', 'key', 'detection']
description: 'This document provides an overview of how to include the PowerShell version in a serial key. It outlines the detection string used, the comparator, and the applicable operating systems for this method.'
tags: ['windows', 'configuration', 'security', 'software']
draft: false
unlisted: false
---
## Summary

This role contains the PowerShell version in its serial key.

## Settings

| Detection String                                                                                                                                                                          | Comparator | Result                      | Applicable OS |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|-----------------------------|----------------|
| `{%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference =  'SilentlyContinue'; Write-Host /"$(Get-host).Version.Major).$((Get-Host).Version.Minor).$((Get-Host).version.Build).$((Get-Host).Version.Revision)/" -NoNewLine"@%}` | Exist      | PowerShell Version in SerialKey | Windows        |




