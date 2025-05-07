---
id: '54992d2f-f374-41bb-9f61-e4d2fcc93478'
slug: /54992d2f-f374-41bb-9f61-e4d2fcc93478
title: '5 Consecutive Patch Jobs Failed'
title_meta: '5 Consecutive Patch Jobs Failed'
keywords: ['monitor', 'patch', 'failed', 'microsoft', 'jobs']
description: 'This document outlines a monitor designed to detect servers that have experienced five consecutive failed patches for Microsoft-based updates. It details the requirements for effective monitoring, including the necessity of having a minimum number of available patch jobs stored in the patchjobs table.'
tags: ['database', 'patching']
draft: false
unlisted: false
---

## Summary

This monitor will detect servers that have had five failed patches in a row for Microsoft-based patches. The number of patch jobs stored in the `patchjobs` table for that computer determines how well this monitor will work.

## Requirements

1. A machine must have a minimum of 5 available patch jobs listed in the `patchjobs` table.
2. Patch history must be configured to allow for a minimum of 5 available patch jobs per computer to be stored in the `patchjobs` table.

## Target

The SQL query targets only the servers in a patching group.

