---
id: '5263a1ab-49c0-49f0-a5b5-9f9062229b86'
slug: /5263a1ab-49c0-49f0-a5b5-9f9062229b86
title: 'System Restore - Enable'
title_meta: 'System Restore - Enable'
keywords: ['system', 'restore', 'windows', 'workstations', 'script']
description: 'This document provides a detailed guide on enabling System Restore on Windows workstations using a PowerShell script. It covers user parameters, dependencies, and the process involved in executing the script, along with the expected output.'
tags: ['performance', 'recovery', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This guide enables System Restore on Windows workstations.  
While running the script, don't forget to fill in the user parameter for "driveletter".

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/5263a1ab-49c0-49f0-a5b5-9f9062229b86/image_1.png)

## Dependencies

- Windows Operating System

## Variables

`@PSResult@` - The results from the PowerShell used to enable System Restore

### User Parameters

| Name        | Example | Required | Description                                         |
|-------------|---------|----------|-----------------------------------------------------|
| driveletter | C       | True     | The drive letter where System Restore will be enabled. |

## Process

The script will run a PowerShell command that enables System Restore on the target drive letter provided by the user running the script. The script will output the result to a log message and then exit.

## Output

- Script log message only

