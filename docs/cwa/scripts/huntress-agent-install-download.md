---
id: 'da4215c4-8b16-4749-bdf8-61b6dfd393c1'
slug: /da4215c4-8b16-4749-bdf8-61b6dfd393c1
title: 'Huntress Agent Install - Download'
title_meta: 'Huntress Agent Install - Download'
keywords: ['huntress', 'agent', 'installation', 'windows', 'silent']
description: 'This document provides a detailed overview of a script that downloads and installs the Huntress Agent silently on a Windows machine, saving significant time through automation. It includes global parameters, process steps, and sample output.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script downloads and installs the Huntress Agent silently on the Windows machine.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/da4215c4-8b16-4749-bdf8-61b6dfd393c1/image_1.webp)

## Variables

### Global Parameters

| Name      | Example              | Required | Description                                                                                     |
|-----------|----------------------|----------|-------------------------------------------------------------------------------------------------|
| acct_key  | 1SA2345AASSSS234     | True     | This is the Account Key that determines which Huntress Account an Agent should be associated with. |

## Process

- Downloads the specific .exe file using the Account Key.
- Executes a batch script to install the Huntress Agent on the machine.
- Stores the output of the batch script in the variable: `@shellresult@`.

## Output

- Script log