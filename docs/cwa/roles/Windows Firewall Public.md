---
id: '984edd72-ce3d-4817-9628-74100ef83865'
title: 'Check Windows Firewall Public Setting'
title_meta: 'Check Windows Firewall Public Setting'
keywords: ['firewall', 'windows', 'public', 'security']
description: 'This document outlines the process to determine if the Windows Firewall is enabled to the "public" setting. The data can be accessed through the dataview: @Windows - Firewall Status, providing insights into the firewall configuration for security purposes.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process to determine if the Windows Firewall is enabled for the "public" setting. This data is visible in the dataview: @Windows - Firewall Status.

## Settings

| Detection String                                         | Comparator | Result | Applicable OS |
|---------------------------------------------------------|------------|--------|----------------|
| `\\\{%@netsh advfirewall show publicprofile state| find "State"@%}` | Contains   | ON     | Windows OS     |


