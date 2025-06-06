---
id: '621e8dcc-3405-47e6-b1e6-d9190971e8ee'
slug: /621e8dcc-3405-47e6-b1e6-d9190971e8ee
title: 'Hyper-V Checkpoint Expiration Alert'
title_meta: 'Hyper-V Checkpoint Expiration Alert'
keywords: ['hyper-v', 'hypervisor', 'checkpoint', 'backup', 'expire']
description: 'This will get information about the current number of Hyper-V checkpoints there are on a given machine and based on it if detected older checkpoint then it creates ticket'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
---

## Purpose
This solution is built to get information about the current number of Hyper-V checkpoints on a given machine and based on it, if it detects an older checkpoint then it creates a ticket

## Associated Content

| Name                                | Type               | Function                                                                                                      |
|-------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------|
| [Script - Hyper-V - Checkpoint Expiration Alert](/docs/e2ab9b55-fbd3-4be9-801c-51b813b4bd13) | Script             | Retrieves information about the current number of Hyper-V checkpoints on a machine. A threshold in days can be specified directly or obtained from an integer custom field. |
| [Compound Condition - Hyper-V - Checkpoint Expiration Alert](/docs/4255caf3-73bb-434b-a612-fb1e76f2a10a) | Compound Conditions| Creates a ticket if a Hyper-V checkpoint is detected that is older than the specified threshold in days.     |


## Implementation

- Create the [Automation - Hyper-V - Checkpoint Expiration Alert](/docs/e2ab9b55-fbd3-4be9-801c-51b813b4bd13) using the implementation instruction provided in the document.  
- Create the [Compound Condition - Hyper-V - Checkpoint Expiration Alert](/docs/4255caf3-73bb-434b-a612-fb1e76f2a10a) using the implementation instruction provided in the document.


## FAQ

- This solution is built to alert for the older Hyper-V Checkpoints only.