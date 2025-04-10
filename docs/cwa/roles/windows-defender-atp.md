---
id: 'e1284347-bbd4-4a41-af4c-f48188468bb6'
slug: /e1284347-bbd4-4a41-af4c-f48188468bb6
title: 'Windows Defender ATP'
title_meta: 'Windows Defender ATP'
keywords: ['windows', 'defender', 'atp', 'detection', 'security']
description: 'This document outlines a method to determine if Windows Defender Advanced Threat Protection (ATP) is enabled on a device. It includes settings and detection strings necessary for the evaluation.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines a method to determine if the device has Windows Defender ATP (Advanced Threat Protection) enabled.

## Settings

| Detection String                                                                 | Comparator | Result | Applicable OS |
|----------------------------------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SOFTWARE/Microsoft/Windows Advanced Threat Protection/Status:OnboardingState-%}` | Equals     | 1      | Windows OS     |


