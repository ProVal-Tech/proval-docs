---
id: '8a8349f6-0f93-4e85-9a33-f6c7867f4bf5'
slug: /8a8349f6-0f93-4e85-9a33-f6c7867f4bf5
title: 'Windows Update Orchestrator Fix - Rename File to Reboot.Bak'
title_meta: 'Windows Update Orchestrator Fix - Rename File to Reboot.Bak'
keywords: ['autofix', 'update', 'orchestrator', 'service', 'status', 'detection', 'rename', 'patches']
description: 'This document describes the Update Orchestrator Autofix Script, designed to prevent unauthorized reboots and patch installations on endpoints by renaming the reboot file. It operates as an autofix for the Update Orchestrator Service Status Detection monitor, ensuring that updates are managed with prior approval.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script is set up as the autofix for the [Update Orchestrator Service Status Detection](/docs/e3c5aeb1-144d-4c12-9b33-2d56d05804ce) monitor. This script will rename the "reboot" file so the update orchestrator will not issue a reboot to the machine. This will prevent the update orchestrator from installing patches on the endpoint without prior approval. This script is a function script and it will not run manually.

**Time Saved by Automation:** 5 Minutes

## Sample Run

This script is a function script and cannot be run manually. It should only run as an autofix for the [Update Orchestrator Service Status Detection](/docs/e3c5aeb1-144d-4c12-9b33-2d56d05804ce) monitor.

## Dependencies

This script is dependent upon the [Update Orchestrator Service Status Detection](/docs/e3c5aeb1-144d-4c12-9b33-2d56d05804ce) monitor.

## Variables

`@Output@` - the output from the PowerShell that renames the file.

## Process

The monitor will check for the condition, and this script will automatically execute. The script will take the "reboot" file in the UpdateOrchestrator folder and rename it to "reboot.bak". It will then verify that the results of the PowerShell were successful. On success, the script will exit with a log message indicating the file was renamed. On failure, the script will exit with an error and a log message stating that the file rename failed.

## Output

Script log messages only.