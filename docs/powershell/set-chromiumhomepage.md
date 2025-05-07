---
id: 'f07dd124-b64e-4906-8f33-5a2109ac73ab'
slug: /f07dd124-b64e-4906-8f33-5a2109ac73ab
title: 'Set-ChromiumHomepage'
title_meta: 'Set-ChromiumHomepage'
keywords: ['homepage', 'chromium', 'browser', 'configuration']
description: 'Documentation for the Set-ChromiumHomepage command to set and enforce the homepage in Chromium-based browsers.'
tags: ['chrome', 'web-browser']
draft: false
unlisted: false
---

## Description
Sets an enforced homepage in certain popular Chromium-based browsers.

## Usage
1. Checks for MDM enrollment policy; creates it if it doesn't exist.
2. Sets homepage and loading options as requested for each targeted browser.

```powershell
.\Set-ChromiumHomepage.ps1 -Target 'Chrome','Edge' -Homepage 'https://duckduckgo.com'
```
This command will set the browser homepage to DuckDuckGo for Google Chrome and Microsoft Edge.

```powershell
.\Set-ChromiumHomepage.ps1 -Homepage "https://duckduckgo.com" -EnforceOnNewTab -EnforceHomepageStartup
```
This command will set the browser homepage to DuckDuckGo and enforce that page on startup and on every new tab for all available supported Chromium browsers.

## Parameters
| Parameter                     | Alias | Required | Default | Type     | Description                                                       |
|-------------------------------|-------|----------|---------|----------|-------------------------------------------------------------------|
| `Homepage`                    |       | True     |         | String   | Holds the URL to the desired homepage.                            |
| `EnforceOnNewTab`             |       | False    |         | Bool     | Applies the desired homepage URL to every new tab.               |
| `EnforceHomepageStartup`      |       | False    |         | Bool     | Applies the desired homepage on startup.                          |
| `Target`                      |       | False    | All     | String[] | This is a validated set of all supported Chromium-based browsers. |

## Output

    .\Set-ChromiumHomepage-log.txt
