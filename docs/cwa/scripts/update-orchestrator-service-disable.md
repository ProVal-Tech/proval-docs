---
id: 'eb9d46c0-757b-4630-b6c5-709f708ceec5'
slug: /eb9d46c0-757b-4630-b6c5-709f708ceec5
title: 'Update Orchestrator Service - Disable'
title_meta: 'Update Orchestrator Service - Disable'
keywords: ['update', 'service', 'disable', 'orchestrator', 'stop']
description: 'This document provides a detailed overview of a script designed to stop and disable the Update Orchestrator service, including its dependencies, process, and expected output. The automation saves approximately 5 minutes of manual effort.'
tags: ['performance', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script will stop and disable the Update Orchestrator service.  
**Time Saved by Automation:** 5 Minutes  

## Sample Run

### Function Script  
It will run as an autofix with a dependent monitor.  

## Dependencies

[Update Orchestrator Service Status Detection](/docs/e3c5aeb1-144d-4c12-9b33-2d56d05804ce)  

## Process

- This script will detect whether the Update Orchestrator is running.
- If it is running, the script will stop it and disable the service.
- Cross-check and confirm the status.

## Output

- Script log  