---
id: '7c336dbd-72cb-4099-8be1-19c78f54cabb'
slug: /7c336dbd-72cb-4099-8be1-19c78f54cabb
title: 'Add Windows Capability - RSAT'
title_meta: 'Add Windows Capability - RSAT'
keywords: ['rsat', 'windows', 'monitor', 'ticket', 'automation']
description: 'This document outlines the process for monitoring Windows machines to ensure that the Remote Server Administration Tools (RSAT) feature is enabled. If the feature is not enabled, an Automate ticket will be created if the installation attempt fails. The document includes details on suggested alert styles, ticketing information, and implementation steps.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

If a Windows machine does not already have the [Remote Server Administration Tools](https://learn.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools) feature enabled, the remote monitor attempts to install it and creates an Automate ticket if it fails.  

**Note:** RSAT can be installed on the Home or Standard editions of Windows.

## Details

**Suggested "Limit to":** Required Windows Computers  
**Suggested Alert Style:** Once  
**Suggested Alert Template:** `△ Custom - Ticket Creation - Computer`  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Condition    | Interval | Result |
|--------------|----------------|------------|---------------|--------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based  | 604800   | ![Image](../../../static/img/docs/7c336dbd-72cb-4099-8be1-19c78f54cabb/image_1.webp) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)

## Target

Required Group of Machines

## Ticketing

**Subject:** `Failed to add RSAT Features on %computername%`  

**Body:**  
`Remote Server Administration Tools Features are not enabled on the %ComputerName%. Automate attempted to enable it but failed. Please review manually.
Command Executed: Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq 'NotPresent'} | Add-WindowsCapability -Online
Output: %RESULT%
How to enable it manually: https://learn.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools`

## Implementation

[Implement - Remote Monitor - Add Windows Capability - RSAT](/docs/b927b474-abad-4e84-8f39-8995d5ace913)