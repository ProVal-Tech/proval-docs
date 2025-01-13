---
id: 'cwa-hide-unhide-hidden-files'
title: 'Hide/Unhide Hidden Files Script'
title_meta: 'Hide/Unhide Hidden Files Script'
keywords: ['hidden', 'files', 'script', 'automation', 'parameter']
description: 'This document details a script that allows users to hide or unhide hidden files based on a specified input parameter. The script improves efficiency by automating the process of file visibility management, saving users valuable time.'
tags: ['configuration', 'windows', 'software', 'setup']
draft: false
unlisted: false
---
## Summary

The script will hide/unhide the hidden files based on the input parameter.

Time Saved by Automation: 2 Minutes

## Sample Run

![Sample Run](../../../static/img/Show-Hidden-Files---EnableDisable/image_1.png)

## Variables

#### User Parameters

| Name                  | Example | Required | Description                                          |
|-----------------------|---------|----------|------------------------------------------------------|
| Show hidden files     | N       | False    | Any text in here will display hidden files.         |

## Process

- The script checks the input in the user parameter "Show hidden files".
- If there is no input, it runs a PowerShell script and hides the hidden files.
- If there is any text in the user parameter, it will unhide the hidden files by running the PowerShell script.

## Output

- Script log




