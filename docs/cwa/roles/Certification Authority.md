---
id: 'cwa-detect-cert-auth-servers'
title: 'Detect Servers with Certification Authority Feature'
title_meta: 'Detect Servers with Certification Authority Feature'
keywords: ['certification', 'servers', 'feature', 'windows', 'detection']
description: 'This document outlines a role used to identify servers that have the Certification Authority feature installed. It includes a detection string and settings to effectively determine the installation state of the feature on Windows operating systems.'
tags: ['security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

Role used to detect the servers with Certification Authority Feature installed.

## Settings

| Detection String                                                                                      | Comparator | Result   | Applicable OS |
|-------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| {@%powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'ADCS-Cert-Authority' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains   | Installed | Windows       |



