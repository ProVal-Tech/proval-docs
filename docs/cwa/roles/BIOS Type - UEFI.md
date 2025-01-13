---
id: 'cwa-track-uefi-bios'
title: 'Track Machines with UEFI BIOS Type'
title_meta: 'Track Machines with UEFI BIOS Type'
keywords: ['uefi', 'bios', 'detection', 'windows', 'machines']
description: 'This document provides a role definition for tracking machines that utilize UEFI BIOS type. It includes a detection string and settings for identifying applicable operating systems.'
tags: ['configuration', 'windows', 'security', 'report']
draft: false
unlisted: false
---
## Summary

This role definition helps you track down machines with UEFI BIOS type.

## Settings

| Detection String                       | Comparator    | Result | Applicable OS |
|----------------------------------------|---------------|--------|----------------|
| {%@bcdedit | find /i "path"@%}       | Regex Match   | .efi   | Windows        |



