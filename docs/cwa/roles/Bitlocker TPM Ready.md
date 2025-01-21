---
id: 'e5234598-aaa5-412c-8425-f9d1c95c00b5'
title: 'Bitlocker TPM Ready'
title_meta: 'Bitlocker TPM Ready'
keywords: ['tpm', 'machine', 'connectwise', 'database', 'role']
description: 'This document outlines a role that checks if the Trusted Platform Module (TPM) is ready for use on a machine. If the TPM is ready, the role is applied to the machine in the ConnectWise Automate database, ensuring proper configuration and security measures are in place.'
tags: ['connectwise', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This role checks if the TPM on the machine is ready to use. If so, this role is applied to the machine in the Automate database.

## Settings

| Detection String                                                                                           | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| \\\{@%C://WINDOWS//system32//WindowsPowerShell//v1.0//powershell.exe -command "Get-Tpm|select -ExpandProperty TPMReady"@%} | Contains   | True   | All OS's       |




