---
id: '5eb171c1-2c40-4283-b8dc-090faf1b2757'
title: 'Check Registry for TLS 1.3 Client Settings'
title_meta: 'Check Registry for TLS 1.3 Client Settings'
keywords: ['registry', 'tls', 'client', 'security', 'enabled', 'windows']
description: 'This document provides a method to check the Windows registry for the TLS 1.3 Client settings. It outlines how to determine if the TLS 1.3 protocol is enabled by checking the registry value and includes related roles, scripts, and dataviews for comprehensive management of TLS settings.'
tags: ['security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

Checks registry for value if stored credentials flag is set.

HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.3/Client:Enabled

If it is set to 1 - enabled  
If it is not set - disabled  

Related Roles  

- [TLS 1.0 Enabled](https://proval.itglue.com/DOC-5078775-8030367)  
- [TLS 1.1 Enabled](https://proval.itglue.com/DOC-5078775-8015101)  
- [TLS 1.2 Enabled](https://proval.itglue.com/DOC-5078775-7920668)  

Related Script  

- [Internet Explorer Advanced SSL and TLS Settings [Script]](https://proval.itglue.com/DOC-5078775-7772468)  

Related Dataview  

- [Internet Explorer Advanced SSL and TLS Settings](https://proval.itglue.com/DOC-5078775-7770039)  

## Settings

| Detection String                                             | Comparator | Result | Applicable OS |
|-------------------------------------------------------------|------------|--------|----------------|
| {%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.3/Client:Enabled-%} | Equals     | 1      | Windows        |







