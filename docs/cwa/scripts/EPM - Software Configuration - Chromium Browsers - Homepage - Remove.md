---
id: '8d741266-521f-4bdf-b921-9fe0c28a0648'
title: 'EPM - Software Configuration - Chromium Browsers - Homepage - Remove'
title_meta: 'EPM - Software Configuration - Chromium Browsers - Homepage - Remove'
keywords: ['chromium', 'homepage', 'registry', 'browser', 'configuration']
description: 'This document outlines an Automate implementation of a script designed to remove enforced homepage settings from Chromium-based browsers, specifically Google Chrome and Microsoft Edge. It details the parameters, sample runs, and dependencies for effective execution.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document presents an Automate implementation of the [SWM - Software Configuration - Remove-ChromiumHomepage](<../../powershell/Remove-ChromiumHomepage.md>) agnostic script to remove the registry policy for an enforced homepage in Chromium browsers. The supported browsers are `Google Chrome` and `Microsoft Edge`.

The `Browser` parameter can be used to specify the browser's name.

## Sample Run

- Removing the homepage from Google Chrome:  
  ![Google Chrome](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Remove/image_1.png)
  
- Removing the homepage from Microsoft Edge:  
  ![Microsoft Edge](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Remove/image_2.png)
  
- Removing the homepage from both Google Chrome and Microsoft Edge:  
  ![Both Browsers](../../../static/img/EPM---Software-Configuration---Chromium-Browsers---Homepage---Remove/image_3.png)

## Dependencies

[SWM - Software Configuration - Remove-ChromiumHomepage](<../../powershell/Remove-ChromiumHomepage.md>)

#### User Parameters

| Name    | Example | Required | Description                                                                                                                                                                                                                       |
|---------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Browser | Chrome  | False    | The 'Browser' parameter designates the browser for removing the homepage. Acceptable values are 'Chrome' and 'Edge'. If this parameter is left blank, the script will attempt to remove the homepage for both Chrome and Edge browsers. |

## Output

- Script Logs



