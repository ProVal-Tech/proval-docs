---
id: ps-set-firefoxhomepage
title: 'Set-FirefoxHomepage'
title_meta: 'Set-FirefoxHomepage Command'
keywords: ['homepage', 'firefox', 'browser', 'configuration']
description: 'Documentation for the Set-FirefoxHomepage command to set and enforce the homepage in Firefox.'
tags: ['firefox', 'web-browser']
draft: false
unlisted: false
---

## Description
Applies a homepage to Firefox.

## Usage
1. Sets up the JSON item.
2. Applies the JSON item to the Firefox file.

```powershell
.\Set-FirefoxHomepage.ps1 -Homepage "https://duckduckgo.com" -EnforceHomepageStartup
```
This command will set the homepage of Firefox to "https://duckduckgo.com" and configure the browser to display this homepage on startup.

## Parameters
| Parameter                   | Alias | Required | Default | Type   | Description                                                       |
|-----------------------------|-------|----------|---------|--------|-------------------------------------------------------------------|
| `Homepage`                  |       | True     |         | String | The URL to the desired homepage.                                 |
| `EnforceHomepageStartup`     |       | False    |         | Bool   | Sets the browser to display the homepage on startup.            |

## Output
Location of output for log, result, and error files.

```
.\Set-FirefoxHomepage-log.txt
```

