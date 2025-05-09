---
id: '89346170-6657-4784-93cf-c0aa024b4386'
slug: /89346170-6657-4784-93cf-c0aa024b4386
title: 'PowerShell Response - All Errors - Check'
title_meta: 'PowerShell Response - All Errors - Check'
keywords: ['error', 'logging', 'troubleshooting', 'scripting', 'development', 'output', 'status']
description: 'This document details a PowerShell script designed to check for common errors in the output of a parent script. It converts these errors into a human-readable format and logs them, aiding in troubleshooting and development. The script enhances the debugging process by providing clear error messages based on known issues, making it a valuable tool for developers.'
tags: ['logging']
draft: false
unlisted: false
---

## Summary

This script takes a parent's `psout` variable and checks it for known common errors, converting those errors into a human-readable format and logging them in the script log. This is particularly useful when attempting to determine why a PowerShell command didn't run as expected, and it can be instrumental in testing, troubleshooting, and the development of future scripts.

This script has been used in 12 scripts as a method of troubleshooting. It has evolved from 3 known errors to now 7, and it can be easily extended.

## Sample Run

This script should always be called from a parent script.

1. On any parent script where a PowerShell command is being run, save the output to the variable `@psout@`.
2. Run the PowerShell Response - All Errors - Check script immediately after setting the `@psout@` variable.
3. After running that script, check the state of the `@failstatus@` variable in the script. If the state is False, then the PowerShell command that was run triggered an error check, and a log should be present in the `@EnvironmentalError@` variable.

## Dependencies

- A `@psout@` variable must be present in the script at the time of calling this script.

## Variables

| Name                | Description                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| EnvironmentalError  | This variable sets the human-readable interpretation of the error held in the `@psout@` variable. |

## Process

1. Check `@psout@` for a specific string.
   1. Set the `@EnvironmentalError@` variable to what the specific string reflects.
   2. Log the error and exit with an error.
2. Go back to step 1 until all known strings are queried.
3. Exit the script.

## Output

- Script log
- `@failstatus@` variable state
- `@EnvironmentalError@` variable