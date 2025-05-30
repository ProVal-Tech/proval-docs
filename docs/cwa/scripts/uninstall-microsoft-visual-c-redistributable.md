---
id: '13cfc2e0-c088-424a-a1ab-5769b288a3a2'
slug: /13cfc2e0-c088-424a-a1ab-5769b288a3a2
title: 'Uninstall Microsoft Visual C++ Redistributable'
title_meta: 'Uninstall Microsoft Visual C++ Redistributable'
keywords: ['automate', 'uninstall', 'visual', 'redistributable', 'microsoft', 'script']
description: 'This document details the implementation of the Invoke-VcRedistModule agnostic script for uninstalling Microsoft Visual C++ Redistributable using ConnectWise Automate. It provides an overview of the script functionality, sample runs, user parameters, and expected output.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

An Automate implementation of the [Invoke-VcRedistModule](/docs/217e0b39-3b42-401b-9531-86e07f2d6a2f) agnostic script to uninstall Microsoft Visual C++ Redistributable. By default, the script will uninstall the unsupported redistributable unless a user parameter is set.

## Sample Run

![Sample Run](../../../static/img/docs/13cfc2e0-c088-424a-a1ab-5769b288a3a2/image_1.webp)

## Variables

| Name              | Description                      |
|-------------------|----------------------------------|
| ProjectName       | Invoke-VCRedistModule            |
| WorkingDirectory   | C:/ProgramData/_automation/script/Uninstall-VCRedist |

### User Parameters

| Name     | Example                | Required | Description                                                             |
|----------|------------------------|----------|-------------------------------------------------------------------------|
| Release  | 20072007,2008,2012     | False    | Set the release id(s) of the Redistributable to remove.                |
| All      | 1                      | False    | Setting this parameter to 1 will remove all installed Redistributables from the computer. |

## Output

- Script Log