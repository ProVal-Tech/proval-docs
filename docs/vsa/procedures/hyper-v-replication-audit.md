---
id: 'f388492a-aeba-44da-9d08-09888e77ea58'
slug: /f388492a-aeba-44da-9d08-09888e77ea58
title: 'Hyper V Replication Audit'
title_meta: 'Hyper V Replication Audit'
keywords: ['hyper-v', 'replication', 'audit']
description: 'Monitors Hyper-V Replica health status, logs replication activity, and generates Windows Event Log alerts for Kaseya VSA monitoring.'
tags: ['auditing', 'hyper-v', 'eventlogs', 'kaseya']
draft: false
unlisted: false
last_update:
  date: 2026-07-10
---

## Summary

- Monitors Hyper-V Replica health status, detects replication issues, and records monitoring activity in local logs. 

- Generates Windows Event Log alerts for Warning/Critical replication states and integrates with Kaseya VSA for automated monitoring and alerting. 

- Runs automatically through Windows Task Scheduler under the SYSTEM account every 15 minutes to provide continuous Hyper-V replication monitoring.

## Sample Run

![Image](../../../static/img/docs/f388492a-aeba-44da-9d08-09888e77ea58/script-run.webp) 

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** Hyper V Replication Audit  

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

### 2026-07-10

- This is initial version.
