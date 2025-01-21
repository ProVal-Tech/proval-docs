---
id: 'ea27a6a7-8b06-4120-b827-745121614aa8'
title: 'Add Registry Policy for Enforced Homepage in Microsoft Edge'
title_meta: 'Add Registry Policy for Enforced Homepage in Microsoft Edge'
keywords: ['registry', 'homepage', 'microsoft', 'edge', 'chromium', 'policy', 'enforcement']
description: 'This document outlines a script that adds a registry policy to enforce a specific homepage in Microsoft Edge (Chromium). It details the necessary dependencies, user parameters, and the process for executing the script, along with sample output and logs.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script adds the registry policy for an enforced homepage in Microsoft Edge (Chromium).

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Microsoft-Edge---Set-Homepage/image_1.png)

## Dependencies

- Windows 10 1703+
- Microsoft Edge
- [Set-EdgeHomepage](https://proval.itglue.com/DOC-5078775-7348072)

## Variables

- `@PS1DataLog@` - Helps to verify if the script actually succeeded.
- `@PS1ErrorLog@` - Helps to track the failure of the script.

#### User Parameters

| Name                       | Example                          | Required | Description                                                                                      |
|----------------------------|----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| -Homepage                  | [www.google.com](http://www.google.com/) | True     | The string value of the homepage to set in the browser.                                        |
| -EnforceOnNewTab          | 1                                | False    | Include this switch to force the homepage on each new tab instead of the new tab page.         |
| -EnforceHomepageStartup    | 1                                | False    | Include this switch to force the homepage to be the only open tab at the startup of the browser. |

## Process

The script takes a string parameter to define the URL to set the homepage to. The applicable registry policies are applied to set the homepage to the one defined by the parameter. Optionally, switches can be used to enforce the homepage on startup and to enforce the homepage on each new tab.

## Output

- Script log
- Local file on the computer

