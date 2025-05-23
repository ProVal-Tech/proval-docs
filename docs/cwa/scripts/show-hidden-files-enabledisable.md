---
id: 'be2a3cab-5528-4b53-a636-713198b10fa1'
slug: /be2a3cab-5528-4b53-a636-713198b10fa1
title: 'Show Hidden Files - EnableDisable'
title_meta: 'Show Hidden Files - EnableDisable'
keywords: ['hidden', 'files', 'script', 'automation', 'parameter']
description: 'This document details a script that allows users to hide or unhide hidden files based on a specified input parameter. The script improves efficiency by automating the process of file visibility management, saving users valuable time.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script will hide or unhide hidden files based on the input parameter.

**Time Saved by Automation:** 2 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/be2a3cab-5528-4b53-a636-713198b10fa1/image_1.webp)

## Variables

#### User Parameters

| Name                  | Example | Required | Description                                          |
|-----------------------|---------|----------|------------------------------------------------------|
| Show hidden files     | N       | False    | Any text entered here will display hidden files.     |

## Process

- The script checks the input in the user parameter "Show hidden files."
- If there is no input, it runs a PowerShell script to hide the hidden files.
- If there is any text in the user parameter, it will unhide the hidden files by running the PowerShell script.

## Output

- Script log