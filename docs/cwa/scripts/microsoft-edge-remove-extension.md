---
id: 'a89ef3e3-2a5e-4b46-9286-1a2cf054011a'
slug: /a89ef3e3-2a5e-4b46-9286-1a2cf054011a
title: 'Microsoft Edge - Remove Extension'
title_meta: 'Microsoft Edge - Remove Extension'
keywords: ['edge', 'extension', 'unregister', 'chromium', 'windows']
description: 'This document outlines a script designed to remove the enforcement of the installation of specified extensions in the Chromium version of the Microsoft Edge browser. The process includes details on dependencies, variables, and the overall operation of the script, ensuring users can effectively manage their browser extensions.'
tags: ['security', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script is used to remove the enforcement of the installation of an extension or list of extensions in the Chromium version of the Microsoft Edge browser.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/a89ef3e3-2a5e-4b46-9286-1a2cf054011a/image_1.webp)

## Dependencies

- Windows 10 1703+
- Chromium Version of Microsoft Edge Installed
- [Project Script](https://file.provaltech.com/repo/@ProjectName@.ps1)

## Variables

| Variable Name     | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| ProjectName       | The name of the project; in this case, it would be Unregister-EdgeExtension.                   |
| Parameters        | This will take the ExtensionIDs.                                                                 |
| BaseURL           | The base URL here will be [https://file.provaltech.com/repo](https://file.provaltech.com/repo).|
| WorkingDirectory   | C:/ProgramData/provaltech/script/@ProjectName@.                                               |
| PS1URL            | @BaseURL@/script/@ProjectName@.ps1.                                                            |
| PS1Path           | @WorkingDirectory@/@ProjectName@.ps1.                                                          |
| PS1TempPath       | @WorkingDirectory@/@ProjectName@-temp.ps1.                                                    |
| PS1Log            | @WorkingDirectory@/@ProjectName@-log.txt.                                                      |
| PS1DataLog        | @WorkingDirectory@/@ProjectName@-data.txt.                                                    |
| PS1ErrorLog       | @WorkingDirectory@/@ProjectName@-errors.txt.                                                  |
| LogContent         | @PS1Log@                                                                                        |
| DataLogContent     | @PS1DataLog@                                                                                    |

#### Global Parameters

| Name              | Example                                          | Required | Description                                                                                     |
|-------------------|--------------------------------------------------|----------|-------------------------------------------------------------------------------------------------|
| ExtensionIDs      | cjpalhdlnbpafiamejdnhcphjbkeiagm                 | True     | The Extension ID or list of Extension IDs to remove from managed status.                       |

## Process

The script takes a single parameter, which is an array of Extension IDs to install that can be found on the [Chrome Web Store](https://chrome.google.com/webstore/category/extensions). The list of extensions is then cycled through, and install registry entries are removed from the policy section. Any extensions found to be currently unmanaged will be skipped. Blocking entries are then added to the registry to prevent future installation. To find an extension to unmanage, navigate to the page for that extension and copy the last portion of the URL for the Extension ID.

**Example:**

```
# UBlock Origin
# Extension Page URL: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
# ExtensionID: cjpalhdlnbpafiamejdnhcphjbkeiagm
```

## Output

- **Script log**
- The results of the script can be found in the `-log.txt` file generated by the script, located in the same directory as the script.

```
./Unregister-EdgeExtension-log.txt
```