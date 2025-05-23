---
id: '5cd09bd8-bf3c-431a-8ee6-e56bff349e50'
slug: /5cd09bd8-bf3c-431a-8ee6-e56bff349e50
title: 'Windows Server Backup'
title_meta: 'Windows Server Backup'
keywords: ['detection', 'windows', 'server', 'backup', 'feature']
description: 'This document outlines a role created to detect the installation of the Windows Server Backup feature. It includes the detection string, comparator, and applicable operating systems for effective monitoring.'
tags: ['backup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This role is created to detect the agents where the Windows Server Backup feature is installed.

## Settings

| Detection String                                                                                          | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `\{@%powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name Windows-Server-Backup -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Installed"@%}` | Contains   | True   | Windows        |