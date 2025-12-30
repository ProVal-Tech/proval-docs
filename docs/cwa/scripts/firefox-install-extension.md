---
id: 'ef0eede8-0b3c-4307-8d17-b99e4b80332a'
slug: /ef0eede8-0b3c-4307-8d17-b99e4b80332a
title: 'Mozilla Firefox - Extension - Install'
title_meta: 'Mozilla Firefox - Extension - Install'
keywords: ['firefox', 'extension', 'installation', 'configuration', 'setup']
description: 'This document provides a comprehensive guide on using a PowerShell script to install and optionally enforce a specific extension in Mozilla Firefox, detailing dependencies, user parameters, and the process involved in ensuring a successful installation.'
tags: ['firefox', 'installation', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

This script can be used to install and optionally enforce an extension in Mozilla Firefox.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/ef0eede8-0b3c-4307-8d17-b99e4b80332a/image_1.webp)

## Dependencies

- PowerShell v5
- Mozilla Firefox
- [Agnostic - Register-FirefoxExtension](/docs/db0512b5-70cd-4145-aa69-de84f9b1846d)

## Variables
| Variable Name      | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| @PS1DataLog@ |Helps to verify if the script actually succeeded. |
| @PS1ErrorLog@ | Helps to track the failure of the script. |

#### User Parameters

| Name              | Example   | Required | Description                                                |
|-------------------|-----------|----------|------------------------------------------------------------|
| ExtensionName    | Grammarly | True     | The name of the extension from the URL to install into Firefox. |
| Mandate          | 1         | False    | Use this switch to prevent the removal of the target add-on in Firefox. |


## Output

- Script log
- Local file on the computer