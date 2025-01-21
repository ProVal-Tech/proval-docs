---
id: '43fcbb27-0955-4270-9460-33c5e8ccceef'
title: 'Monitor Battery Report for Computers'
title_meta: 'Monitor Battery Report for Computers - Automate Script'
keywords: ['monitor', 'battery', 'report', 'computers', 'script']
description: 'This document outlines a monitor that checks computers for battery report data, triggering a script to collect the latest battery information if the last scan was over 24 hours ago. It includes dependencies, target criteria, and an alert template for execution.'
tags: ['data-collection']
draft: false
unlisted: false
---

## Summary

This monitor checks twice a day, targeting only computers where the last battery report scan is greater than 24 hours ago and the last battery report returned data. It runs the [EPM - Data Collection - Automate - Script Get - Battery Report](<../scripts/EPM - Data Collection - Automate - Script Get - Battery Report.md>) script.

## Dependencies

- [EPM - Data Collection - Automate - Script Get - Battery Report](<../scripts/EPM - Data Collection - Automate - Script Get - Battery Report.md>)
- [EPM - Data Collection - Custom Table - plugin_proval_batteries](<../tables/plugin_proval_batteries.md>)
- [CWM - Automate - Script - Property - Set](<../scripts/Property - Set.md>)
- [EPM - Data Collection - Solution - Get-BatteryReport](https://proval.itglue.com/DOC-5078775-11149927)

## Target

The purpose of this monitor is to select all computers that have returned a valid battery report in the past or where the last scan was more than 24 hours ago. This monitor then triggers the Automate Get - Battery Report script to run on any device that meets these conditions.

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get-BatteryReport`

The alert template should run the [EPM - Data Collection - Automate - Script Get - Battery Report](<../scripts/EPM - Data Collection - Automate - Script Get - Battery Report.md>) script.
