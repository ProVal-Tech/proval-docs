---
id: '5eb171c1-2c40-4283-b8dc-090faf1b2757'
slug: /5eb171c1-2c40-4283-b8dc-090faf1b2757
title: 'TLS 1.3 Enabled'
title_meta: 'TLS 1.3 Enabled'
keywords: ['registry', 'tls', 'client', 'security', 'enabled', 'windows']
description: 'This document provides a method to check the Windows registry for the TLS 1.3 Client settings. It outlines how to determine if the TLS 1.3 protocol is enabled by checking the registry value and includes related roles, scripts, and dataviews for comprehensive management of TLS settings.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks the registry for the value of the stored credentials flag.

**Registry Path:**
```
HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Client:Enabled
```

- If it is set to `1`, TLS 1.3 is enabled.
- If it is not set, TLS 1.3 is disabled.

### Related Roles

- [TLS 1.0 Enabled](<./TLS 1.0 Enabled.md>)
- [TLS 1.1 Enabled](<./TLS 1.1 Enabled.md>)
- [TLS 1.2 Enabled](<./TLS 1.2 Enabled.md>)

### Related Script

- [Internet Explorer Advanced SSL and TLS Settings [Script]](<./Internet Explorer Advanced SSL and TLS Settings Script.md>)

### Related Dataview

- [Internet Explorer Advanced SSL and TLS Settings](<../scripts/Internet Explorer Advanced SSL and TLS Settings.md>)

## Settings

| Detection String                                             | Comparator | Result | Applicable OS |
|-------------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.3/Client:Enabled-%} | Equals     | 1      | Windows        |


