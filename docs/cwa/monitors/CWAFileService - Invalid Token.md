---
id: 'cwa-restart-cwafileservice-invalid-token'
title: 'Restart CWAFileService on Invalid Authorization Token'
title_meta: 'Restart CWAFileService on Invalid Authorization Token'
keywords: ['restart', 'service', 'authorization', 'token', 'monitor']
description: 'This document outlines a remote monitor that restarts the CWAFileService on the Automate server when it detects an invalid authorization token in the service logs. The monitor checks for specific error messages within the last 15 minutes and triggers a service restart if necessary.'
tags: ['cwa', 'monitoring', 'error', 'service', 'log']
draft: false
unlisted: false
---
## Summary

This remote monitor restarts the service 'CWAFileService' on the Automate server if it detects the file 'C:\Windows\Temp\FileService.log' where the file contains the message 'HttpRequest is missing or has invalid Authorization Token' in the last 15 minutes.

The actual message template is:  
FileService v24.0 - 3/10/2024 3:08:12 PM - HttpRequest is missing or has invalid Authorization Token:::

## Details

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$threshold = 20;$path = 'C:\Windows\Temp\FileService.log' ;if ( Test-Path $path ) { $content = foreach ( $line in $(Get-Content -path $path | Where-Object { $_ -match 'HttpRequest is missing or has invalid Authorization Token' } ) ) { $line };$problems = foreach ($err in $content ) { if ( $err -match '- (([0-9]{1,2}\\/){2}[0-9]{4} ([0-9]{1,2}:){2}[0-9]{1,2} [AP]M) -' ){ if ([DateTime]$matches[1] -ge (Get-Date).AddMinutes(-15)) {$err} } }if ( $problems.count -ge $threshold ) { Restart-Service -Name 'CWAFileService' -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue; return $problems.count} }" | Missing | 900 |  |

## Dependencies

On-Premises client

## Target

Labtech Server Group

## Ticketing

**Subject**  
CWA - Invalid Authorization Token - %Computername%

**Body**  
The %computername% (Automate) Server is currently reporting %result% occurrence's of a Invalid Token Authorization error within the logs C:\Windows\Temp\FileService.log. Typically restarting the CWAFileService resolves this, but we have attempted to restart the service 4 times and the errors persist after every restart.

## Implementation

Follow the below article:  
- [Import - Remote Monitors - CWAFileService - Invalid Token](https://proval.itglue.com/DOC-5078775-15398919)

