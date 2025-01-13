---
id: 'cwa-monitor-failed-patches'
title: 'Monitor for Failed Microsoft Patch Jobs'
title_meta: 'Monitor for Failed Microsoft Patch Jobs'
keywords: ['monitor', 'patch', 'failed', 'microsoft', 'jobs']
description: 'This document outlines a monitor designed to detect servers that have experienced five consecutive failed patches for Microsoft-based updates. It details the requirements for effective monitoring, including the necessity of having a minimum number of available patch jobs stored in the patchjobs table.'
tags: ['monitoring', 'patching', 'microsoft', 'servers', 'database']
draft: false
unlisted: false
---
## Summary

This monitor will detect servers that have had five failed patches in a row for Microsoft based patches. The number of patch jobs stored in the `patchjobs` table for that computer determines how well this monitor will work.

## Requirements

1. A machine must have at minimum 5 available patch jobs listed in the 'patchjobs' table.
2. Patch history must be set to allow for a minimum of 5 available patch jobs per computer to be stored in the 'patchjobs' table.

## Target

SQL query targets strictly the servers in a patching group.



