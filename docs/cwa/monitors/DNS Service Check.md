---
id: '200c48e8-a828-43da-8ae5-f31a3280893b'
title: 'DNS Service Autofix Solution'
title_meta: 'DNS Service Autofix Solution'
keywords: ['dns', 'monitor', 'alert', 'script', 'service']
description: 'This document outlines a comprehensive solution for monitoring and fixing DNS services on DNS servers. It includes a remote monitor, an alert template, and a script designed to automatically restart DNS services if they fail. Detailed instructions for importing and implementing the solution are also provided.'
tags: []
draft: false
unlisted: false
---

## Purpose

This solution contains a remote monitor, a search, an alert template, and a script to perform the autofix of the DNS services on the DNS servers.

## Associated Content

| Content                                                                                      | Type          | Function                                                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Service - Restart](<../scripts/Service - Restart.md>)                           | Script        | This script will restart one or more services with proper error handling. This script can also be imported and triggered using the alert template **'△ Custom - Autofix - Restart Service'**                                                 |
| [SVC - DNS Monitor+ Fix](<./CWM - Automate - Remote Monitor - DNS Service Monitoring.md>)  | Remote Monitor| This PowerShell remote monitor checks whether the DNS service is running. If it is not running, it attempts to restart it. If the service still fails, it executes the script [EPM - Windows Configuration - Script - Service - Restart](<../scripts/Service - Restart.md>) using the alert template **'△ Custom - Autofix - Restart Service'** |
| **△ Custom - Autofix - Restart Service**                                                    | Alert Template| This alert template should run with the remote monitor [SVC - DNS Monitor+ Fix](<./CWM - Automate - Remote Monitor - DNS Service Monitoring.md>) to execute the script [EPM - Windows Configuration - Script - Service - Restart](<../scripts/Service - Restart.md>) to fix DNS service start issues. |

## How To Import

- Follow the document below for import and implementation steps:  
  [Import - Remote Monitor - ProVal - Production - DNS Service Check](<./DNS Service Monitoring.md>)

