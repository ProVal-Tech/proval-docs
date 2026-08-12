---
id: '49b48f71-763e-441b-92bf-008cb2073322'
slug: /49b48f71-763e-441b-92bf-008cb2073322
title: 'Microsoft 365 - Repair'
title_meta: 'Microsoft 365 - Repair'
keywords: ['repair', 'office 365', 'O365', 'Microsoft 365', 'M365']
description: 'This is a CW Automate implementation of the agnostic script Invoke-Office365Repair'
tags: ['office365', 'office']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Summary

 This is a CW Automate implementation of the agnostic script [Invoke-Office365Repair](/docs/b5cb3a64-95d8-4d68-be9f-a4e978923112).  

 This script repairs the Microsoft 365 / Office 365 Click-to-Run apps on the local machine. It wraps Microsoft's own supported OfficeClickToRun.exe repair command line so that a Quick Repair or a Full (online) Repair can be triggered unattended from an RMM, with no user session and no prompts.

## Dependencies

- [Agnostic - Invoke-Office365Repair](/docs/b5cb3a64-95d8-4d68-be9f-a4e978923112)

## Sample Run

Run the script without any parameter to run a `QuickRepair` for the detected installed version of O365, closing all the office applications that are opened.

![Sample 1](../../../static/img/docs/49b48f71-763e-441b-92bf-008cb2073322/image.webp)

Run with shown parameters to perform a full repair on 32-bit Office with english language package installed.

![Sample 2](../../../static/img/docs/49b48f71-763e-441b-92bf-008cb2073322/image1.webp)

## User Parameters

| Name | Required | Default | Example | Description   |
|---------|---------|---------|---------|---------|
| RepairType | True | `QuickRepair` | `QuickRepair`, `FullRepair` | This provides option to quick (short) or full (complete) repair for the Office 365. |
| Platform | False | `Currently Installed` | `<Blank>`, `x86`, `x64`, `arm64` | This provides the option to select the platform that Office 365 uses. |
| Culture | False | `Currently Installed` | `en-us` | The language code used to validate the existing installation binaries in the input language. |
| LeaveAppsOpen | True | `False` | `0`, `1`, `True`, `False` | If 1 or true, then the office apps will not be forcibly closed. By default, the repair will close all opened office apps. | 


## Output

- Script Log
- C:\ProgramData\_Automation\Script\Invoke-Office365Repair\Invoke-Office365Repair-Log.txt
- C:\ProgramData\_Automation\Script\Invoke-Office365Repair\Invoke-Office365Repair-error.txt


## Changelog

### 2026-08-12

- Initial version of the document