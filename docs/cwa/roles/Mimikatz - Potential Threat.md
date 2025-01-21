---
id: 'd4cae7e3-3abd-44b5-a9d9-7a0668834050'
title: 'Mimikatz - Potential Threat'
title_meta: 'Mimikatz - Potential Threat'
keywords: ['registry', 'credentials', 'security', 'vulnerability', 'threat']
description: 'This document provides an overview of how to check the Windows registry for the stored credentials flag related to WDigest. It explains the implications of the flag being set or not and highlights potential vulnerabilities associated with it, including references to Mimikatz.'
tags: ['registry', 'security', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks the registry for the value of the stored credentials flag.

**Registry Path:**
```
HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest:UseLogonCredential
```

- If the flag is set, there is a potential threat associated with using it.
- If the flag is not set but exists, the system is vulnerable. For more information, see [Mimikatz - Vulnerable](<./Mimikatz - Vulnerable.md>).

## Settings

| Detection String                                     | Comparator | Result | Applicable OS |
|-----------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest:UseLogonCredential-%}` | Equals     | 1      | Windows        |



