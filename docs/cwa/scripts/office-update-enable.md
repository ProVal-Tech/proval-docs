---
id: '62b1555c-706c-433c-a053-329a63db0dd0'
slug: /62b1555c-706c-433c-a053-329a63db0dd0
title: 'Office Update Enable'
title_meta: 'Office Update Enable'
keywords: ['office', 'updates', 'registry', 'configuration', 'clicktorun']
description: 'This document explains how to enable Office updates by running a PowerShell command that modifies a specific registry value. The script updates the registry key to allow for automatic updates, saving time and ensuring that your Office applications are always up to date.'
tags: ['office365', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This script enables Office updates by running a PowerShell command.  

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/62b1555c-706c-433c-a053-329a63db0dd0/image_1.webp)

## Process

- Disables Office updates by running a PowerShell command that updates a registry value at `HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration` and sets the `UpdateEnabled` value to `True`.