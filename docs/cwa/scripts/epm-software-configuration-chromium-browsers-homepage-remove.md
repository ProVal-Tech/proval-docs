---
id: '8d741266-521f-4bdf-b921-9fe0c28a0648'
slug: /8d741266-521f-4bdf-b921-9fe0c28a0648
title: 'Chromium Browsers - Homepage - Remove'
title_meta: 'Chromium Browsers - Homepage - Remove'
keywords: ['chromium', 'homepage', 'registry', 'browser', 'configuration']
description: 'This document outlines an Automate implementation of a script designed to remove enforced homepage settings from Chromium-based browsers, specifically Google Chrome and Microsoft Edge. It details the parameters, sample runs, and dependencies for effective execution.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document presents an Automate implementation of the [Remove-ChromiumHomepage](/docs/38674bcd-8b19-4072-a58f-314efad2e856  ) agnostic script to remove the registry policy for an enforced homepage in Chromium browsers. The supported browsers are `Google Chrome` and `Microsoft Edge`.

The `Browser` parameter can be used to specify the browser's name.

## Sample Run

- Removing the homepage from Google Chrome:  
  ![Google Chrome](../../../static/img/docs/8d741266-521f-4bdf-b921-9fe0c28a0648/image_1.webp)
  
- Removing the homepage from Microsoft Edge:  
  ![Microsoft Edge](../../../static/img/docs/8d741266-521f-4bdf-b921-9fe0c28a0648/image_2.webp)
  
- Removing the homepage from both Google Chrome and Microsoft Edge:  
  ![Both Browsers](../../../static/img/docs/8d741266-521f-4bdf-b921-9fe0c28a0648/image_3.webp)

## Dependencies

[Remove-ChromiumHomepage](/docs/38674bcd-8b19-4072-a58f-314efad2e856  )

## User Parameters

| Name    | Example | Required | Description                                                                                                                                                                                                                       |
|---------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Browser | Chrome  | False    | The 'Browser' parameter designates the browser for removing the homepage. Acceptable values are 'Chrome' and 'Edge'. If this parameter is left blank, the script will attempt to remove the homepage for both Chrome and Edge browsers. |

## Output

- Script Logs