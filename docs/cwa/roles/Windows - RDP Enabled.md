---
id: 'cwa-rdp-enabled-detection'
title: 'RDP Enabled Detection on Agents'
title_meta: 'RDP Enabled Detection on Agents'
keywords: ['rdp', 'detection', 'agent', 'windows']
description: 'This document outlines the detection of Remote Desktop Protocol (RDP) enabled on agents. It provides the detection string, comparator, result, and applicable operating systems for effective monitoring and management.'
tags: ['windows', 'security', 'configuration', 'networking']
draft: false
unlisted: false
---
## Summary

This role is detected on any agent where RDP is enabled on it.

## Settings

| Detection String                                                                                     | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| {%@powershell "(Get-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -name 'fDenyTSConnections').fDenyTSConnections"@%} | Equals     | 0      | Windows        |



