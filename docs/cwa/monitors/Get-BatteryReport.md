---
id: '43fcbb27-0955-4270-9460-33c5e8ccceef'
slug: /43fcbb27-0955-4270-9460-33c5e8ccceef
title: 'Get-BatteryReport'
title_meta: 'Get-BatteryReport'
keywords: ['monitor', 'battery', 'report', 'computers', 'script']
description: 'This document outlines a monitor that checks computers for battery report data, triggering a script to collect the latest battery information if the last scan was over 24 hours ago. It includes dependencies, target criteria, and an alert template for execution.'
tags: ['data-collection']
draft: false
unlisted: false
---

## Summary

This monitor checks twice a day, targeting only computers where the last battery report scan is greater than 24 hours ago and the last battery report returned data. It runs the [EPM - Data Collection - Automate - Script Get - Battery Report](/docs/59738aa7-5495-4e4d-a36a-cc8af2643865) script.

## Dependencies

- [EPM - Data Collection - Automate - Script Get - Battery Report](/docs/59738aa7-5495-4e4d-a36a-cc8af2643865)
- [EPM - Data Collection - Custom Table - plugin_proval_batteries](/docs/5507c4d8-9cfc-4d67-9c84-7cbad5a37de1)
- [CWM - Automate - Script - Property - Set](/docs/2b64bf00-b8b2-499b-b9d2-70d218f18cfb)
- [EPM - Data Collection - Solution - Get-BatteryReport](/docs/701fd9e6-617a-49a0-8368-531ec189e44c)

## Target

The purpose of this monitor is to select all computers that have returned a valid battery report in the past or where the last scan was more than 24 hours ago. This monitor then triggers the Automate Get - Battery Report script to run on any device that meets these conditions.

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get-BatteryReport`

The alert template should run the [EPM - Data Collection - Automate - Script Get - Battery Report](/docs/59738aa7-5495-4e4d-a36a-cc8af2643865) script.



