---
id: '02eea95a-1eb2-496e-ac6c-e8263befe663'
title: 'Audit Dataview for Domain Controllers'
title_meta: 'Audit Dataview for Domain Controllers'
keywords: ['audit', 'dataview', 'domain', 'controllers', 'netlogon', 'requireseal', 'registry']
description: 'This document outlines the process to create an audit dataview for Domain Controllers focusing on the Netlogon RequireSeal registry key. It provides details on the registry key storage in the Serial Number column and includes settings for detection strings applicable to Windows operating systems.'
tags: ['registry', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This role can be used to create an audit dataview for the Domain Controllers for Netlogon's [RequireSeal](https://support.microsoft.com/en-us/topic/kb5021130-how-to-manage-the-netlogon-protocol-changes-related-to-cve-2022-38023-46ea3067-3989-4d40-963c-680fd9e8ee25#:~:text=Windows%20domain%20controllers%3A-,RequireSeal,-Registry%20key) registry key.

The registry key's value will be stored in the `Serial Number` column.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Services/Netlogon/Parameters:RequireSeal-%} | Exists     |        | Windows        |












