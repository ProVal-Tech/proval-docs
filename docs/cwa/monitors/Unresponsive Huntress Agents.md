---
id: 'cwa-unresponsive-huntress-agent-monitor'
title: 'Unresponsive Huntress Agent Monitor'
title_meta: 'Unresponsive Huntress Agent Monitor'
keywords: ['monitor', 'huntress', 'agent', 'orphaned', 'security']
description: 'This document outlines the implementation of a monitor designed to detect if a Huntress Agent has become orphaned, meaning it has not communicated with the Huntress portal for over 30 days. It includes details on suggested alert settings, implementation steps, and ticketing information for unresponsive agents.'
tags: ['monitoring', 'security', 'windows', 'alert', 'ticketing']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor is to monitor if Huntress Agent has been Orphaned or not. By Orphaned it means Huntress has not received a response from the agent within 30 days and the Agent's key/token has been revoked by Huntress. At that point, the agent is unable to send or receive any data from the Huntress portal and is essentially not performing security tasks anymore.

## Details

**Suggested "Limit to"**: 'Machines with Huntress Agent'  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer [Failures Only]`

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 1270.0.1      | Run File   | **REDACTED**  | State Based | 86400    | <Screenshot Below> |

![Screenshot](..\..\..\static\img\Unresponsive-Huntress-Agents\image_1.png)

## Target

Windows Machines limiting to machines with Huntress Agents only.

## Implementation

[Import - Remote Monitor - Unresponsive Huntress Agents](https://proval.itglue.com/DOC-5078775-16097655) 

## Ticketing

**Subject:** `Unresponsive Huntress Agent Detected on %COMPUTERNAME%`  

**Body:** `The machine %computername% located at %clientname%\\%locationname% is currently reporting its huntress agent has been orphaned. This means the agent has not been able to communicate with Huntress for over 30 days and its license key has been revoked by huntress and may no longer be performing security functions on the machine. Please validate the agent is communicating with Huntress and if it is not, re-install the application to resolve the issue.`


