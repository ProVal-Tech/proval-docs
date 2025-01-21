---
id: '05f60b47-188b-4383-9e9c-98780ba6e488'
title: 'Autofix Script for Patch Monitoring'
title_meta: 'Autofix Script for Patch Monitoring'
keywords: ['autofix', 'monitor', 'patch', 'scan', 'service']
description: 'This document outlines the Autofix script designed for monitoring patch statuses. It details the script function, dependencies, process steps, and how to run it manually. The script checks the status of patch scans and attempts to resolve issues by resending patches and managing service states.'
tags: []
draft: false
unlisted: false
---

## Summary

This script is an Autofix script meant to be called from the monitor [ProVal - Development - Last scanned patch date > 7 days](<../monitors/Last Scanned Patch Date 7 days.md>).

## Sample Run

This script was designed to be called from a monitor.

To run this script manually, please see the screenshots below.

![Screenshot](../../../static/img/Repair-Failing-Patch-Scans/image_1.png)

In the Advanced Settings → Parameters area, please enter the following string of text:

```
@status@=FAILED
```

![Screenshot](../../../static/img/Repair-Failing-Patch-Scans/image_2.png)

This will allow the script to be run manually instead of being called by the monitor.

## Dependencies

This Autofix script is called by the monitor [ProVal - Development - Last scanned patch date > 7 days](<../monitors/Last Scanned Patch Date 7 days.md>).

## Variables

- `%lastcmdoutput%` - This variable is used to review the data returned from the Resend Patch information commands.

## Process

1. The script will first verify the status of the monitor (or the parameter used to run manually mentioned above) and, if the patch scan was successful, will simply exit the script.
2. If the monitor is still in a failed state, the monitor will attempt to resend patches.
3. If the patch scan returns properly, the script will exit with a log message indicating the issue has been resolved.
4. If the patch scan fails again, the script will take the following actions:
   1. Set the WUAUSERV to "AutoStart."
   2. Start the WUAUSERV service.
   3. Attempt to scan for patches again.
5. The script will then verify if the patch scan is working properly. If the command completes successfully, the script will exit. If the command fails, the script will exit with an error.

## Output

- Script log messages only.
- Please reach out to [support@provaltech.com](mailto:support@provaltech.com) if you would like this solution to begin ticketing.
