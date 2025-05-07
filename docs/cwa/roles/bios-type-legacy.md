---
id: 'e880c334-1062-405f-97ba-e80c2752fb28'
slug: /e880c334-1062-405f-97ba-e80c2752fb28
title: 'BIOS Type - Legacy'
title_meta: 'BIOS Type - Legacy'
keywords: ['legacy', 'bios', 'tracking', 'windows', 'detection']
description: 'This document provides a role definition to help identify and track machines that utilize legacy BIOS types, ensuring better management and updates for systems running Windows.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition helps you track machines with legacy BIOS types.

## Settings

| Detection String                     | Comparator     | Result | Applicable OS |
|--------------------------------------|----------------|--------|----------------|
| \{%@bcdedit | find /i "path"@%}     | Regex Match    | .exe   | Windows        |

