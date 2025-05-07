---
id: 'db0512b5-70cd-4145-aa69-de84f9b1846d'
slug: /db0512b5-70cd-4145-aa69-de84f9b1846d
title: 'Register-FirefoxExtension'
title_meta: 'Register-FirefoxExtension'
keywords: ['register', 'extension', 'firefox', 'browser']
description: 'Documentation for the Register-FirefoxExtension command to add and mandate an extension in the Firefox browser.'
tags: ['firefox', 'web-browser']
draft: false
unlisted: false
---

## Description
Adds an extension to the Firefox browser.

## Requirements
The name of the extension must be provided.

## Usage
1. Gets the provided extension name information.
2. Parses it to JSON.
3. Applies the values to the Firefox extensions file.

```powershell
.\Register-FirefoxExtension.ps1 -ExtensionName "ublock-origin" -Mandate
```
This command installs the uBlock Origin extension to Firefox and removes the rights to remove it.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionName`   |       | True      |           | String    | The name of the extension you wish to install. |
| `Mandate`         |       | False     |           | Bool      | Removes the right to remove the extension. |

## Output
The output log can be found at:

```
.\Register-FirefoxExtension-log.txt
```

