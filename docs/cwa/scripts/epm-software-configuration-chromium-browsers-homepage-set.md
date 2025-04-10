---
id: 'e5c01410-3731-4b1c-b166-235d637c44bb'
slug: /e5c01410-3731-4b1c-b166-235d637c44bb
title: 'EPM - Software Configuration - Chromium Browsers - Homepage - Set'
title_meta: 'EPM - Software Configuration - Chromium Browsers - Homepage - Set'
keywords: ['chromium', 'homepage', 'browser', 'configuration', 'edge', 'chrome']
description: 'This document outlines the implementation of the SWM - Software Configuration - Set-ChromiumHomepage script for enforcing a homepage in Chromium-based browsers like Google Chrome and Microsoft Edge. It details the parameters, sample runs, and dependencies needed for effective usage.'
tags: ['chrome', 'edge', 'setup']
draft: false
unlisted: false
---

## Summary

This document presents an automated implementation of the agnostic script [SWM - Software Configuration - Set-ChromiumHomepage](/docs/f07dd124-b64e-4906-8f33-5a2109ac73ab) to enforce a homepage for Chromium-based browsers. The supported browsers are `Google Chrome` and `Microsoft Edge`.

The `Browser` parameter can be used to specify the browser's name.

## Sample Run

- Setting [https://www.provaltech.com](https://www.provaltech.com) as Google Chrome's homepage:  
  ![Image](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Set/image_1.png)

- Setting [https://www.provaltech.com](https://www.provaltech.com) as Microsoft Edge's homepage:  
  ![Image](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Set/image_2.png)

- Setting [https://www.provaltech.com](https://www.provaltech.com) as the homepage for both Microsoft Edge and Google Chrome:  
  ![Image](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Set/image_3.png)

## Dependencies

[SWM - Software Configuration - Set-ChromiumHomepage](/docs/f07dd124-b64e-4906-8f33-5a2109ac73ab)

#### User Parameters

| Name                     | Example                                               | Required | Description                                                                                                      |
|--------------------------|-------------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------------|
| Browser                  | Chrome                                                | False    | The 'Browser' parameter specifies the browser for setting the homepage. Acceptable values are 'Chrome' and 'Edge'. If this parameter is left blank, the script will attempt to set the homepage for both browsers. |
| Homepage                 | [https://www.provaltech.com/](https://www.provaltech.com/) | True     | The string value of the homepage to set in the browser.                                                         |
| EnforceOnNewTab         | 1                                                     | False    | Set to 1 to force the homepage on each new tab instead of the new tab page.                                    |
| EnforceHomepageStartup   | 1                                                     | False    | Set to 1 to force the homepage to be the only open tab at the startup of the browser.                           |

## Output

- Script Logs




