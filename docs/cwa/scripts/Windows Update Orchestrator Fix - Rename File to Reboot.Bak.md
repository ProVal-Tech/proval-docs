---
id: 'cwa-update-orchestrator-autofix'
title: 'Update Orchestrator Autofix Script'
title_meta: 'Update Orchestrator Autofix Script for Service Status Detection'
keywords: ['autofix', 'update', 'orchestrator', 'service', 'status', 'detection', 'rename', 'patches']
description: 'This document describes the Update Orchestrator Autofix Script, designed to prevent unauthorized reboots and patch installations on endpoints by renaming the reboot file. It operates as an autofix for the Update Orchestrator Service Status Detection monitor, ensuring that updates are managed with prior approval.'
tags: ['configuration', 'monitoring', 'software', 'windows', 'update']
draft: false
unlisted: false
---
## Summary

This script is setup as the autofix for the [Update Orchestrator Service Status Detection](https://proval.itglue.com/DOC-5078775-7909077) monitor. This script will rename the "reboot" file so the update orchestrator will not issue a reboot to the machine. This will prevent the update orchestrator from installing patches on the endpoint without prior approval. This script is a function script and it will not run manually.

Time Saved by Automation: 5 Minutes

## Sample Run

This script is a function script and cannot be run manually. This script should only run as an autofix for the [Update Orchestrator Service Status Detection](https://proval.itglue.com/DOC-5078775-7909077) monitor.

## Dependencies

This script is dependent upon the [Update Orchestrator Service Status Detection](https://proval.itglue.com/DOC-5078775-7909077) monitor.

## Variables

`@Output@` - the output from the PowerShell that renames the file.

## Process

The monitor will check for the condition and this script will automatically execute. The script will take the "reboot" file in the UpdateOrchestrator folder and rename it to "reboot.bak". It will then verify that the results of the PowerShell were successful. On success, the script will exit with a log message indicating the file was renamed. On failure, the script will exit with an error and a log message saying the file rename failed.

## Output

Script log messages only.


