---
id: 'e868b055-6f03-438c-a4d3-33a100317fb5'
slug: /e868b055-6f03-438c-a4d3-33a100317fb5
title: 'Office Update Disable'
title_meta: 'Office Update Disable'
keywords: ['office', 'updates', 'registry', 'configuration', 'clicktorun']
description: 'This document explains how to use a PowerShell script to disable Office updates by modifying a registry value. The process is straightforward and saves time by automating the update disabling procedure.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script disables Office updates by running a PowerShell command.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/e868b055-6f03-438c-a4d3-33a100317fb5/image_1.png)

## Process

- Disables Office updates by running a PowerShell command that updates a registry value at `HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration` and sets the `UpdateEnabled` value to `False`.

