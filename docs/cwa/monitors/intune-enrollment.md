---  
id: 'f2f953b8-9620-40ad-a37c-6eaa4e5c47f1'
slug: /f2f953b8-9620-40ad-a37c-6eaa4e5c47f1
title: 'Intune Enrollment'
title_meta: 'Intune Enrollment'
keywords: ['intune', 'enrollment', 'windows', 'machine', 'detection', 'role']
description: 'This monitor is built to detect the agent that is Entra Joined and doesn''t have the Intune enrolled.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---
## Summary

This monitor is built to detect the agent that is Entra Joined and doesn't have Intune enrolled.
This depends on EDF `Deploy Intune Enrollment` being checked at the client level, whereas the EDFs `Exclude Intune Enrollment` should not be checked at the location or computer level.

## Dependencies

- [Solution: Intune Enrollment for Entra Joined Devices](/docs/7446369f-7970-49d6-9edd-ac68378165b6)

## Target

- Global

## Alert Template

- `△ Custom - Execute Script - Intune Enrollment`

## Changelog

### 2026-10-27

- Initial version of the document
