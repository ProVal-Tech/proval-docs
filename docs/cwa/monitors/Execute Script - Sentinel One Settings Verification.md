---
id: 'a115d376-6bc5-4392-8407-a6a5448445cf'
title: 'Sentinel One Settings Verification Monitor'
title_meta: 'Sentinel One Settings Verification Monitor'
keywords: ['monitor', 'sentinel', 'settings', 'verification', 'script']
description: 'This document outlines a monitor that executes the Sentinel One Settings Verification script every 14 days on Windows and Macintosh computers with the Sentinel Agent installed, processing up to 100 machines per hour.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor runs the [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script once every 14 days against Windows and Macintosh computers with the Sentinel Agent application installed. It processes up to 100 machines per hour.

## Dependencies

[SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820)

## Target

Global

## Alert Template

**Name:** △ CUSTOM - Execute Script - Sentinel One Settings Verification

**Note:** Ensure to import the [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script before importing or creating the alert template, as the template should run this script.
