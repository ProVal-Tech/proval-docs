---
id: '2383fd5a-aee3-4644-8bea-c05af3f3d320'
title: 'Remote Desktop Service Session Host Detection'
title_meta: 'Remote Desktop Service Session Host Detection'
keywords: ['remote', 'desktop', 'service', 'host', 'detection']
description: 'This document explains how to detect if a machine is a Remote Desktop Service Session Host and apply the corresponding role in the Automate database. It includes a detailed settings table with detection strings and applicable operating systems.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This role detects if the machine is a Remote Desktop Service Session Host and, if so, applies this role in the Automate database.

## Settings

| Detection String                                   | Comparator | Result | Applicable OS |
|---------------------------------------------------|------------|--------|----------------|
| {%@powershell "(Get-WindowsFeature RDS-RD-Server).Installed"@%} | Equals     | True   | Windows        |
