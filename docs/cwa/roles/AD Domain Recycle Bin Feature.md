---
id: '01cb2977-8f3e-49fa-ad5b-62375c54a39c'
title: 'Detect Recycle Bin Feature on Domain Controller'
title_meta: 'Detect Recycle Bin Feature on Domain Controller'
keywords: ['recycle', 'bin', 'domain', 'controller', 'feature', 'detection']
description: 'This document outlines the method to detect if the Recycle Bin feature is enabled on a target Domain Controller using a specific detection string and provides details on the applicable operating system.'
tags: ['active-directory', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

The role is used to detect if the Recycle Bin feature is enabled on the target Domain Controller.

## Settings

| Detection String                                                                                                                                                     | Comparator | Result  | Applicable OS |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|---------|----------------|
| `%{@powershell.exe "$enabledScopes = Get-ADOptionalFeature -Identity 'Recycle Bin Feature'|select -exp enabledscopes|format-list;if ($enabledScopes){Write-Output -InputObject 'Enabled'}else{Write-Output -InputObject 'Disabled'}"@%}` | Equals     | Enabled | Windows        |







