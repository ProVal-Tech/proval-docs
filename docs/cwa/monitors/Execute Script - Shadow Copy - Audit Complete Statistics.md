---
id: 'ef826863-c354-4a97-9ba8-8ad2a3c65e40'
slug: /ef826863-c354-4a97-9ba8-8ad2a3c65e40
title: 'Execute Script - Shadow Copy - Audit Complete Statistics'
title_meta: 'Execute Script - Shadow Copy - Audit Complete Statistics'
keywords: ['monitor', 'shadow', 'copy', 'audit', 'statistics', 'custom', 'rawsql', 'windows']
description: 'This document outlines a custom RAWSQL monitor designed to detect machines where the Shadow Copy Audit Complete Statistics script did not run in the last 7 days. The monitor is configured to trigger alerts for a maximum of 50 agents at a time within an hour, ensuring efficient monitoring and management of shadow copy operations.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This Custom RAWSQL monitor detects machines where the [Script - Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>) didn't run in the last 7 days. It is also limited to trigger alerts for 50 agents at a time within an hour.

## Dependencies

[Custom Table - plugin_proval_shadowcopystats](<../tables/plugin_proval_shadowcopystats.md>)

## Target

Windows Group


