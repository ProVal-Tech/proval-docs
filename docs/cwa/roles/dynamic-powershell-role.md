---
id: '6c30a69a-90c5-4e2d-ba5f-f2a663adbd81'
slug: /6c30a69a-90c5-4e2d-ba5f-f2a663adbd81
title: 'Dynamic PowerShell Role'
title_meta: 'Dynamic PowerShell Role'
keywords: ['powershell', 'serial', 'version', 'key', 'detection']
description: 'This document provides an overview of how to include the PowerShell version in a serial key. It outlines the detection string used, the comparator, and the applicable operating systems for this method.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how the PowerShell version is incorporated into its serial key.

## Settings

| Detection String                                                                                                                                                                          | Comparator | Result                      | Applicable OS |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|-----------------------------|----------------|
| `{%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference = 'SilentlyContinue'; Write-Host //"$(Get-host).Version.Major).$((Get-Host).Version.Minor).$((Get-Host).version.Build).$((Get-Host).Version.Revision)//" -NoNewLine"@%}` | Exist      | PowerShell Version in Serial Key | Windows        |
## Attachments
[Dynamic_Powershell.sql](<../../../static/attachments/itg/10926872/Dynamic_Powershell.sql>)
