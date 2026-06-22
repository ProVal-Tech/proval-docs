---
id: '5d0c2d2f-db22-48ad-9231-39f851dc1ec9'
slug: /5d0c2d2f-db22-48ad-9231-39f851dc1ec9
title: 'Chromium Browser Extension'
title_meta: 'Chromium Browser Extension'
keywords: ['register', 'extension', 'chromium', 'browser']
description: 'Adds one or more extensions to popular Chromium-based browsers.'
tags: ['chrome', 'web-browser', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-19
---

## Overview

This script is used to register and install Chromium-based browser extensions. It supports the following browsers: Google Chrome, Microsoft Edge, Chromium, Brave, Vivaldi, and Opera.

## Dependencies

- [Agnostic Script - Register-ChromiumExtension](/docs/481992c0-adcd-4275-bd5c-aa59fd4a7b17)

## Implementation  

1. Download the component `Chromium Browser Extension` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/5d0c2d2f-db22-48ad-9231-39f851dc1ec9/import.webp)  

## Sample Run

To execute the `Chromium Browser Extension` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Chromium Browser Extension` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/5d0c2d2f-db22-48ad-9231-39f851dc1ec9/QuickJob.webp)  

3. Search the component `Chromium Browser Extension` and click on `Select`
 ![Image 3](../../../static/img/docs/5d0c2d2f-db22-48ad-9231-39f851dc1ec9/find.webp)

4. ![Image 4](../../../static/img/docs/5d0c2d2f-db22-48ad-9231-39f851dc1ec9/browser-extention.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| ExtensionID | String | -- | Holds the URL ID values for the desired extensions to install. |
| Target | String | -- | Designates the target browser to add the extension to. Chromium, Chrome, Edge, Brave, Vivaldi, Opera |

## Output

Activity log

## Attachments  

[Chromium Browser Extension](../../../static/attachments/chromiumbrowserextension.cpt)

## Changelog
 
### 2026-06-19
 
- Initial version of the document.
