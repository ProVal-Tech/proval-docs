---
id: 'c038ca94-afba-473e-8f37-a24803be53e9'
slug: /c038ca94-afba-473e-8f37-a24803be53e9
title: 'Get - Last Reboot Time'
title_meta: 'Get - Last Reboot Time'
keywords: ['reboot', 'server', 'workstation', 'uptime', 'monitoring', 'threshold', 'alerting']
description: 'Alerts if a device has not been rebooted within a configurable number of days.'
tags: ['monitoring', 'reboot', 'alerting', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Summary

Alerts if a device (workstation or server) hasn't been rebooted within a configurable number of days (and optionally minutes). Designed for RMM automation to proactively flag devices that have exceeded their expected reboot cycle.

## Dependencies

- [Get-LastRebootTime](/docs/ab26f055-f420-4e35-8241-8f868c940b6d)

## Sample Run

![SampleRun1](../../../static/img/docs/c038ca94-afba-473e-8f37-a24803be53e9/script-run.webp)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `Get - Last Reboot Time`   

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance. 

3. Create Managed Variable
  - `<ThresholdDays>`
 
## Output

- Script Output

## Changelog

### 2026-07-23

- Initial version of the document.