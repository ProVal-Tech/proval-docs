---
id: '9885cd22-64e9-4269-91e6-e43946430e13'
title: 'SQL_Instances'
title_meta: 'SQL_Instances'
keywords: ['sql', 'instances', 'endpoint', 'gather', 'installed']
description: 'This document provides a method to gather all SQL instances installed on an endpoint using a PowerShell script. It includes the necessary detection strings, comparators, and applicable operating systems for effective implementation.'
tags: ['database', 'installation', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a method to gather all SQL instances installed on an endpoint.

## Settings

| Detection String                                                                                                                                                                                                                      | Comparator | Result                                                   | Applicable OS |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|----------------------------------------------------------|----------------|
| `%\\\{@powershell -c \"$rp = 'HKLM://SOFTWARE//Microsoft//Microsoft SQL Server';$sb = [scriptblock]::Create('$in = gp -ErrorAction SilentlyContinue ///\"$rp//Instance Names//SQL///\"; ///\"$((gp -erroraction silentlycontinue ///\"$rp//$($in.$_)//Setup///\").Version) - $((gp -erroraction silentlycontinue ///\"$rp//$($in.$_)//Setup///\").Edition)///\"'); (((gp -erroraction silentlycontinue $rp).InstalledInstances) | foreach -Process $sb) -join ', '\"@% | Regex      | `^/d\\\{2,}./d\\\{1,}./d\\\{4,}./d\\\{1,}/s-/s/w*/s` | Windows        |






