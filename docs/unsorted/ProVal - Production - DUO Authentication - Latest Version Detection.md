---
id: '00d98e8b-1261-4f49-b5c0-6555a12afee8'
title: 'ProVal - Production - DUO Authentication - Latest Version Detection'
title_meta: 'ProVal - Production - DUO Authentication - Latest Version Detection'
keywords: ['duo', 'authentication', 'version', 'monitor', 'windows']
description: 'This document outlines the implementation of a monitor designed to fetch the latest version of the DUO Authentication application for Windows. It updates a system property with the latest version available through WinGet, ensuring that systems can identify outdated installations. The monitor is set to update monthly and is intended for global deployment.'
tags: ['software', 'update', 'windows']
draft: true
unlisted: false
---

## Summary

This monitor is created to fetch the latest version of the DUO Authentication application, with the package ID `DuoSecurity.Duo2FAAuthenticationforWindows`. The monitor will update a system property with the latest version available through WinGet to ensure the system can identify which machines are out of date. This system property will be updated monthly.

## Dependencies

[Application - Latest Version Detection [Winget]](../cwa/scripts/Application - Latest Version Detection Winget.md)

## Target

Global - Should be run without explicitly defined targets.

This script is specifically targeted to one machine to fetch the application's latest version.

## Implementation

1. Import the monitor using the ProSync Plugin.



