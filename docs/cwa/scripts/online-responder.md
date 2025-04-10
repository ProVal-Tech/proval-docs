---
id: '06701525-5649-4693-97dd-915a0f59635a'
slug: /06701525-5649-4693-97dd-915a0f59635a
title: 'Online Responder'
title_meta: 'Online Responder'
keywords: ['servers', 'online', 'responder', 'feature', 'detection']
description: 'This document outlines a method to detect servers that have the Online Responder Feature installed using a PowerShell command. It provides a summary of the detection process and the applicable operating systems.'
tags: ['installation', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document will detect the servers with the Online Responder Feature installed.

## Settings

| Detection String                                                                                                                                             | Comparator | Result   | Applicable OS |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|----------|----------------|
| `%\{@powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Online-Cert' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"@%}` | Contains   | Installed | Windows        |



