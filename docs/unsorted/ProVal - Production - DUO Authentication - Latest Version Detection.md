---
id: 'cwa-duo-authentication-monitor'
title: 'Duo Authentication Version Monitor'
title_meta: 'Duo Authentication Version Monitor'
keywords: ['duo', 'authentication', 'version', 'monitor', 'windows']
description: 'This document outlines the implementation of a monitor designed to fetch the latest version of the DUO Authentication application for Windows. It updates a system property with the latest version available through WinGet, ensuring that systems can identify outdated installations. The monitor is set to update monthly and is intended for global deployment.'
tags: ['update', 'monitor', 'windows', 'software']
draft: true
unlisted: true
---
## Summary

This monitor is created to fetch the latest version of the DUO Authentication, with the packageID = `DuoSecurity.Duo2FAAuthenticationforWindows`. The monitor will update a system property with the latest version available through WinGet to ensure the system is able to tell what machines are out of date. This system property will get updated Monthly.

## Dependencies

[Application - Latest Version Detection [Winget]](https://proval.itglue.com/DOC-5078775-14466237)

## Target

Global - Should be run without explicitly defined targets.

This script is only targeted to one machine to fetch the Application's latest version.

## Implementation

1. Import the monitor using the ProSync Plugin.



