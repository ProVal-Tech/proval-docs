---
id: 'a1ee2dd1-6f31-4da2-bb85-0c52f7a6566e'
title: 'Microsoft Edge - Homepage - Set'
title_meta: 'Microsoft Edge - Homepage - Set'
keywords: ['automate', 'chromium', 'homepage', 'edge', 'configuration']
description: 'This document details the Automate implementation of the SWM - Software Configuration - Set-ChromiumHomepage script, which enforces a specific homepage for the Microsoft Edge (Chromium) browser. It includes user parameters, sample runs, and dependencies for successful execution.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the Automate implementation of the agnostic script [SWM - Software Configuration - Set-ChromiumHomepage](<../../powershell/Set-ChromiumHomepage.md>), which enforces a homepage for the Microsoft Edge (Chromium) browser.

## Sample Run

![Sample Run](../../../static/img/Microsoft-Edge---Homepage---Set/image_1.png)

## Dependencies

[SWM - Software Configuration - Set-ChromiumHomepage](<../../powershell/Set-ChromiumHomepage.md>)

#### User Parameters

| Name                     | Example                             | Required | Description                                                               |
|--------------------------|-------------------------------------|----------|---------------------------------------------------------------------------|
| Homepage                 | [https://www.provaltech.com](https://www.provaltech.com) | True     | String value of the homepage to set in the browser.                      |
| EnforceOnNewTab         | 1                                   | False    | Set to 1 to force the homepage on each new tab instead of the new tab page. |
| EnforceHomepageStartup    | 1                                   | False    | Set to 1 to force the homepage to be the only open tab at startup of the browser. |

## Output

- Script Logs



