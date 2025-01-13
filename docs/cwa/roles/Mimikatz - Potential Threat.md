---
id: 'cwa-checks-registry-for-credential-flag'
title: 'Checks Registry for Credential Flag'
title_meta: 'Checks Registry for Credential Flag'
keywords: ['registry', 'credentials', 'security', 'vulnerability', 'threat']
description: 'This document provides an overview of how to check the Windows registry for the stored credentials flag related to WDigest. It explains the implications of the flag being set or not, and highlights potential vulnerabilities associated with it, including references to Mimikatz.'
tags: ['registry', 'security', 'windows', 'vulnerability']
draft: false
unlisted: false
---
## Summary

Checks registry for value if stored credentials flag is set.

HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest:UseLogonCredential

If it is set - potential threat is using it.

If it is not set but exists - system is vulnerable - see [Mimikatz - Vulnerable](https://proval.itglue.com/DOC-5078775-8012520)

## Settings

| Detection String                                     | Comparator | Result | Applicable OS |
|-----------------------------------------------------|------------|--------|----------------|
| {%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest:UseLogonCredential-%} | Equals     | 1      | Windows        |




