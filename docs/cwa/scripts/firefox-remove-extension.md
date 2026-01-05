---
id: 'dcffd758-d8cc-46a4-b7d7-cd34b7fd4953'
slug: /dcffd758-d8cc-46a4-b7d7-cd34b7fd4953
title: 'Mozilla Firefox - Extension - Remove'
title_meta: 'Mozilla Firefox - Extension - Remove'
keywords: ['firefox', 'extension', 'remove', 'block', 'addons', 'policies']
description: 'This document provides a detailed overview of a script designed to remove and optionally block a specified extension in Mozilla Firefox. It includes information on dependencies, user parameters, and the processing steps involved in executing the script, ensuring users can effectively manage Firefox extensions.'
tags: ['firefox', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

This script can be used to remove and optionally block an extension in Mozilla Firefox.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/dcffd758-d8cc-46a4-b7d7-cd34b7fd4953/image_1.webp)

## Dependencies

- PowerShell v5
- Mozilla Firefox
- [Agnostic - Unregister-FirefoxExtension](/docs/e9295813-fbf2-43fe-b6a0-20da0ae7b21d)

## Variables

| Variable Name      | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| @PS1DataLog@ |Helps to verify if the script actually succeeded. |
| @PS1ErrorLog@ | Helps to track the failure of the script. |

### User Parameters

| Name               | Example   | Required | Description                                                                 |
|--------------------|-----------|----------|-----------------------------------------------------------------------------|
| ExtensionName     | Grammarly | True     | The name of the extension from the URL to remove from Firefox.             |
| Mandate           | 1         | False    | Use this switch to prevent future installation of the target addon in Firefox.|


## Output

- Script log
- Local file on computer