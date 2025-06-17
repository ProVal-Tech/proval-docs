---
id: '5ed684a9-85c9-4359-9594-c0dc8184f949'
slug: /5ed684a9-85c9-4359-9594-c0dc8184f949
title: 'SentinelOne Uninstall [Param]'
title_meta: 'SentinelOne Uninstall [Param, Reboot]'
keywords: ['SentinelOne', 'Antivirus', 'Security', 'Uninstallation', 'S1']
description: 'This script uninstall the Sentinel using the agnostic "Remove-SentinelOne.ps1" script.'
tags: ['uninstallation', 'antivirus', 'security']
draft: false
unlisted: false
---

## Summary
This script uninstall the Sentinel using the agnostic "Remove-SentinelOne.ps1" script. If the script fails to remove SentinelOne, it will force a reboot when no user is logged in. And when a user is found to be logged in, it will enable the Reboot Flag.

## Sample Run

![Sample Run 1](../../../static/img/docs/remove-sentinelone/Image3.png)

![Sample Run 2](../../../static/img/docs/remove-sentinelone/Image2.png)

## User Parameters

| Name               | Example                                                         | Mandatory | Description                                                                                                                                                                                                                   |
|--------------------|-----------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PassPhrase               | xxxxxxxx-xxxx-xxxx-xxxxxxxx                | False      | Passphrase for disabling anti-tampering                                 |


## Ticketing

It is optional and gets enabled if the script called using monitor and the monitor gets the ticket category set to record the automation.

**Subject:** `SW - Sentinel Agent Uninstallation Failed on %computername%`

**Body:**  
`Failed to uninstall the Sentinel Agent. Refer to the logs: @ErrorLog@`

OR 

`Failed to execute the powershell script. A security application or Antivirus Programme seems to be restricting the script execution.`

## Output

- Script Logs
- Log file on the end machine
