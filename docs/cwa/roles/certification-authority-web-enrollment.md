---
id: 'a60cfd5b-baf3-4a51-9ac8-82bcf58d11ad'
slug: /a60cfd5b-baf3-4a51-9ac8-82bcf58d11ad
title: 'Certification Authority Web Enrollment'
title_meta: 'Certification Authority Web Enrollment'
keywords: ['servers', 'certification', 'authority', 'web', 'enrollment']
description: 'This document provides a PowerShell role designed to detect servers that have the Certification Authority Web Enrollment feature installed. It includes a detailed detection string and settings for compatibility with Windows operating systems.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This role is used to detect servers with the Certification Authority Web Enrollment feature installed.

## Settings

| Detection String                                                                                     | Comparator | Result    | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|-----------|----------------|
| \{%@powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Web-Enrollment' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"@%} | Contains    | Installed | Windows        |