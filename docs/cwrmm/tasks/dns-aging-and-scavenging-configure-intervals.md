---
id: '34f898bc-50ac-4808-bf0c-46286eb27e60'
slug: /34f898bc-50ac-4808-bf0c-46286eb27e60
title: 'DNS - Aging and Scavenging - Configure Intervals'
title_meta: 'DNS - Aging and Scavenging - Configure Intervals'
keywords: ['dns', 'scavenging', 'intervals', 'configuration', 'automation']
description: 'This document provides a detailed guide on implementing DNS scavenging settings through an RMM system. It covers user parameters, task creation, and script execution to enable DNS scavenging and configure intervals for scavenging, no refresh, and refresh settings.'
tags: ['dns']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This is an RMM implementation of the agnostic script [Set-DNSServerScavengingSettings](/docs/6942d20e-8606-4af2-bae5-7525935a2bfd). It enables DNS scavenging and optionally allows you to set the interval for scavenging, 'no refresh', and refresh.

## Sample Run

![Sample Run](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_1.webp)

## Dependencies

[Set-DNSServerScavengingSettings](/docs/6942d20e-8606-4af2-bae5-7525935a2bfd)

## User Parameters

| Name                  | Example | Accepted Values | Required | Default | Type  | Description                                                                                          |
|-----------------------|---------|-----------------|----------|---------|-------|------------------------------------------------------------------------------------------------------|
| `ScavengingInterval`  | 7       | Integers        | False    |         | Text  | The scavenging process runs after X days.                                                           |
| `NoRefreshInterval`   | 7       | Integers        | False    |         | Text  | This setting controls when the DNS server rejects refresh requests from hosts and the DHCP service. |
| `RefreshInterval`     | 7       | Integers        | False    |         | Text  | This option determines when a DDNS record can be flagged for scavenging (deletion). The default value is seven days. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_2.webp)

**Name:** DNS - Aging and Scavenging - Configure Intervals  \
**Description:** Enables DNS scavenging and optionally allows you to set the interval for 'scavenging', 'no refresh', and 'refresh'.  \
**Category:** Custom  \
![Task Creation](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_3.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_4.webp)

This screen will appear.

![Parameter Screen](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_5.webp)

- Set `ScavengingInterval` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_6.webp)

- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_7.webp)

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_8.webp)

- Set `NoRefreshInterval` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_9.webp)

- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

- Set `RefreshInterval` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_10.webp)

All the parameters will look like as shown below:  
![Parameters](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_11.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_12.webp)

A blank function will appear.  
![Blank Function](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_13.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_14.webp)

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_15.webp)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/dns-aging-and-scavenging-configure-intervals/script.ps1)



![PowerShell Script](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_18.webp)

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Script Log](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_16.webp)

## Completed Task

![Completed Task](../../../static/img/docs/34f898bc-50ac-4808-bf0c-46286eb27e60/image_17.webp)

## Output

- Script Log

## Changelog

### 2025-04-10

- Initial version of the document

