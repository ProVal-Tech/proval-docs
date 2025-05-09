---
id: '6910db0c-af2e-4b19-a262-3c3491f01b73'
slug: /6910db0c-af2e-4b19-a262-3c3491f01b73
title: 'Unregister-ChromiumExtension'
title_meta: 'Unregister-ChromiumExtension'
keywords: ['unregister', 'chromium', 'extension', 'remove']
description: 'Documentation for the Unregister-ChromiumExtension command to remove and block extensions in Chromium-based browsers.'
tags: ['chrome', 'web-browser']
draft: false
unlisted: false
---

## Description
Removes one or more extension(s) from popular Chromium-based browsers and blocks the extensions.

## Requirements
An extension ID must be provided for the desired extension.

## Usage
1. Ensures the block policy exists and creates them if they don't.
2. Adds the extension to the block policy.
3. Removes the extension from the corresponding target allow policy.

```powershell
.\Unregister-ChromeExtension.ps1 -Target 'Chrome','Edge' -ExtensionID 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This will remove uBlock Origin from the registered extensions and block the extension for the Google Chrome and Microsoft Edge browsers.

```powershell
.\Unregister-ChromeExtension.ps1 -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This will remove uBlock Origin and Zoom Meetings from the registered extensions and block the extensions for all popular Chromium-based browsers.

## Parameters
| Parameter         | Alias | Required  | Default                                     | Type      | Description                                                                 |
| ----------------- | ----- | --------- | ------------------------------------------- | --------- | --------------------------------------------------------------------------- |
| `ExtensionID`     |       | True      |                                             | String    | Holds the extension ID for the target extension that you wish to remove.   |
| `Target`          |       | False     | Defaults to applying settings to all available targets | String[]  | Designates the target browser to add the extension to.                     |

## Output
```
.\Unregister-ChromiumExtension-log.txt
```