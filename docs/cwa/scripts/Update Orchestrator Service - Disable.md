---
id: 'cwa-stop-update-orchestrator-service'
title: 'Stop and Disable Update Orchestrator Service'
title_meta: 'Stop and Disable Update Orchestrator Service'
keywords: ['update', 'service', 'disable', 'orchestrator', 'stop']
description: 'This document provides a detailed overview of a script designed to stop and disable the Update Orchestrator service, including its dependencies, process, and expected output. The automation saves approximately 5 minutes of manual effort.'
tags: ['service', 'update', 'automation', 'windows', 'performance']
draft: false
unlisted: false
---
## Summary

The script will stop and disable the Update Orchestrator service.  
Time Saved by Automation: 5 Minutes  

## Sample Run

Function Script  
It will run as an autofix with dependent monitor.  

## Dependencies

[Update Orchestrator Service Status Detection](https://proval.itglue.com/DOC-5078775-7909077)  

## Process

- This script will detect the Update Orchestrator whether running.
- If running then it will stop it and disable the service.
- Cross check and confirm the status.

## Output

- Script log


