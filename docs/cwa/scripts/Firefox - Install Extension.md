---
id: 'cwa-install-firefox-extension'
title: 'Install and Enforce Firefox Extension'
title_meta: 'Install and Enforce Firefox Extension'
keywords: ['firefox', 'extension', 'installation', 'configuration', 'setup']
description: 'This document provides a comprehensive guide on using a PowerShell script to install and optionally enforce a specific extension in Mozilla Firefox, detailing dependencies, user parameters, and the process involved in ensuring a successful installation.'
tags: ['firefox', 'installation', 'configuration', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

This script can be used to install and optionally enforce an extension in Mozilla Firefox.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8105009/images/11313616)

## Dependencies

- PowerShell v5
- Mozilla Firefox
- [Register-FirefoxExtension](https://proval.itglue.com/DOC-5078775-7247908)

## Variables

- `@PS1DataLog@` - Helps to verify if the script actually succeeded.
- `@PS1ErrorLog@` - Helps to track failure of the script.

#### User Parameters

| Name              | Example   | Required | Description                                                |
|-------------------|-----------|----------|------------------------------------------------------------|
| -ExtentionName    | Grammarly | True     | The name of the extension from the URL to install into Firefox. |
| -Mandate          | 1         | False    | Use this switch to prevent the removal of the target addon in Firefox. |

## Process

The script first confirms that Firefox is installed in one of two locations:

- `$env:ProgramFiles\Mozilla Firefox`
- `${env:ProgramFiles(x86)}\Mozilla Firefox`

If `firefox.exe` is not found in either location, the script will exit.

The script then makes a call to the Firefox Add-ons API to determine the GUID of the addon. This will be either a standard GUID format or an e-mail address. If the GUID is unable to be parsed, the script will exit.

The script will then create the `$env:ProgramFiles\Mozilla Firefox\distribution` folder if it does not exist.

The script then checks if a `policies.json` file already exists in the distribution folder. If it does not, then a new file is created with the proper deployment settings based on the parameters and the script exits. If the file does exist, then multiple sub-level checks occur to ensure that no existing data is removed, and the new settings are merged with the existing settings in a new `policies.json` file.

## Output

- Script log
- Local file on computer


