---
id: '2aa464bf-472c-48db-a3a8-f8fc1aa11091'
slug: /2aa464bf-472c-48db-a3a8-f8fc1aa11091
title: 'Windows - RDP Enabled'
title_meta: 'Windows - RDP Enabled'
keywords: ['rdp', 'detection', 'agent', 'windows']
description: 'This document outlines the detection of Remote Desktop Protocol (RDP) enabled on agents. It provides the detection string, comparator, result, and applicable operating systems for effective monitoring and management.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This role is detected on any agent where RDP is enabled.

## Settings

| Detection String                                                                                     | Comparator | Result | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| \{%@powershell "(Get-ItemProperty -Path 'HKLM://System//CurrentControlSet//Control//Terminal Server' -name 'fDenyTSConnections').fDenyTSConnections"@%} | Equals     | 0      | Windows        |



