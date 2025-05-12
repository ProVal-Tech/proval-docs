---
id: '78894edc-a152-4fc0-a66f-d208b98125cb'
slug: /78894edc-a152-4fc0-a66f-d208b98125cb
title: 'WMI Enabled'
title_meta: 'WMI Enabled'
keywords: ['wmi', 'detection', 'windows', 'status', 'operatingsystem']
description: 'This document provides information on detecting the WMI status on machines where WMI is enabled, including the applicable settings and detection strings for Windows operating systems.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This role is detected on machines on which WMI is enabled.

## Settings

| Detection String                                         | Comparator | Result      | Applicable OS |
|---------------------------------------------------------|------------|-------------|---------------|
| \{%@wmic path win32_operatingsystem get status /value@%} | Contains   | Status=OK   | Windows       |