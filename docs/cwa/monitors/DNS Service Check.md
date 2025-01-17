---
id: '200c48e8-a828-43da-8ae5-f31a3280893b'
title: 'DNS Service Autofix Solution'
title_meta: 'DNS Service Autofix Solution'
keywords: ['dns', 'monitor', 'alert', 'script', 'service']
description: 'This document outlines a comprehensive solution for monitoring and fixing DNS services on DNS Servers. It includes a remote monitor, an alert template, and a script designed to automatically restart DNS services if they fail. Detailed instructions for importing and implementing the solution are also provided.'
tags: []
draft: false
unlisted: false
---
## Purpose

This solution contains a remote monitor, a search, an alert template, and a script to perform the autofix of the DNS services on the DNS Servers.

## Associated Content

| Content                                                                                      | Type          | Function                                                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Service - Restart](https://proval.itglue.com/DOC-5078775-11032265)               | Script        | This Script will restart one or more services with proper error handling. This script can also be imported and triggered using the Alert Template **'△ Custom - Autofix - Restart Service'**                                                 |
| [SVC - DNS Monitor+ Fix](https://proval.itglue.com/DOC-5078775-13598575)                   | Remote Monitor| This Powershell remote monitor checks for whether the DNS service is running or not. If not running then it itself attempts to restart it and then again checks, if it still fails then it executes the script [EPM - Windows Configuration - Script - Service - Restart](https://proval.itglue.com/DOC-5078775-11032265) using the alert template **'△ Custom - Autofix - Restart Service'** |
| **△ Custom - Autofix - Restart Service**                                                    | Alert Template| This alert template should run with the remote monitor [SVC - DNS Monitor+ Fix](https://proval.itglue.com/DOC-5078775-13598575) to run the script [EPM - Windows Configuration - Script - Service - Restart](https://proval.itglue.com/DOC-5078775-11032265) to fix the DNS service start issues. |

## How To Import

- Follow the below document for import and implementation steps:  
  [Import - Remote Monitor - ProVal - Production - DNS Service Check](https://proval.itglue.com/DOC-5078775-13604735)












