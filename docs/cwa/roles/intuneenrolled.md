---
id: 'ec741594-23b2-4d0c-bf8d-337eefb44e83'
slug: /ec741594-23b2-4d0c-bf8d-337eefb44e83
title: 'IntuneEnrolled'
title_meta: 'IntuneEnrolled'
keywords: ['intune', 'enrollment', 'windows', 'machine', 'detection', 'role']
description: 'This document outlines the process for determining whether a Windows machine is enrolled in Intune, including the necessary detection string and implementation steps for importing the role into the system.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Summary

This role is responsible for determining whether a Windows machine is enrolled in Intune.

## Dependencies

- [Solution: Intune Enrollment for Entra Joined Devices](/docs/7446369f-7970-49d6-9edd-ac68378165b6)

## Settings

### Role Name 

- `IntuneEnrolled`

### Type

- `Intune`

### Sub-Type

- `Role`

### Detection String

- `{%@powershell.exe -NoLogo -NoProfile -Command "$ErrorActionPreference=\'SilentlyContinue\';$e=Get-ItemProperty \'HKLM:/SOFTWARE/Microsoft/Enrollments/*\' | Where-Object ProviderID -eq \'MS DM Server\' | Where-Object EnrollmentState -eq 1;@(\'False\',\'True\')[[bool]$e]"@%}`

### Comparator

- `Equals`

### Result

- `True`

### Applicable OS

- `Windows`

## Changelog

### 2026-10-27

- Detection now requires a completed Intune enrollment: an entry under `HKLM:\SOFTWARE\Microsoft\Enrollments` with `ProviderID` = `MS DM Server` and `EnrollmentState` = 1. The previous detection matched any enrollment entry with an `AADTenantID`, regardless of MDM provider or enrollment state, so incomplete enrollment attempts and other MDMs were detected as Intune enrolled.
- Comparator changed from Regex `[A-Z0-9]` to Contains `True`.
- Detection now runs `powershell.exe -NoLogo -NoProfile`.

### 2025-04-10

- Initial version of the document