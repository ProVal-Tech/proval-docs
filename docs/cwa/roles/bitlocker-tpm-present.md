---
id: '4fd4e60a-c79a-48b1-bd25-016d26e8d28c'
slug: /4fd4e60a-c79a-48b1-bd25-016d26e8d28c
title: 'Bitlocker TPM Present'
title_meta: 'Bitlocker TPM Present'
keywords: ['bitlocker', 'tpm', 'windows', 'agent', 'security']
description: 'This document provides a summary and settings for checking if the agent has Bitlocker TPM present. It includes a detection string, comparator, and applicable operating system details.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines whether the agent has Bitlocker TPM present.

## Settings

| Detection String                                                                                     | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `\{%@C:/WINDOWS/system32/WindowsPowerShell/v1.0/powershell.exe -command "Get-Tpm|select -ExpandProperty TPMPresent"@%}` | Contains   | True   | Windows        |