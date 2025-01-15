---
id: ps-unregister-chromiumextension
title: 'Unregister-ChromiumExtension'
title_meta: 'Unregister-ChromiumExtension Command'
keywords: ['unregister', 'chromium', 'extension', 'remove']
description: 'Documentation for the Unregister-ChromiumExtension command to remove and block extensions in Chromium-based browsers.'
tags: ['chrome', 'web-browser', 'configuration']
draft: false
unlisted: false
---

## Description
Removes one or more extension(s) from popular Chromium based browsers and blocks the extensions.

## Requirements
An extension Id must be provided for the desired extension

## Usage
1. Ensures the block policy exist creates them if they don't
2. Adds the extension to the block policy
3. Removes the extension from the corresponding target allow policy



```powershell
.\Unregister-ChromeExtension.ps1 -Target 'Chrome','Edge' -ExtensionID 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This will remove uBlock Origin from the registered extensions and block the extension for the Google Chrome and Microsoft Edge browsers.

```powershell
.\Unregister-ChromeExtension.ps1 -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This will remove uBlock Origin, and Zoom Meetings from the registered extensions and block the extensions for all popular Chromium based browsers.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionID`     |       | True      |           | String    | Holds the extension Id for the target extension that you wish to remove.      |
| `Target`          |       | False     | Defaults to applying settings to all available targets   | String[]  |  Designates the target browser to add the extension to.  |

## Output

    .\Unregister-ChromiumExtension-log.txt




