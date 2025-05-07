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

- [TLS 1.0 Enabled](/docs/9eaa6337-abd3-42ee-afc3-556723ce25da)
- [TLS 1.1 Enabled](/docs/d4d3bee7-87cb-4499-a152-ae70fc9f2aa6)
- [TLS 1.2 Enabled](/docs/599af337-988a-427d-a675-7547e8530596)

### Related Script

- [Internet Explorer Advanced SSL and TLS Settings [Script]](/docs/bdc0cb0d-5b88-448b-9568-268d27fdc17d)

### Related Dataview

- [Internet Explorer Advanced SSL and TLS Settings](/docs/1adb82ca-d3cb-4319-9319-5d22b569ed6f)

## Settings

| Detection String                                             | Comparator | Result | Applicable OS |
|-------------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.3/Client:Enabled-%} | Equals     | 1      | Windows        |

