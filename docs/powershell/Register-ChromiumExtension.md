---
id: '481992c0-adcd-4275-bd5c-aa59fd4a7b17'
title: 'Register-ChromiumExtension'
title_meta: 'Register-ChromiumExtension'
keywords: ['register', 'extension', 'chromium', 'browser']
description: 'Documentation for the Register-ChromiumExtension command to add and mandate extensions in Chromium-based browsers.'
tags: ['chrome', 'web-browser']
draft: false
unlisted: false
---

## Description
Adds one or more extensions to popular Chromium-based browsers.

## Requirements
The Extension URL ID must be obtained from the store.

## Usage
1. Verifies and adds an MDM policy if one doesn't exist.
2. Determines if the app is currently being blocked and removes it if present.
3. Adds the extension to the target browser(s) force list.

```powershell
.\\Register-ChromeExtension.ps1 -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This command will add uBlock Origin and Zoom Meetings to the registered extensions in the force list for all popular Chromium-based browsers.

```powershell
.\\Register-ChromeExtension.ps1 -Target 'Chrome' -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```
This command will add uBlock Origin and Zoom Meetings to the registered extensions in the force list for just the Chrome browser.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionID`     |       | True      |           | String[]  | Holds the URL ID values for the desired extensions to install. |
| `Target`          |       | False     | Defaults to applying settings to all available targets | String[]  | Designates the target browser to add the extension to. |

## Output
The output will be logged in the following file:
```
.\\Register-ChromiumExtension-log.txt
```



