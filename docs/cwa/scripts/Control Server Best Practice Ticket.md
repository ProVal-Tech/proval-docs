---
id: '76867be6-fe44-441a-92ce-e3d1124c361d'
title: 'Auditing and Hardening Rules for CW Control Servers'
title_meta: 'Auditing and Hardening Rules for CW Control Servers'
keywords: ['auditing', 'hardening', 'gpo', 'security', 'windows', 'iis', 'tls', 'ports', 'automation']
description: 'This document outlines the process of auditing and implementing hardening rules and policies for CW Control (on-prem) servers, focusing on security enhancements and compliance with best practices as per the recent CW guidelines.'
tags: ['gpo', 'iis', 'networking', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This script goes through the process of Auditing and setting up hardening rules and policies relating to the recently published CW document [Hardening CW Control (on-prem) Servers](https://proval.itglue.com/5078775/docs/8025398).

Time Saved by Automation: 30 Minutes

## Sample Run

![Sample Run](../../../static/img/Control-Server-Best-Practice-Ticket/image_1.png)

## Variables

- `@Admins@`: Name of the local admins.
- `@PrivTicOutput@`: Output of command "SecEdit /export /cfg $TemplateFilename /areas USER_RIGHTS".
- `@OpenPorts@`: List of the open ports to be closed.

## Process

> Get the name of users/groups added in Administrators group and add to the ticket.  
> Sets following GPOs:  
> --> Do Not Allow Anonymous Enumeration of SAM accounts and Shares  
> --> Disallow AutoPlay for non-volume devices  
> --> Do not execute any autorun commands  
> --> Turn off AutoPlay  
> --> Always install with elevated privileges  
> Get the name of users/groups acting as Operating System and add to the ticket.  
> Following ports are checked only if server is placed in Domain  
> --> Port 135: MSRPC, Port 139: NetBios, Port 445: Microsoft-ds  
> Disables TLS1.0 and TLS1.1  
> **Steps below this line will be executed only if server is having Windows IIS Server Role detected**  
> Disable HTTP Headers  
> Disable HTTP Options  

[View Document](https://proval.itglue.com/5078775/docs/8025398#version=published&documentMode=view)

## Output

Ticket












