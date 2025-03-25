---
id: 'a115d376-6bc5-4392-8407-a6a5448445cf'
slug: /a115d376-6bc5-4392-8407-a6a5448445cf
title: 'Execute Script - Sentinel One Settings Verification'
title_meta: 'Execute Script - Sentinel One Settings Verification'
keywords: ['monitor', 'sentinel', 'settings', 'verification', 'script']
description: 'This document outlines a monitor that executes the Sentinel One Settings Verification script every 14 days on Windows and Macintosh computers with the Sentinel Agent installed, processing up to 100 machines per hour.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor runs the [SWM - Software Configuration - Script - Sentinel One Settings Verification](<../scripts/Sentinel One Settings Verification.md>) script once every 14 days against Windows and Macintosh computers with the Sentinel Agent application installed. It processes up to 100 machines per hour.

## Dependencies

[SWM - Software Configuration - Script - Sentinel One Settings Verification](<../scripts/Sentinel One Settings Verification.md>)

## Target

Global

## Alert Template

**Name:** △ CUSTOM - Execute Script - Sentinel One Settings Verification

**Note:** Ensure to import the [SWM - Software Configuration - Script - Sentinel One Settings Verification](<../scripts/Sentinel One Settings Verification.md>) script before importing or creating the alert template, as the template should run this script.



