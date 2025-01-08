---
id: 'cwa-office-scrub-utility'
title: 'Office Scrub Utility for Microsoft Products'
title_meta: 'Office Scrub Utility for Microsoft Products'
keywords: ['office', 'uninstall', 'utility', 'microsoft', 'script', 'automation']
description: 'This document details the Office Scrub utility script that automates the uninstallation of specified Microsoft Office products, streamlining the process and saving considerable time. It includes dependencies, user parameters, and output information for effective execution.'
tags: ['uninstallation', 'software', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This script will run the Office Scrub utility and remove all or specified Microsoft Office products.

Time Saved by Automation: 20 Minutes

## Sample Run

![Sample Run](5078775/docs/8246319/images/11482917)

See parameters in the below "User Parameters" section

## Dependencies

[Invoke-OffScrub](https://proval.itglue.com/DOC-5078775-7593306) (PowerShell script)

## Variables

- `@ProjectName@` - The name of the PowerShell script that will perform the desired actions
- `@Parameters@` - Handles parameters passed to the PowerShell script
- `@Versions@` - Handles which versions of Microsoft Office will attempt to uninstall

Please see [Invoke-OffScrub](https://proval.itglue.com/DOC-5078775-7593306) to review remaining variables.

#### User Parameters

| Name        | Example | Required | Description                                                                                       |
|-------------|---------|----------|---------------------------------------------------------------------------------------------------|
| `@Versions@`| All     | True     | This is the user parameter used to determine which versions of office will attempt to uninstall. <br> Parameters: <br> All - Will attempt to remove all Microsoft Office products <br> 2003 - Will attempt to remove Microsoft Office 2003 <br> 2007 - Will attempt to remove Microsoft Office 2007 <br> 2010 - Will attempt to remove Microsoft Office 2010 <br> 2013 - Will attempt to remove Microsoft Office 2013 <br> 2016 - Will attempt to remove Microsoft Office 2016 <br> 365 - Will attempt to remove Microsoft Office 365 |

## Process

The script will determine which version(s) of Microsoft Office to uninstall via the user parameter `@Versions@`.

Based on the version input by the technician, the script will jump to the appropriate section of the script and execute the OfficeScrub payload in this Automate script. The script will run through the various versions and report back success/fail information back to the Automate script. There are additional logs available on the endpoint (please see the [Invoke-OffScrub](https://proval.itglue.com/DOC-5078775-7593306) documentation for details on log locations.)

## Output

- Script log
- Local file on computer

