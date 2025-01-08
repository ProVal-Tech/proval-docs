---
id: 'cwa-bitlocker-tpm-check'
title: 'Bitlocker TPM Presence Check'
title_meta: 'Bitlocker TPM Presence Check'
keywords: ['bitlocker', 'tpm', 'windows', 'agent', 'security']
description: 'This document provides a summary and settings for checking if the agent has Bitlocker TPM present. It includes a detection string, comparator, and applicable operating system details.'
tags: ['security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This role denotes if the agent has Bitlocker TPM Present.

## Settings

| Detection String                                                                                     | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| {%@C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -command "Get-Tpm|select -ExpandProperty TPMPresent"@%} | Contains   | True   | Windows        |


