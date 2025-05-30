---
id: 'b3b5abcf-1f0b-440b-89e1-fe37c9ec18eb'
slug: /b3b5abcf-1f0b-440b-89e1-fe37c9ec18eb
title: 'Windows RDS Connection Broker'
title_meta: 'Windows RDS Connection Broker'
keywords: ['rds', 'connection', 'broker', 'installation', 'windows']
description: 'This document provides a PowerShell script to confirm whether the RDS Connection Broker server role is installed on a Windows operating system. It includes a detection string and settings for verifying the installation status.'
tags: ['installation', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document uses PowerShell to confirm if the RDS Connection Broker server role is installed.

## Settings

| Detection String                                        | Comparator | Result | Applicable OS |
|--------------------------------------------------------|------------|--------|----------------|
| `{%@powershell "(Get-WindowsFeature RDS-Connection-Broker).Installed"@%}` | Equals     | True   | Windows        |