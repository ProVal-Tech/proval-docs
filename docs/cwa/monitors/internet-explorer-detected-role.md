---
id: '1c9a68c5-62c9-4454-a6da-0a7c5fb8089d'
slug: /1c9a68c5-62c9-4454-a6da-0a7c5fb8089d
title: 'Internet Explorer Detected Role'
title_meta: 'Internet Explorer Detected Role'
keywords: ['monitor', 'internet', 'explorer', 'disable', 'alert']
description: 'This document outlines a monitoring solution that detects online machines with Internet Explorer installed by checking if the "Internet Explorer Installed" role is enabled. It includes an alert template for autofixing the issue and provides SQL query details for limiting the target to relevant computers.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This monitor will detect online machines where Internet Explorer is installed by identifying the machines where the "Internet Explorer Installed" role is enabled.

**Alert Template:** Autofix - Disable Internet Explorer

## Dependencies

- [CWM - Automate - Script - Internet Explorer - Disable [Global, DV, Autofix]](/docs/60cf67bf-fc28-4461-a2ad-7a32b2461652)
- [CWM - Automate - Role - Internet Explorer Installed](/docs/c48b8ff6-9189-49b2-bd2a-442fb26e7bbe)

## Target

The SQL query limits the results to computers where the "Internet Explorer Installed" role is present.