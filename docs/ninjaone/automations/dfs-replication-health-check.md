---
id: '6ef623c1-b1aa-4019-9f1e-70ca04694a56'
slug: /6ef623c1-b1aa-4019-9f1e-70ca04694a56
title: 'DFS Replication Health Check'
title_meta: 'DFS Replication Health Check'
keywords: ['dfs','health','replication']
description: 'Checks for recent DFS Replication errors or warnings within the last hour and reports the current replication state to identify potential sync or replication issues.'
tags: ['auditing','eventlogs','windows']
draft: false
unlisted: false
---

## Overview
This Automation checks for recent DFS Replication errors or warnings within the last hour and reports the current replication state to identify potential sync or replication issues.

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)
Search and select `DFS Replication Health Check`
![Image1](../../../static/img/docs/6ef623c1-b1aa-4019-9f1e-70ca04694a56/image1.webp)

Set the required arguments and click the `Run` button to run the script.  
**Run As:** `System`  
**Preset Parameter:** `<Leave it Blank>`  
![Image2](../../../static/img/docs/6ef623c1-b1aa-4019-9f1e-70ca04694a56/image2.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies
- [Solution - DFS Replication Health Check](/docs/9fd6046b-e670-4204-b140-b84c268aefe7)
- [Compound Condition - DFS Replication Health Check](/docs/0fab1e4b-7bbb-4939-87e1-792cdcea49e4)
- [CW Manage Ticket Template - P2 - Major](/docs/6e35ca8b-0400-40ec-b33b-d5f642979258)


## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/dfs-replication-health-check.ps1)
