---
id: '90d70d69-4264-4ff6-9cd3-d895b838a687'
title: 'Determine the Value of KrbtgtFullPacSignature Registry Key'
title_meta: 'Determine the Value of KrbtgtFullPacSignature Registry Key for Domain Controllers'
keywords: ['krbtgt', 'registry', 'domain', 'controllers', 'kerberos']
description: 'This document explains how to determine the value of the KrbtgtFullPacSignature registry key for Domain Controllers. It includes details on the role of the registry key in managing Kerberos protocol changes and provides a detection string for implementation.'
tags: ['kerberos', 'registry', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The role can be used to determine the value of the **[KrbtgtFullPacSignature](https://support.microsoft.com/en-us/topic/kb5020805-how-to-manage-kerberos-protocol-changes-related-to-cve-2022-37967-997e9acc-67c5-48e1-8d0d-190269bf4efb#:~:text=Registry%20Key%20settings-,Kerberos%20protocol,-After%20the%20Windows)** registry key for Domain Controllers. This registry key is used to gate the deployment of the Kerberos changes. The `Serial Number` column of the role will contain the value of the registry key.

The role can also be used to create an audit data view if needed.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/System/currentcontrolset/services/kdc:KrbtgtFullPacSignature-%}` | Exists     |        | Windows        |

