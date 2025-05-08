---
id: '225185fa-817d-49e9-8000-ebbf2e69cf2c'
slug: /225185fa-817d-49e9-8000-ebbf2e69cf2c
title: 'Automate Database Maintenance - Patch Manager'
title_meta: 'Automate Database Maintenance - Patch Manager'
keywords: ['cleanup', 'database', 'maintenance', 'patch', 'history']
description: 'This document details a script used for maintaining the Automate database by cleaning up specific tables related to patch management. It outlines the required global variable settings, describes the script’s functionality, and provides an overview of the variables used within the script.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

This script handles the cleanup of the following table(s) and requires the [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `PatchManagerHistory_Cleanup` global variable to be set to 1:

- patchapprovalsettings
- hotfixdata
- PatchCVSSInfo
- hotfix
- superseded patches

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                                                                                                                                                              |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verifies both the starting count of targeted data, as well as the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0. |
| LogMessage  | This variable is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@` = `@LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output Image](../../../static/img/docs/225185fa-817d-49e9-8000-ebbf2e69cf2c/image_1.webp)
