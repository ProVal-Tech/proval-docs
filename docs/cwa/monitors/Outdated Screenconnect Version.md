---
id: 'f3fa89f2-9c7a-44ab-a6d9-14a37b205e7d'
title: 'Monitor for ScreenConnect Agent Version'
title_meta: 'Monitor for ScreenConnect Agent Version'
keywords: ['screenconnect', 'monitor', 'version', 'agent', 'update']
description: 'This document outlines a monitor that detects online machines where the ScreenConnect agent is not on the latest version. It requires at least one agent to be updated manually to the latest version to enable detection of other machines. The document also includes dependencies and ticketing information.'
tags: ['ticketing', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will detect the online machines where the ScreenConnect agent is not on the latest version.

**Note**: At least one agent must be updated manually to the latest ScreenConnect version in order to detect the other machines.

## Dependencies

[CWM - Control - Script - Update ScreenConnect Version](<../scripts/Update Screenconnect Version.md>) (This script should be run as an autofix with the monitor)  
Use alert template ~Autofix - Update ScreenConnect Version with the monitor

## Target

Globally (both on Windows and Mac machines)

## Ticketing

The tickets will be created by the [CWM - Control - Script - Update ScreenConnect Version](<../scripts/Update Screenconnect Version.md>) script.
