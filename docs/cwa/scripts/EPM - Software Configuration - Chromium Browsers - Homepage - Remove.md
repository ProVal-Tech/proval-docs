---
id: 'cwa-remove-chromium-homepage'
title: 'Remove Chromium Homepage Configuration'
title_meta: 'Remove Chromium Homepage Configuration'
keywords: ['chromium', 'homepage', 'registry', 'browser', 'configuration']
description: 'This document outlines an Automate implementation of a script designed to remove enforced homepage settings from Chromium-based browsers, specifically Google Chrome and Microsoft Edge. It details the parameters, sample runs, and dependencies for effective execution.'
tags: ['configuration', 'browser', 'windows', 'software', 'update']
draft: false
unlisted: false
---
## Summary

It is an Automate implementation of the [SWM - Software Configuration - Remove-ChromiumHomepage](https://proval.itglue.com/DOC-5078775-10372205) agnostic script to remove the registry policy for an enforced homepage in Chromium Browsers. Supported Browsers are `Google Chrome`, and `Microsoft Edge`.

The `Browser` parameter can be used to specify the browser's name.

## Sample Run

- Removing the homepage from Google Chrome:  
  ![Google Chrome](5078775/docs/14985325/images/21675701)
  
- Removing the homepage from Microsoft Edge:  
  ![Microsoft Edge](5078775/docs/14985325/images/21675718)
  
- Removing the homepage from both Google Chrome and Microsoft Edge:  
  ![Both Browsers](5078775/docs/14985325/images/21675744)

## Dependencies

[SWM - Software Configuration - Remove-ChromiumHomepage](https://proval.itglue.com/DOC-5078775-10372205)

#### User Parameters

| Name    | Example | Required | Description                                                                                                                                                                                                                       |
|---------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Browser | Chrome  | False    | The 'Browser' parameter designates the browser for removing the homepage. Acceptable values are 'Chrome' and 'Edge'. If this parameter is left blank, the script will attempt to remove the homepage for both Chrome and Edge browsers. |

## Output

- Script Logs

