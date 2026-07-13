---
id: 'f388492a-aeba-44da-9d08-09888e77ea58'
slug: /f388492a-aeba-44da-9d08-09888e77ea58
title: 'Hyper-V Replication Audit'
title_meta: 'Hyper-V Replication Audit'
keywords: ['hyper-v', 'replication', 'audit']
description: 'Monitors Hyper-V Replica health status, logs replication activity, and generates Windows Event Log alerts for Kaseya VSA monitoring.'
tags: ['auditing', 'hyper-v', 'eventlogs', 'kaseya']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This script continuously checks Hyper-V replication health, identifies Warning and Critical issues, and logs monitoring activity for troubleshooting and historical tracking. Its event-based monitoring allows alerts to be generated only when Hyper-V replication health changes to an unhealthy state.

This monitoring process runs automatically every 15 minutes via Windows Task Scheduler.

## Sample Run

![Image](../../../static/img/docs/f388492a-aeba-44da-9d08-09888e77ea58/script-run.webp) 

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `Hyper-V Replication Audit`   
   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the `HVReplCheck.ps1` from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `HVReplCheck.ps1`  

![Image](../../../static/img/docs/f388492a-aeba-44da-9d08-09888e77ea58/managed-files.webp) 

4. Map the `HVReplCheck.ps1` into the `12th` step of the script in the client's environment.

## Output

- Script Logs
- `C:\ProgramData\_Automation\Script\HVReplication\HVReplCheck.log`

## Changelog

### 2026-07-13

- Initial version of the document.
