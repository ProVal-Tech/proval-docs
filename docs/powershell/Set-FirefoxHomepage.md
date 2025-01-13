---
id: ps-set-firefoxhomepage
title: 'Set-FirefoxHomepage'
title_meta: 'Set-FirefoxHomepage Command'
keywords: ['homepage', 'firefox', 'browser', 'configuration']
description: 'Documentation for the Set-FirefoxHomepage command to set and enforce the homepage in Firefox.'
tags: ['configuration', 'firefox', 'web-browser']
draft: false
unlisted: false
---

## Description
Applies a homepage to Firefox.

## Usage
1. Sets up the JSON item
2. Applies the JSON item to the Firefox file.



```powershell
.\Set-FirefoxHomepage.ps1 -Homepage "https://duckduckgo.com" -EnforceHomepageStartup
```
This will set the homepage of Firefox to "https://duckduckgo.com" and set the browser Startup to be the homepage


## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Homepage`        |       | True      |           | String    | The Url to the desired homepage.                                          |
| `EnforceHomepageStartup`  |   | False |           | Bool      | Sets the browser to display the homepage on startup.                                          |


## Output
Location of output for log, result, and error files.

    .\Set-FirefoxHomepage-log.txt

