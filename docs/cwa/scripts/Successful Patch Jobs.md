---
id: '84db74c7-4a58-477f-ad48-50062a8f4724'
title: 'Enhanced Successful Patch Jobs Script'
title_meta: 'Enhanced Successful Patch Jobs Script for Accurate Time Tracking'
keywords: ['patch', 'jobs', 'tickets', 'time', 'accounting']
description: 'This document describes an enhanced version of the default "Successful Patch Jobs" script, which accurately tracks the time taken by patch jobs in tickets. The improved script addresses the limitations of the default version by ensuring the exact duration is recorded, rather than a fixed time of 15 minutes.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This script is a function script and is the enhanced version of the default "Successful Patch Jobs." The default script was unable to accurately add the time taken by the patch jobs in the tickets. This enhanced script records the exact time taken by the patch job into the patching tickets, rather than the default fixed time of 15 minutes.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Patch Accounting](./Patch%20Accounting.md).

## Dependencies

| Property                   | Value |
|---------------------------|-------|
| _sysPatchAcctTimeToBill   | 1     |

