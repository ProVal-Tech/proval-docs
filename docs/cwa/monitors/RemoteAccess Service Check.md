---
id: '487873f8-4b59-47bc-b938-c64903898d8a'
title: 'RemoteAccess Service Check Monitor'
title_meta: 'RemoteAccess Service Check Monitor'
keywords: ['remoteaccess', 'service', 'monitor', 'windows', 'ticketing']
description: 'This document outlines the setup and functionality of a remote monitor that ensures the RemoteAccess service is running on Windows machines. It automatically sets the service to start type Automatic and attempts to restart it if it is stopped, creating a ticket if it fails to start.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to set the Start type for the RemoteAccess service to `Automatic` and start it if it is stopped. This PowerShell remote monitor checks whether the RemoteAccess service is running. If it is not running, it sets the StartType to Automatic and attempts to restart the service. If the service fails to start, a ticket is created.

## Details

**Suggested "Limit to":** Windows Machines  
**Suggested Alert Style:** Once  
**Suggested Alert Template:** △ Custom - Ticket Creation - Computer  

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue';$result = Get-Service -Name 'RemoteAccess' | Select-Object -ExpandProperty Status; if($result -eq 'Running'){return 'Service Running'} else {Set-Service -Name 'RemoteAccess' -StartupType Automatic; $result = Get-Service -Name 'RemoteAccess' | Select-Object -ExpandProperty Starttype; if($result -eq 'Automatic'){Start-Service -Name 'RemoteAccess'; $result = Get-Service -Name 'RemoteAccess' | Select-Object -ExpandProperty Status;if($result -eq 'Running'){return 'Service Running'} else{return 'Service not Starting'}} else {return 'Service Not Starting'}}" | Equals | 300 | Service Running |

## Target

Limited to Windows machines only.

## Ticketing

**Subject:** `Failed to Restart RemoteAccess (Routing and Remote Access) Service on %ComputerName%`  

**Success Body:** `Service - RemoteAccess (Routing and Remote Access) is now running on %ComputerName%.`  

**Failure Body:** `Service - RemoteAccess (Routing and Remote Access) is not running on %ComputerName%. Please check if Startup Type is set to Disabled.`  

## How To Import

- Follow the document below for import and implementation steps:  
  [Import - Remote Monitor - ProVal - Production - RemoteAccess Service Check](<./RemoteAccess Service Check.md>)  
