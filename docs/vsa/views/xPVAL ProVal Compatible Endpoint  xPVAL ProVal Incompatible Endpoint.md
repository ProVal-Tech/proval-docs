---
id: '2e0182e6-a723-4b9d-a64b-93fbad74b870'
title: 'ProVal Compatibility Views for Agents'
title_meta: 'ProVal Compatibility Views for Agents'
keywords: ['proval', 'endpoint', 'compatibility', 'filter', 'vsa']
description: 'This document outlines two views to identify agents that are compatible or incompatible with ProVal content, detailing the necessary filters and dependencies for effective data collection.'
tags: []
draft: false
unlisted: false
---

# Summary

This document presents two views that categorize agents based on their compatibility with ProVal content.

# Dependencies

All content in [EPM - Data Collection - Solution - VSA Proval Script Compliance](<../../solutions/VSA Proval Script Compliancy.md>)

# View Filters

### xPVAL ProVal Compatible Endpoint

| Filter Name                       | Advanced Filter? | Filter Value   |
|-----------------------------------|------------------|----------------|
| xPVAL ProVal Compatible Endpoint   | Y                | "Compatible"   |

### xPVAL ProVal Incompatible Endpoint

| Filter Name                       | Advanced Filter? | Filter Value   |
|-----------------------------------|------------------|----------------|
| xPVAL ProVal Incompatible Endpoint | Y                | NOT "Compatible" |

