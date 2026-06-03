---
id: 'd3e74048-d274-4fe7-8501-c826822707b2'
slug: /d3e74048-d274-4fe7-8501-c826822707b2
title: 'Hyper-V Replication Audit'
title_meta: 'Hyper-V Replication Audit'
keywords: ['hyper-v', 'backup', 'integration', 'replication']
description: 'If the system is not a Hyper-V host, the script records `NotAHyperVHost` and exits successfully. If Hyper-V is present, the script evaluates replication status for all VMs where replication is enabled. The script flags VMs that have replication states indicating issues, specifically `Critical` or `Warning`. If any VM is found in an unhealthy replication state, the script reports the affected VMs and sets a failure exit code. If all replication-enabled VMs are healthy, it reports `Healthy`.'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Overview

If the system is not a Hyper-V host, the script records 'NotAHyperVHost'
and exits successfully.
If Hyper-V is present, the script evaluates replication status for all VMs
where replication is enabled.
The script flags VMs that have replication states indicating issues,
specifically 'Critical' or 'Warning'.
If any VM is found in an unhealthy replication state, the script reports
the affected VMs and sets a failure exit code. If all replication-enabled
VMs are healthy, it reports 'Healthy'.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Type Hyper-V Replication in the search box and select the `Hyper-V Replication Audit` script
![SampleRun2](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image4.webp)

Click Run  
![SampleRun3](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image5.webp)

## Dependencies

- [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2)
- [Solution - Hyper-V Replication Integration Alert](/docs/4deaf362-a762-4a05-9118-326edc7ff523)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/hyperv-replication-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-06-03

- Initial version of the document