---
id: 'e9295813-fbf2-43fe-b6a0-20da0ae7b21d'
slug: /e9295813-fbf2-43fe-b6a0-20da0ae7b21d
title: 'Unregister-FirefoxExtension'
title_meta: 'Unregister-FirefoxExtension'
keywords: ['unregister', 'firefox', 'extension', 'remove']
description: 'Documentation for the Unregister-FirefoxExtension command to remove and optionally block the reinstallation of a Firefox extension.'
tags: ['firefox', 'security', 'web-browser']
draft: false
unlisted: false
---

## Description
Removes the target extension from Mozilla Firefox with optional installation blocking.

## Requirements
The extension name must be provided.

## Usage
1. Gets the provided extension information.
2. Parses it to JSON format.
3. Applies the change to the Firefox file.

```powershell
.\Unregister-FirefoxExtension.ps1 -ExtensionName "ublock-origin" -Mandate
```
This command will remove uBlock Origin from the policy, uninstall it, and prevent its reinstallation.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionName`   |       | True      |           | String    | The name of the extension you wish to remove. |
| `Mandate`         |       | False     |           | Bool      | Blocks the reinstallation of the extension. |

## Output
The output will be logged in:

```
.\Unregister-FirefoxExtension-log.txt
```