---
id: 'cwa-detect-servers-online-responder'
title: 'Detect Servers with Online Responder Feature'
title_meta: 'Detect Servers with Online Responder Feature'
keywords: ['servers', 'online', 'responder', 'feature', 'detection']
description: 'This document outlines a method to detect servers that have the Online Responder Feature installed using a PowerShell command. It provides a summary of the detection process and the applicable operating systems.'
tags: ['windows', 'configuration', 'security', 'installation']
draft: false
unlisted: false
---
## Summary

Will detect the servers with the Online Responder Feature installed.

## Settings

| Detection String                                                                                                                                             | Comparator | Result   | Applicable OS |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|----------|----------------|
| `%{@powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'ADCS-Online-Cert' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%}` | Contains   | Installed | Windows        |




