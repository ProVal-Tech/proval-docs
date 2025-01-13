---
id: 'vsa-windows-10-feature-upgrade-status'
title: 'Windows 10 Feature Upgrade Status Codes'
title_meta: 'Windows 10 Feature Upgrade Status Codes'
keywords: ['windows', 'upgrade', 'status', 'feature', 'script']
description: 'This document outlines the various status codes associated with the Windows 10 Feature Upgrade script, detailing what each status indicates regarding the upgrade process.'
tags: ['windows', 'upgrade', 'status', 'script']
draft: false
unlisted: false
---
# Syntax

| Field Value           | Description                                                  |
|-----------------------|--------------------------------------------------------------|
| Initiated             | Set when the Windows 10 Feature Upgrade script runs.        |
| Upgrade in Progress   | Set when the Windows 10 Feature Upgrade script completes successfully. |
| Never Run             | Set when installState = 0                                   |
| Failure               | Set when installState = 2                                   |
| Success               | Set when installState = 3                                   |
| Reboot Pending        | Set when installState = 1 and lastReboot is less than installDate. |



