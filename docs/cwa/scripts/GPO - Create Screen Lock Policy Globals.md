---
id: '0a1033eb-6797-40d4-8049-9e9e4bf0d637'
title: 'Configure Screen Lock Timeout for Domain Controllers'
title_meta: 'Configure Screen Lock Timeout for Domain Controllers'
keywords: ['screen', 'lock', 'timeout', 'domain', 'controllers']
description: "This document details a script that configures the screen lock timeout for Windows Domain Controllers using global variables. By default, the timeout is set to 900 seconds, but it can be adjusted according to your organization's best practices. The script includes parameters for applying the settings to the entire domain and logs the output for review."
tags: ['gpo', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script uses global variables to configure the number of seconds before a screen locks. By default, this script imports with this set at 900 seconds. This setting can be configured in the script's global variables section if your best practices differ from the ones configured in the script.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/GPO---Create-Screen-Lock-Policy-Globals/image_1.png)

## Dependencies

The script must be run against the Windows Domain Controllers.

## Variables

| Variable Name     | Description                                                                                       |
|-------------------|---------------------------------------------------------------------------------------------------|
| Timeout-Seconds   | This variable defines the number of seconds before a screen locks. By default, it is set to 900 seconds. |

#### Global Parameters

| Name                          | Example | Required | Description                                                                                   |
|-------------------------------|---------|----------|-----------------------------------------------------------------------------------------------|
| Apply to entire domain        | 1       | True     | This option helps to decide whether it is required to apply to the entire domain or not.     |

## Process

This script uses global variables to configure the number of seconds before a screen locks. By default, this script imports with this set at 900 seconds. This setting can be configured in the script's global variables section if your best practices differ from the ones configured in the script. The script runs two PowerShell scripts to create a GPO based on the parameters set in the script. If the parameter **Apply to entire domain** is null, the GPO will not link to the entire domain, and vice versa.

## Output

- Script log

