---
id: 'bab32968-8269-421b-a312-7b9bf30b8172'
slug: /bab32968-8269-421b-a312-7b9bf30b8172
title: 'Run Script On Next Patching Schedule'
title_meta: 'Run Script On Next Patching Schedule'
keywords: ['autofix', 'patching', 'script', 'execution', 'monitor']
description: 'This document details the execution of an autofix script during the patching schedule in ConnectWise Automate. It explains how the script is triggered, its dependencies, global parameters, and the process of checking script execution status to ensure optimal performance during patching windows.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

The script will be called as an Autofix script from the [Proval - Production - Run Script on Next Patching Schedule](<../monitors/Run Script on Next Patching Schedule.md>) monitor. The alert template will run the script indicated in the `@Sid@` global variable on the target agent. If `@Sid@` is not passed as a parameter while running the script, the script will attempt to run the script assigned to the install policy. The script will wait for 1 hour after the patching window starts before issuing the script. The script will not be executed if it has already run on the computer in the last 60 minutes or is scheduled to execute in the next 60 minutes. This solution will execute the indicated scripts in the autofix script during the patch window, even when there are no patches to install. Automate does not fire the script from the Microsoft Update Policy unless the device has queued patches.

## Sample Run

This script is an autofix and will not function as intended if run manually.

## Dependencies

[Proval - Production - Run Script on Next Patching Schedule](<../monitors/Run Script on Next Patching Schedule.md>)

## Variables

`@cp@`: This variable is used to store the result of an SQL query that checks if the concerned script is already running or is scheduled against the concerned machine.

### Global Parameters

| Name | Example | Required | Description |
|------|---------|----------|-------------|
| Sid  | 1322    | True     | ID of the script intended to run against the machine at its respective patching schedule. |

## Process

> Checks if the `@Sid@` is passed as a parameter; otherwise, it will fetch the script ID of the script assigned as "Script to run before patching" for the install policy applied against the machine.  
> Checks if the script with the script ID `@Sid@` is currently running, scheduled to run, or has been executed on the computer during the previous or next 60 minutes.  
> If yes, then the script will exit; otherwise, it will run the script with ID `@Sid@` against the machine.



