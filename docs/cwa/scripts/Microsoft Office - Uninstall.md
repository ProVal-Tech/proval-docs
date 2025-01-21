---
id: 'dd794f2d-7327-4d84-bda5-7d005b68a039'
title: 'Office Scrub Utility for Microsoft Products'
title_meta: 'Office Scrub Utility for Microsoft Products'
keywords: ['office', 'uninstall', 'utility', 'microsoft', 'script', 'automation']
description: 'This document details the Office Scrub utility script that automates the uninstallation of specified Microsoft Office products, streamlining the process and saving considerable time. It includes dependencies, user parameters, and output information for effective execution.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script will run the Office Scrub utility and remove all or specified Microsoft Office products.

**Time Saved by Automation:** 20 Minutes

## Sample Run

![Sample Run](../../../static/img/Microsoft-Office---Uninstall/image_1.png)

See parameters in the "User Parameters" section below.

## Dependencies

[Invoke-OffScrub](<../../powershell/Invoke-OfficeScrub.md>) (PowerShell script)

## Variables

- `@ProjectName@` - The name of the PowerShell script that will perform the desired actions.
- `@Parameters@` - Handles parameters passed to the PowerShell script.
- `@Versions@` - Handles which versions of Microsoft Office will be attempted to uninstall.

Please see [Invoke-OffScrub](<../../powershell/Invoke-OfficeScrub.md>) to review remaining variables.

#### User Parameters

| Name        | Example | Required | Description                                                                                       |
|-------------|---------|----------|---------------------------------------------------------------------------------------------------|
| `@Versions@`| All     | True     | This user parameter determines which versions of Office will be attempted to uninstall.  <br/> **Parameters:**  <br/> **All** - Will attempt to remove all Microsoft Office products.  <br/> **2003** - Will attempt to remove Microsoft Office 2003.  <br/> **2007** - Will attempt to remove Microsoft Office 2007.  <br/> **2010** - Will attempt to remove Microsoft Office 2010.  <br/> **2013** - Will attempt to remove Microsoft Office 2013.  <br/> **2016** - Will attempt to remove Microsoft Office 2016.  <br/> **365** - Will attempt to remove Microsoft Office 365. |

## Process

The script will determine which version(s) of Microsoft Office to uninstall via the user parameter `@Versions@`.

Based on the version input by the technician, the script will jump to the appropriate section and execute the OfficeScrub payload in this Automate script. The script will run through the various versions and report back success/failure information to the Automate script. Additional logs are available on the endpoint (please see the [Invoke-OffScrub](<../../powershell/Invoke-OfficeScrub.md>) documentation for details on log locations).

## Output

- Script log
- Local file on the computer

