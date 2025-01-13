---
id: 'cwa-windows-defender-atp-check'
title: 'Windows Defender ATP Check'
title_meta: 'Windows Defender ATP Check'
keywords: ['windows', 'defender', 'atp', 'detection', 'security']
description: 'This document outlines a method to determine if Windows Defender Advanced Threat Protection (ATP) is enabled on a device. It includes settings and detection strings necessary for the evaluation.'
tags: ['security', 'windows', 'configuration', 'detection']
draft: false
unlisted: false
---
## Summary

This role will determine if the device has Windows Defender ATP (Advanced Threat Protection) enabled.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status:OnboardingState-%}` | Equals     | 1      | Windows OS     |



