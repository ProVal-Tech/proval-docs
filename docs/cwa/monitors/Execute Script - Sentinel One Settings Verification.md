---
id: 'cwa-sentinel-one-settings-verification'
title: 'Sentinel One Settings Verification Monitor'
title_meta: 'Sentinel One Settings Verification Monitor'
keywords: ['monitor', 'sentinel', 'settings', 'verification', 'script']
description: 'This document outlines a monitor that executes the Sentinel One Settings Verification script every 14 days on Windows and Macintosh computers with the Sentinel Agent installed, processing up to 100 machines per hour.'
tags: ['configuration', 'software', 'windows', 'macintosh', 'alert']
draft: false
unlisted: false
---
## Summary

This monitor runs [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script once per 14 days against the Windows and Macintosh computers with the Sentinel Agent application installed. It runs the script against 100 machines per hour.

## Dependencies

[SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820)

## Target

Global

## Alert Template

Name: △ CUSTOM - Execute Script - Sentinel One Settings Verification

Note* - Ensure to import [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script before importing/creating the alert template as the template should run this script.



