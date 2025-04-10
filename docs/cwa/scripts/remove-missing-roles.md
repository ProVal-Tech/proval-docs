---
id: '14815596-a4d5-4c53-95b8-149c6a043c58'
slug: /14815596-a4d5-4c53-95b8-149c6a043c58
title: 'Remove Missing Roles'
title_meta: 'Remove Missing Roles'
keywords: ['roles', 'machines', 'sql', 'database', 'automation']
description: 'This document describes a process for removing roles that are still listed on machines but are no longer detected. The automation saves approximately 5 minutes of manual effort by running a SQL query to delete these outdated roles from the database.'
tags: ['database', 'security']
draft: false
unlisted: false
---

## Summary

This document outlines a process to remove roles that are still listed on machines but are no longer detected on them.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Remove-Missing-Roles/image_1.png)

## Process

- The script runs a SQL query against the database to delete the roles from the machines that are still listed but no longer detected on them.


