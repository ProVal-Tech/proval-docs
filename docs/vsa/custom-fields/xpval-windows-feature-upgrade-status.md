---
id: '1b448856-c7d6-4aed-8080-474f5650a070'
slug: /1b448856-c7d6-4aed-8080-474f5650a070
title: 'xPVAL Windows Feature Upgrade Status'
title_meta: 'xPVAL Windows Feature Upgrade Status'
keywords: ['windows', 'upgrade', 'status', 'feature', 'script']
description: 'This document outlines the various status codes associated with the Windows 10 Feature Upgrade script, detailing what each status indicates regarding the upgrade process.'
tags: ['windows']
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