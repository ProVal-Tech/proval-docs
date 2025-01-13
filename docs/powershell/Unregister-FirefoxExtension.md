---
id: ps-unregister-firefoxextension
title: 'Unregister-FirefoxExtension'
title_meta: 'Unregister-FirefoxExtension Command'
keywords: ['unregister', 'firefox', 'extension', 'remove']
description: 'Documentation for the Unregister-FirefoxExtension command to remove and optionally block the reinstallation of a Firefox extension.'
tags: ['security', 'web-browser', 'configuration', 'firefox']
draft: false
unlisted: false
---

## Description
Removes the target extension from Mozilla Firefox with optional installation blocking.

## Requirements
The extension name must be provided

## Usage
1. Gets the provided extension information
2. Parses it to json format
3. Applies the change to firefox file.



```powershell
.\Unregister-FirefoxExtension.ps1 -ExtensionName "ublock-origin" -Mandate
```
This will remove uBlock Origin from the policy, uninstall it, and prevent its reinstallation.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionName`   |       | True      |           | String    | The name of the extension you wish to remove.                                          |
| `Mandate`         |       | False     |           | Bool      | Blocks the reinstallation of the extension.                                          |


## Output

    .\Unregister-FirefoxExtension-log.txt

