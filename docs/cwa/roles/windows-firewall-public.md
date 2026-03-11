---
id: '984edd72-ce3d-4817-9628-74100ef83865'
slug: /984edd72-ce3d-4817-9628-74100ef83865
title: 'Windows Firewall Public'
title_meta: 'Windows Firewall Public'
keywords: ['firewall', 'windows', 'public', 'security']
description: 'This document outlines the process to determine if the Windows Firewall is enabled to the "public" setting. The data can be accessed through the dataview: @Windows - Firewall Status, providing insights into the firewall configuration for security purposes.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This document outlines the process to determine if the Windows Firewall is enabled for the "public" setting. This data is visible in the dataview: @Windows - Firewall Status.

## Settings

| Detection String                                         | Comparator | Result | Applicable OS |
|---------------------------------------------------------|------------|--------|----------------|
| `\\\{%@netsh advfirewall show publicprofile state| find "State"@%}` | Contains   | ON     | Windows OS     |

## Changelog

### 2025-04-10

- Initial version of the document
