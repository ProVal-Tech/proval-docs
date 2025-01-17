---
id: ps-set-chromiumhomepage
title: 'Set-ChromiumHomepage'
title_meta: 'Set-ChromiumHomepage Command'
keywords: ['homepage', 'chromium', 'browser', 'configuration']
description: 'Documentation for the Set-ChromiumHomepage command to set and enforce the homepage in Chromium-based browsers.'
tags: ['chrome', 'web-browser']
draft: false
unlisted: false
---

## Description
Sets an enforced homepage in Certain Popular Chromium-based browsers.

## Usage
1. Checks for MDM enrollment policy, create if it doesn't exist.
2. Sets homepage and loading options as requested for each targeted browser.



```powershell
.\Set-ChromiumHomepage.ps1 -Target 'Chrome','Edge' -Homepage 'https://duckduckgo.com'
```
This will set the browser homepage to DuckDuckGo for Google Chrome and Microsoft Edge.

```powershell
.\Set-ChromiumHomepage.ps1 -Homepage "https://duckduckgo.com" -EnforceOnNewTab -EnforceHomepageStartup
```
This will set the browser homepage to DuckDuckGo and enforce that page on startup and on every new tab for all available supported chromium browsers.


## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Homepage`        |       | True      |           | String    | Holds the url to the desired homepage.                                          |
| `EnforceOnNewTab` |       | False     |           | Bool      | Applies the desired homepage url to every new tab.                                          |
| `EnforceHomepageStartup`  |   | False |           | Bool      | Applies the desired homepage on startup.                                          |
| `Target`          |       | False     |  All      | String[]  | This is a validate set of all supported Chromium based browsers.   |


## Output

    .\Set-ChromiumHomepage-log.txt









