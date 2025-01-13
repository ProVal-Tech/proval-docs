---
id: 'cwa-software-configuration-set-firefoxhomepage'
title: 'SWM - Software Configuration - Set Firefox Homepage'
title_meta: 'SWM - Software Configuration - Set Firefox Homepage'
keywords: ['firefox', 'homepage', 'configuration', 'software', 'browser']
description: 'This document describes an Automate implementation of the SWM - Software Configuration - Set-FirefoxHomepage script, which sets the default homepage for the Mozilla Firefox browser. It includes user parameters, sample run outputs, and dependencies.'
tags: ['configuration', 'software', 'firefox', 'update']
draft: false
unlisted: false
---
## Summary

It is an Automate implementation of the agnostic script [SWM - Software Configuration - Set-FirefoxHomepage](https://proval.itglue.com/DOC-5078775-7348110) to set the default homepage for the Mozilla Firefox browser.

## Sample Run

![Sample Run](../../../static/img/Mozilla-Firefox---Homepage---Set/image_1.png)

## Dependencies

[SWM - Software Configuration - Set-FirefoxHomepage](https://proval.itglue.com/DOC-5078775-7348110)

#### User Parameters

| Name                  | Example                           | Required | Description                                                                                     |
|-----------------------|-----------------------------------|----------|-------------------------------------------------------------------------------------------------|
| Homepage              | [https://www.provaltech.com](https://www.provaltech.com) | True     | String value of the homepage to set in the browser.                                           |
| EnforceHomepageStartup | 1                                 | False    | Set to 1 to force the homepage to be the only open tab at startup of the browser.             |

## Output

- Script Logs



