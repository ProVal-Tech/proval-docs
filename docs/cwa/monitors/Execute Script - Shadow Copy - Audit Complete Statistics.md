---
id: 'cwa-custom-rawsql-monitor-shadow-copy-audit'
title: 'Custom RAWSQL Monitor for Shadow Copy Audit'
title_meta: 'Custom RAWSQL Monitor for Shadow Copy Audit'
keywords: ['monitor', 'shadow', 'copy', 'audit', 'statistics', 'custom', 'rawsql', 'windows']
description: 'This document outlines a custom RAWSQL monitor designed to detect machines where the Shadow Copy Audit Complete Statistics script did not run in the last 7 days. The monitor is configured to trigger alerts for a maximum of 50 agents at a time within an hour, ensuring efficient monitoring and management of shadow copy operations.'
tags: ['monitoring', 'windows', 'custom', 'statistics', 'alert']
draft: false
unlisted: false
---
## Summary

This Custom RAWSQL monitor detects machines where the [Script - Shadow Copy - Audit Complete Statistics [DV]](https://proval.itglue.com/DOC-5078775-7751337) didn't run in the last 7 days. It is also limited to trigger 50 agents at a time in an hour.

## Dependencies

[Custom Table - plugin_proval_shadowcopystats](https://proval.itglue.com/DOC-5078775-8157668)

## Target

Windows Group


