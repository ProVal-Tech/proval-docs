---
id: '3ccd3348-558b-41c3-8a81-c65fae2cf04e'
slug: /3ccd3348-558b-41c3-8a81-c65fae2cf04e
title: 'CWAFileService - Invalid Token'
title_meta: 'CWAFileService - Invalid Token'
keywords: ['restart', 'service', 'authorization', 'token', 'monitor']
description: 'This document outlines a remote monitor that restarts the CWAFileService on the Automate server when it detects an invalid authorization token in the service logs. The monitor checks for specific error messages within the last 15 minutes and triggers a service restart if necessary.'
tags: []
draft: false
unlisted: false
---

## Summary

This remote monitor restarts the service 'CWAFileService' on the Automate server if it detects the file 'C:/Windows/Temp/FileService.log' containing the message 'HttpRequest is missing or has invalid Authorization Token' within the last 15 minutes.

The actual message template is:  
FileService v24.0 - 3/10/2024 3:08:12 PM - HttpRequest is missing or has invalid Authorization Token:::

## Details

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED** | Missing | 900 |  |

## Dependencies

On-Premises client

## Target

Labtech Server Group

## Ticketing

**Subject**  
CWA - Invalid Authorization Token - %Computername%

**Body**  
The %computername% (Automate) Server is currently reporting %result% occurrences of an Invalid Token Authorization error within the logs C:/Windows/Temp/FileService.log. Typically, restarting the CWAFileService resolves this, but we have attempted to restart the service 4 times, and the errors persist after every restart.

## Implementation

Follow the article below:  
- [Import - Remote Monitors - CWAFileService - Invalid Token](/docs/c7d4a134-33d0-4598-add3-f41bd187331d)