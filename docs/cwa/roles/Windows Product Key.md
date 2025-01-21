---
id: 'ce712ea7-ef0f-447a-b60b-a2c5891d7585'
title: 'Fetch Windows Product Key'
title_meta: 'Fetch Windows Product Key'
keywords: ['windows', 'product', 'key', 'fetch', 'regex']
description: 'This document outlines a role that utilizes PowerShell to retrieve the Windows Product key and verify its format, ensuring it adheres to the specified regex pattern. It includes detailed settings and applicable operating systems for effective implementation.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This role runs a PowerShell script to fetch the Windows Product key and matches it to ensure the key exists in the format `[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}`.

## Settings

| Detection String                                                                                   | Comparator    | Result                                        | Applicable OS |
|----------------------------------------------------------------------------------------------------|---------------|-----------------------------------------------|----------------|
| `%@C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "(Get-CimInstance -Query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"@%` | Regex Match   | `[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}` | Windows        |
