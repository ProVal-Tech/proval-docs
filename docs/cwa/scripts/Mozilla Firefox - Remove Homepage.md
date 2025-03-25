---
id: '21929424-6cad-41b0-b039-ee798fc38ff7'
slug: /21929424-6cad-41b0-b039-ee798fc38ff7
title: 'Mozilla Firefox - Remove Homepage'
title_meta: 'Mozilla Firefox - Remove Homepage'
keywords: ['firefox', 'homepage', 'policy', 'script', 'windows']
description: 'This document outlines a script designed to remove the enforcement of a homepage in the Mozilla Firefox browser. It details the dependencies required, the process involved in scanning and removing homepage policies, and the expected output including logs for success and failure tracking.'
tags: ['firefox', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script is used to remove the enforcement of a homepage in the browser.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Mozilla-Firefox---Remove-Homepage/image_1.png)

## Dependencies

- Windows 10 1703+
- Mozilla Firefox
- [Remove-FirefoxHomepage](<../../powershell/Remove-FirefoxHomepage.md>)

## Variables

- `@PS1DataLog@` - Helps to verify if the script actually succeeded.
- `@PS1ErrorLog@` - Helps to track failures of the script.

## Process

The script will scan for and remove all homepage policies from the Firefox policies file. No actions will be taken if no policies are currently being enforced.

## Output

- Script log
- Local file on the computer


