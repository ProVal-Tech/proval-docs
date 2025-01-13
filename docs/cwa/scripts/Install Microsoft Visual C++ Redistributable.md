---
id: 'cwa-invoke-vcredistmodule'
title: 'Invoke-VcRedistModule for Automate'
title_meta: 'Invoke-VcRedistModule for Automate - Install Microsoft Visual C++ Redistributable'
keywords: ['automate', 'vcredist', 'installation', 'redistributable', 'script']
description: 'This document details an Automate implementation of the Invoke-VcRedistModule script, designed to install the Microsoft Visual C++ Redistributable. The script installs the supported redistributable by default but allows for user-defined parameters to customize the installation process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

An Automate implementation of the [Invoke-VcRedistModule](https://proval.itglue.com/DOC-5078775-15662701) agnostic script to install Microsoft Visual C++ Redistributable. By default, the script will install the supported redistributable unless a user parameter is set.

## Sample Run

![Sample Run](..\..\..\static\img\Install-Microsoft-Visual-C++-Redistributable\image_1.png)

## Variables

| Name              | Description                           |
|-------------------|---------------------------------------|
| ProjectName       | Invoke-VCRedistModule                 |
| WorkingDirectory   | C:\ProgramData\_automation\script\Install-VCRedist |

#### User Parameters

| Name     | Example               | Required | Description                                                                                   |
|----------|-----------------------|----------|-----------------------------------------------------------------------------------------------|
| Release  | 2019<br>2012,2013,2022 | False    | Set the release id(s) of the Redistributable to install.                                   |
| Purge    | 1                     | False    | Setting this parameter to 1 will remove the unsupported Redistributable and install the supported Redistributable. |


