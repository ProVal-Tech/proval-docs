---
id: 'a24b00c5-49d4-4a2b-9090-a2716b56cf47'
title: 'Domain Admin Account Lockout'
title_meta: 'Domain Admin Account Lockout'
keywords: ['monitor', 'domain', 'admin', 'lockout', 'ticket', 'alert']
description: 'This document outlines the configuration of a remote monitor designed to detect when the domain admin account is locked. It includes details on check actions, dependencies, target servers, ticketing information, and implementation steps for effective monitoring and alerting.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

This remote monitor is configured to detect when the domain admin account is locked. It checks every 15 minutes and creates a ticket for the partner to review, providing complete details.

## Details

**Suggested "Limit to"**: Server Role - AD - Infrastructure Master  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: `△ Custom - Ticket Creation Computer - Failures Only`

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval |
|--------------|----------------|------------|-------------|------------|----------|
| System       | 127.0.0.1     | Run File   | **REDACTED**| State Based | 900      |

**State Conditions:**  
![State Conditions](../../../static/img/Domain-Admin-Account-Lockout/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer [Failures Only]](<../scripts/Ticket Creation - Computer Failures Only.md>)  
`△ Custom - Ticket Creation Computer - Failures Only`

## Target

Domain Controllers  
![Target Image](../../../static/img/Domain-Admin-Account-Lockout/image_2.png)  
![Target Image](../../../static/img/Domain-Admin-Account-Lockout/image_3.png)  

The monitor set should be limited to the `Server Roles/Server Role - AD - Infrastructure Master` search.

## Ticketing

**Subject:**  
Domain Admin Locked Account Detected on %computername%

**Body:**  
Domain Admin Locked Account Detected on %computername%. Refer to the below detail:  
%RESULT%.  

**Reference Ticket:**  
![Reference Ticket](../../../static/img/Domain-Admin-Account-Lockout/image_4.png)

## Implementation

Please follow the implementation document below to install this content:

- [Implement - Remote Monitor - Domain Admin Account Lockout](<./Implement - Remote Monitor - Domain Admin Account Lockout.md>)



