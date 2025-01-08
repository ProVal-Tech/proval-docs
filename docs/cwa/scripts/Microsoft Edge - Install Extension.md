---
id: 'cwa-enforce-edge-extensions'
title: 'Enforce Installation of Edge Extensions'
title_meta: 'Enforce Installation of Edge Extensions'
keywords: ['edge', 'extensions', 'chromium', 'installation', 'registry', 'mdm']
description: 'This document provides a detailed overview of a script designed to enforce the installation of specified extensions in the Chromium version of the Microsoft Edge browser. It outlines the dependencies, variables, user parameters, and the process involved in executing the script, ensuring a seamless installation experience for users.'
tags: ['configuration', 'installation', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This script is used to enforce the installation of an extension or list of extensions in the Chromium version of the Microsoft Edge browser.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8175231/images/11377573)

## Dependencies

- [Send-BitlockerADRecovery.ps1](https://file.provaltech.com/repo/script/Send-BitlockerADRecovery.ps1)
- [Register-EdgeExtension.ps1](https://file.provaltech.com/repo/script/Register-EdgeExtension.ps1)

## Variables

| Variable        | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| BaseURL          | It contains file server address                                             |
| WorkingDirectory  | It contains destination path where file server file is kept                |
| PS1URL           | This contains the file complete path in the file server for direct download |
| PS1Path          | This denotes the complete path where file is stored to local machine after downloading from file server |
| PS1TempPath      | This stores the downloaded file as a temporary to local system directory.   |
| PS1Log           | This stores the complete powershell execution log.                         |
| PS1DataLog       | This stores the powershell data log                                        |
| PS1ErrorLog      | This stores the powershell error log.                                      |

## User Parameters

| Name           | Example                                | Required | Description                                                |
|----------------|----------------------------------------|----------|------------------------------------------------------------|
| ExtensionIDs   | `cjpalhdlnbpafiamejdnhcphjbkeiagm`    | True     | This stores the required extension to be installed to Microsoft Edge. |

## Process

The script takes a single parameter which is an array of ExtensionIDs to install that can be found on the [Chrome Web Store](https://chrome.google.com/webstore/category/extensions). The script will then check if the machine is domain-joined. The Edge browser does not allow for registry policies to be applied to non-domain managed machines, so a dummy MDM-Enrollment registry set will be put in place to circumvent this restriction. The list of extensions is then cycled through. Existing blocking entries for the extension will be removed. A registry key is created for each installation. Any extensions that are detected to be already managed will be skipped, and a registry entry will not be created for them.

## Output

- Script log


