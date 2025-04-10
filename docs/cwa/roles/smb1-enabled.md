---
id: '618e3275-7c15-44be-90c9-6f17efc56677'
slug: /618e3275-7c15-44be-90c9-6f17efc56677
title: 'SMB1 Enabled'
title_meta: 'SMB1 Enabled'
keywords: ['smb1', 'security', 'endpoint', 'status', 'check']
description: 'This document outlines a role designed to check if SMB1 is enabled on endpoints. It highlights the importance of disabling SMB1 for security purposes and provides details on how to view the status of SMB1 across devices using a specific dataview.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This role will check if SMB1 is enabled on a device. For security purposes, SMB1 should be disabled on endpoints, and this role can help determine which machines have SMB enabled.

This data is viewable in the dataview: @Security - SMB1 Enabled Status Check [Role]

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `{%@powershell.exe \"(Get-SmbServerConfiguration).EnableSMB1Protocol\"@%}` | Contains   | True   | Windows OS     |


