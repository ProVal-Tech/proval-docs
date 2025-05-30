---
id: '76867be6-fe44-441a-92ce-e3d1124c361d'
slug: /76867be6-fe44-441a-92ce-e3d1124c361d
title: 'Control Server Best Practice Ticket'
title_meta: 'Control Server Best Practice Ticket'
keywords: ['auditing', 'hardening', 'gpo', 'security', 'windows', 'iis', 'tls', 'ports', 'automation']
description: 'This document outlines the process of auditing and implementing hardening rules and policies for CW Control (on-prem) servers, focusing on security enhancements and compliance with best practices as per the recent CW guidelines.'
tags: ['gpo', 'iis', 'networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document details the process of auditing and establishing hardening rules and policies based on this document: [Hardening ConnectWise ScreenConnect](/docs/bd187550-7a42-4a72-b872-2a95ce698891).

**Time Saved by Automation:** 30 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/76867be6-fe44-441a-92ce-e3d1124c361d/image_1.webp)

## Variables

- `@Admins@`: Name of the local admins.
- `@PrivTicOutput@`: Output of the command `SecEdit /export /cfg $TemplateFilename /areas USER_RIGHTS`.
- `@OpenPorts@`: List of the open ports to be closed.

## Process

> Get the names of users/groups added to the Administrators group and add them to the ticket.  
> Set the following Group Policy Objects (GPOs):  
> - Do Not Allow Anonymous Enumeration of SAM accounts and Shares  
> - Disallow AutoPlay for non-volume devices  
> - Do not execute any autorun commands  
> - Turn off AutoPlay  
> - Always install with elevated privileges  
> Get the names of users/groups acting as Operating System and add them to the ticket.  
> The following ports are checked only if the server is placed in the Domain:  
> - Port 135: MSRPC  
> - Port 139: NetBios  
> - Port 445: Microsoft-ds  
> Disable TLS 1.0 and TLS 1.1  
> **Steps below this line will be executed only if the server has the Windows IIS Server Role detected:**  
> - Disable HTTP Headers  
> - Disable HTTP Options  

[Hardening ConnectWise ScreenConnect](/docs/bd187550-7a42-4a72-b872-2a95ce698891)

## Output

Ticket