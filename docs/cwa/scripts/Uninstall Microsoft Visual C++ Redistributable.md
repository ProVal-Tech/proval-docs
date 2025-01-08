---
id: 'cwa-invoke-vcredistmodule-uninstall'
title: 'Invoke-VcRedistModule Uninstall Script for Microsoft Visual C++ Redistributable'
title_meta: 'Invoke-VcRedistModule Uninstall Script for Microsoft Visual C++ Redistributable'
keywords: ['automate', 'uninstall', 'visual', 'redistributable', 'microsoft', 'script']
description: 'This document details the implementation of the Invoke-VcRedistModule agnostic script for uninstalling Microsoft Visual C++ Redistributable using ConnectWise Automate. It provides an overview of the script functionality, sample runs, user parameters, and expected output.'
tags: ['uninstallation', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

An Automate implementation of the [Invoke-VcRedistModule](https://proval.itglue.com/DOC-5078775-15662701) agnostic script to uninstall Microsoft Visual C++ Redistributable. By default, the script will uninstall the unsupported redistributable unless a user parameter is set.

## Sample Run

![Sample Run](5078775/docs/15886925/images/23124491)

## Variables

| Name              | Description                      |
|-------------------|----------------------------------|
| ProjectName       | Invoke-VCRedistModule            |
| WorkingDirectory   | C:\ProgramData\_automation\script\Uninstall-VCRedist |

#### User Parameters

| Name     | Example                | Required | Description                                                             |
|----------|------------------------|----------|-------------------------------------------------------------------------|
| Release  | 2007<br>2007,2008,2012 | False    | Set the release id(s) of the Redistributable to remove.                |
| All      | 1                      | False    | Setting this parameter to 1 will remove all installed Redistributable from the computer. |

## Output

- Script Log

