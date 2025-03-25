---
id: 'c4083ace-8763-4fdd-8d0c-b7fd93e30401'
slug: /c4083ace-8763-4fdd-8d0c-b7fd93e30401
title: 'DUO Authentication - Latest Version Detection'
title_meta: 'DUO Authentication - Latest Version Detection'
keywords: ['duo', 'authentication', 'version', 'monitor', 'windows', 'winget']
description: 'This document outlines the implementation of a monitor designed to fetch the latest version of DUO Authentication for Windows. It updates a system property with the latest version available through WinGet, allowing systems to identify outdated installations. The monitor is intended for global use and updates monthly.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor is created to fetch the latest version of the DUO Authentication, with the package ID `DuoSecurity.Duo2FAAuthenticationforWindows`. The monitor will update a system property with the latest version available through WinGet to ensure the system can identify which machines are out of date. This system property will be updated monthly.

## Dependencies

[Application - Latest Version Detection [Winget]](<../scripts/Application - Latest Version Detection Winget.md>)

## Target

Global - Should be run without explicitly defined targets.

This script is only targeted to one machine to fetch the application's latest version.

## Implementation

1. Import the monitor using the ProSync Plugin.


