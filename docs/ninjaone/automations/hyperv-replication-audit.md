---
id: 'd3e74048-d274-4fe7-8501-c826822707b2'
slug: /d3e74048-d274-4fe7-8501-c826822707b2
title: 'HyperV Replication Audit'
title_meta: 'HyperV Replication Audit'
keywords: ['hyper-v', 'backup', 'integration', 'replication']
description: 'This script validates that it is running on a Hyper-V host using the vmms service. If not a Hyper-V host, it exits cleanly. If Hyper-V is present, it checks replication health and flags `Critical` or `Warning` states.'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-05-11
---

## Overview

This script validates that it is running on a Hyper-V host using the vmms service. If not a Hyper-V host, it exits cleanly. 
If Hyper-V is present, it checks replication health and flags `Critical` or `Warning` states.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Type HyperV Replication in the search box and select the `HyperV Replication Audit` script
![SampleRun2](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image4.webp)

Click Run
![SampleRun3](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image5.webp)

## Dependencies

- [Script - HyperV Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2)
- [Solution - HyperV Replication Integration Alert](/docs/4deaf362-a762-4a05-9118-326edc7ff523)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/hyperv-replication-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-05-11

- Initial version of the document