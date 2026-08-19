---
id: 'e239e458-56e6-4859-ab30-a7592366b824'
slug: /e239e458-56e6-4859-ab30-a7592366b824
title: 'BSOD Monitoring'
title_meta: 'BSOD Monitoring'
keywords: ['BSOD', 'bluescreen', 'crashdump']
description: 'checks the Windows System event log for BSOD-related events (Event IDs 41, 1001, and 6008) within the configured monitoring period.'
tags: ['bluescreen', 'alerting', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-07-21
---

## Summary

Reads the BSOD monitoring configuration from the local JSON file created by the BSOD Monitoring Configuration Writer task. It checks the Windows System event log for BSOD-related events (Event IDs 41, 1001, and 6008) within the configured monitoring period. If the number of detected events exceeds the configured threshold, the monitor reports a failure; otherwise, it returns a healthy status.

### How It Works

1. **Configuration File**  
   At each check interval, the monitor reads the file `C:\ProgramData\_Automation\Script\BSODMonitoring\BSODMonitoring.json`. This file contains two values:

   * **Threshold** – the maximum number of BSOD-related events allowed before an alert is generated.
   * **Days** – the number of previous days to search the Windows System event log.

2. **BSOD Event Monitoring**  
   The monitor scans the Windows **System** event log for the following BSOD-related events within the configured time period:

   * **Event ID 41** – Kernel-Power (unexpected shutdown or restart).
   * **Event ID 1001** – BugCheck (Blue Screen of Death).
   * **Event ID 6008** – Unexpected shutdown.

3. **Threshold Evaluation**  
   The total number of matching events is compared against the configured **Threshold**.

   * **If the event count exceeds the threshold:** The monitor generates a failure.
   * **If the event count is within the threshold:** The monitor reports a healthy status.

4. **Alert & Resolution**  
   When a failure occurs, the monitor outputs the number of BSOD-related events detected during the configured monitoring period. Once the event count falls back within the configured threshold, the monitor returns a healthy status, allowing the monitor set to automatically resolve the alert if automatic resolution is enabled.


## Dependencies

- [Solution: BSOD Monitoring](/docs/fc85a090-94c2-4f91-8055-9c8e52d91ad1)
- [Task : BSOD Monitoring Configuration Writer](/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

- **Name:** `BSOD Monitoring`  
- **Description:** `Reads the BSOD monitoring configuration from the local JSON file created by the BSOD Monitoring Configuration Writer task. It checks the Windows System event log for BSOD-related events (Event IDs 41, 1001, and 6008) within the configured monitoring period. If the number of detected events exceeds the configured threshold, the monitor reports a failure; otherwise, it returns a healthy status.`  
- **Type:** `Script`  
- **Severity:** `Others`  
- **Family:** `Desktop Health`

![Image1](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `[Group : BSOD Monitoring](/docs/607ed709-2b00-4f6c-a1aa-6d234d0a5c0e)`

![Image2](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image2.webp)

## Conditions

- **Run script on:** `Schedule`  
- **Repeat every:** `24` `Hour(s)`  
- **Script Language:** `PowerShell`  
- **Use Generative AI Assist for script creation:** `False`  

- **PowerShell Script Editor:**  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/monitors/bsod-monitoring/script.ps1)



- **Criteria:**  `Contains`  
- **Operator:** `AND`  
- **Script Output:**  `Fail - Found`   
- **Escalate ticket on script failure:** `Disabled`  
- **Add Automation:**  `<Leave it untouched>`

![Image3](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image3.webp)

## Ticket Resolution

- **Automatically Resolve:** `Enabled`  
- **Dropdown Option:** `Run same script as above`
- **Criteria:**  `Contain`  
- **Operator:** `AND`  
- **Script Output:**  `PASS - Found`  

![Image4](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image4.webp)

## Monitor Output

**Output:** `Generate Ticket`

![Image5](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/e239e458-56e6-4859-ab30-a7592366b824/image6.webp)

## Changelog

### 2026-07-21

- Initial version of the document
