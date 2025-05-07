---
id: '84db74c7-4a58-477f-ad48-50062a8f4724'
slug: /84db74c7-4a58-477f-ad48-50062a8f4724
title: 'Successful Patch Jobs'
title_meta: 'Successful Patch Jobs'
keywords: ['patch', 'jobs', 'tickets', 'time', 'accounting']
description: 'This document describes an enhanced version of the default "Successful Patch Jobs" script, which accurately tracks the time taken by patch jobs in tickets. The improved script addresses the limitations of the default version by ensuring the exact duration is recorded, rather than a fixed time of 15 minutes.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This script is a function script and is the enhanced version of the default "Successful Patch Jobs." The default script was unable to accurately add the time taken by the patch jobs in the tickets. This enhanced script records the exact time taken by the patch job into the patching tickets, rather than the default fixed time of 15 minutes.

## Sample Run

This script is a function script called from [Patch Accounting](/docs/53163c7a-3281-4825-ba22-4e22c8c5b35e).

## Dependencies

| Property                   | Value |
|---------------------------|-------|
| _sysPatchAcctTimeToBill   | 1     |

