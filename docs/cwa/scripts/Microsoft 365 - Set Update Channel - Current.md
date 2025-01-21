---
id: '68e362d9-521f-417b-93e3-81adc169b559'
title: 'Microsoft 365 Update Registry Script'
title_meta: 'Microsoft 365 Update Registry Script'
keywords: ['microsoft', '365', 'update', 'registry', 'channel']
description: 'This document outlines a script that modifies the registry to enable regular updates for Microsoft 365 products according to the current channel updates. It also executes a follow-up script to update version information in the relevant audit data view.'
tags: ['office365', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This script will make changes in the registry and allow Microsoft 365 products to update on a regular basis as per current channel updates.

It will execute the [Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) at the end of a successful run to update the information in the [Dataview - C2R Office Version Audit](<../dataviews/C2R Office Version Audit.md>).

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Microsoft-365---Set-Update-Channel---Current/image_1.png)

## Dependencies

- Office installed on the target machine

## Output

- Script log
