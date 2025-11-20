---
id: '850b68d4-ba80-4807-9588-2263440fe5cc'
slug: /850b68d4-ba80-4807-9588-2263440fe5cc
title: 'CVE-2025-24084 - WSL2 Uninstall'
title_meta: 'CVE-2025-24084 - WSL2 Uninstall'
keywords: ['vulnerability', 'cve', 'wsl']
description: 'This script uninstalls the Windows Subsystem Linux (WSL2) as it has a vulnerability.'
tags: ['vulnerability', 'cve']
draft: false
unlisted: false
---

## Summary

This script is designed to uninstall Windows Subsystem for Linux (WSL2) due to a recently identified security vulnerability.

The issue is associated with CVE‑2025‑24084, a high‑severity untrusted pointer dereference vulnerability in the WSL2 kernel that could allow a local attacker to execute arbitrary code with elevated privileges.

For more details, please refer to the article:
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-24084

## Dependencies
- [Solution - Uninstall WSL](/docs/69bd8087-6e6e-47ce-8484-ef0d6317e506) 

## Sample Run

![Sample Run](../../../static/img/docs/43b3849c-c2c7-4f34-9bda-28a450263cd4/image.webp)

## File Hash
- **File Path:** `C:\ProgramData\_automation\script\WSLUninstall\WSLUninstall.ps1`
- **MD5:** `08E46740E31BBC9398E5FACD191FB213`
- **SHA256:** `69E30DF1E57C30E317D445C2F7459326B2A071E3E6D3A308A2122B153D65B00F`

## Output

- Script log