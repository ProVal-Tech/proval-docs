---
id: '64cddf50-a662-4745-b9d3-79f625be4ce1'
slug: /64cddf50-a662-4745-b9d3-79f625be4ce1
title: 'Mozilla Firefox - Set Homepage'
title_meta: 'Mozilla Firefox - Set Homepage'
keywords: ['firefox', 'homepage', 'registry', 'policy', 'windows']
description: 'This document details a script that adds a registry policy to enforce a specific homepage in Mozilla Firefox. It includes information on dependencies, user parameters, and the output generated by the script, which helps manage browser settings efficiently.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script adds the registry policy for an enforced homepage in Mozilla Firefox.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/64cddf50-a662-4745-b9d3-79f625be4ce1/image_1.webp)

## Dependencies

- Windows 10 1703+
- Mozilla Firefox installed
- [Set-FirefoxHomepage](/docs/09a48350-5bd8-4d4a-8436-d1aa46bcd92e)

## Variables

- `@PS1DataLog@` - Helps verify if the script succeeded.
- `@PS1ErrorLog@` - Helps track any failures of the script.

#### User Parameters

| Name                      | Example                           | Required | Description                                                                                      |
|---------------------------|-----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| -Homepage                 | [www.google.com](http://www.google.com/) | True     | The string value of the homepage to set in the browser.                                        |
| -EnforceHomepageStartup   | 1                                 | False    | Include this switch to force the homepage to be the only open tab at the startup of the browser. |

## Process

The script takes a string parameter to define the URL to set the homepage. The applicable registry policies are applied to set the homepage to the one defined by the parameter. Optionally, switches can be used to enforce the homepage on startup.

## Output

- Script log
- Local file on the computer