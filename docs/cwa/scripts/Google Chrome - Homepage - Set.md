---
id: 'eebf8239-a9d5-462b-a7cf-72d9a50e1f14'
slug: /eebf8239-a9d5-462b-a7cf-72d9a50e1f14
title: 'Google Chrome - Homepage - Set'
title_meta: 'Google Chrome - Homepage - Set'
keywords: ['automate', 'chromium', 'homepage', 'configuration', 'browser']
description: 'This document provides an implementation guide for the SWM - Software Configuration - Set-ChromiumHomepage script, designed to enforce a specific homepage for the Google Chrome browser in a ConnectWise Automate environment. It includes user parameters, dependencies, and sample output to assist in effective deployment.'
tags: ['setup']
draft: false
unlisted: false
---

## Summary

This document outlines the Automate implementation of the agnostic script [SWM - Software Configuration - Set-ChromiumHomepage](<../../powershell/Set-ChromiumHomepage.md>), which enforces a homepage for the Google Chrome browser.

## Sample Run

![Sample Run](../../../static/img/Google-Chrome---Homepage---Set/image_1.png)

## Dependencies

Refer to the [SWM - Software Configuration - Set-ChromiumHomepage](<../../powershell/Set-ChromiumHomepage.md>) for additional details.

### User Parameters

| Name                     | Example                              | Required | Description                                                          |
|--------------------------|--------------------------------------|----------|----------------------------------------------------------------------|
| Homepage                 | [https://www.provaltech.com](https://www.provaltech.com) | True     | String value of the homepage to set in the browser.                 |
| EnforceOnNewTab         | 1                                    | False    | Set to 1 to force the homepage on each new tab instead of the new tab page. |
| EnforceHomepageStartup   | 1                                    | False    | Set to 1 to force the homepage to be the only open tab at startup of the browser. |

## Output

- Script Logs


