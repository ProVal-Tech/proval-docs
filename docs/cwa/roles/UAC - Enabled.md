---
id: 'b9b05d9e-0b60-4a02-8dfc-5832e46386f2'
title: 'User Account Control Detection'
title_meta: 'User Account Control Detection'
keywords: ['user', 'account', 'control', 'detection', 'windows']
description: 'This document outlines the detection of User Account Control (UAC) settings on Windows 10 systems through specific registry checks performed by agents. It includes the detection string, comparator, result, and applicable operating systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
---
## Summary

This role is detected by agents where User Account Control is Enabled.

## Settings

| Detection String                                         | Comparator | Result | Applicable OS |
|---------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SOFTWARE/Microsoft/Windows/CurrentVersion/Policies/System:EnableLUA-%} | Equals     | 1      | Windows 10     |













