---
id: '06dec980-1779-4612-a0cf-83587c6f2157'
title: 'RDS Gateway Server Detection'
title_meta: 'RDS Gateway Server Detection'
keywords: ['rds', 'gateway', 'server', 'detection', 'windows']
description: 'This document outlines how to determine if an agent is functioning as an RDS Gateway server, including the necessary detection string and applicable settings for Windows operating systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
---
## Summary

This role determines if the agent is acting as an RDS Gateway server.

## Settings

| Detection String                                   | Comparator | Result | Applicable OS |
|----------------------------------------------------|------------|--------|----------------|
| \{%@powershell "(Get-WindowsFeature RDS-Gateway).Installed"@%} | Equals     | True   | Windows        |













