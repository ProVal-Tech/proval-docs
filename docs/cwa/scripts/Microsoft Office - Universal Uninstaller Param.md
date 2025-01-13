---
id: 'cwa-uninstall-office-scrub'
title: 'Uninstall Microsoft Office Versions with Offscrub'
title_meta: 'Uninstall Microsoft Office Versions with Offscrub'
keywords: ['uninstall', 'microsoft', 'office', 'scrub', 'software']
description: 'This document describes a script that downloads offscrub files and uninstalls all versions of Microsoft Office from 2007 to 2016 & O365, handling machine or software corruption and removing app shortcuts.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

This script downloads the offscrub files from the repo and then attempts to uninstall all versions of Microsoft Office from 2007 to 2016 & O365. It can deal with machine or software corruption and completely removes Office app shortcuts for the version.

## Sample Run

![Sample Run](..\..\..\static\img\Microsoft-Office---Universal-Uninstaller-Param\image_1.png)

## Dependencies

[SWM - Software Uninstall - Invoke-OfficeScrub](https://proval.itglue.com/DOC-5078775-7593306)

## Variables

| Name                       | Description                                                                                                                                   |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Parameters                 | This contains the User input for Arguments parameter. If Arguments is empty then it sets it to -All, else the argument is passed to the uninstallation of the desired Office application. |

### User Parameters

| Name                       | Example | Required | Description                                                                                                                                   |
|----------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Arguments                  | -All   | False    | This parameter accepts the user input for the different Office uninstallation based on the argument list provided in the agnostic solution. |

## Implementation

This script is designed to run manually on Windows machines as per requirement.  
It can uninstall any variant of the Office based on the arguments passed in it.  
This script can be run anytime as it is completely silent and no restart is required after its completion.

## Output

- Script log  
- Local file on computer



