---
id: ps-register-firefoxextension
title: 'Register-FirefoxExtension'
title_meta: 'Register-FirefoxExtension Command'
keywords: ['register', 'extension', 'firefox', 'browser']
description: 'Documentation for the Register-FirefoxExtension command to add and mandate an extension in the Firefox browser.'
tags: ['configuration', 'firefox', 'web-browser']
draft: false
unlisted: false
---
## Description
Adds an extension to the Firefox browser.

## Requirements
The name of the extension must be provided.

## Usage
1. Gets the provided extension name information.
2. Parses it to json
3. Applies the values to the firefox extensions file.



```powershell
.\Register-FirefoxExtension.ps1 -ExtensionName "ublock-origin" -Mandate
```
Installs the ublock-origin extension to firefox and removes the rights to remove it.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionName`   |       | True      |           | String    | The name of the extension you wish to install.                                          |
| `Mandate`         |       | False     |           | Bool      | Removes the right to remove the extension.                                          |


## Output

    .\Register-FirefoxExtension-log.txt

