---
id: '7cef0364-5793-4623-b5bc-5e446448cb70'
title: 'Detect Servers with Certification Authority Feature'
title_meta: 'Detect Servers with Certification Authority Feature'
keywords: ['certification', 'servers', 'feature', 'windows', 'detection']
description: 'This document outlines a role used to identify servers that have the Certification Authority feature installed. It includes a detection string and settings to effectively determine the installation state of the feature on Windows operating systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a role used to detect servers with the Certification Authority feature installed.

## Settings

| Detection String                                                                                      | Comparator | Result   | Applicable OS |
|-------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| `{@%powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Cert-Authority' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"@%}` | Contains   | Installed | Windows       |
