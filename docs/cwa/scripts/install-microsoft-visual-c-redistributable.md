---
id: '3c808094-5ad4-4e14-9c57-0abc9fbc8ae2'
slug: /3c808094-5ad4-4e14-9c57-0abc9fbc8ae2
title: 'Install Microsoft Visual C++ Redistributable'
title_meta: 'Install Microsoft Visual C++ Redistributable'
keywords: ['automate', 'vcredist', 'installation', 'redistributable', 'script']
description: 'This document details an Automate implementation of the Invoke-VcRedistModule script, designed to install the Microsoft Visual C++ Redistributable. The script installs the supported redistributable by default but allows for user-defined parameters to customize the installation process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

An Automate implementation of the [Invoke-VcRedistModule](/docs/217e0b39-3b42-401b-9531-86e07f2d6a2f) agnostic script to install the Microsoft Visual C++ Redistributable. By default, the script will install the supported redistributable unless a user parameter is set.

## Sample Run

![Sample Run](../../../static/img/docs/3c808094-5ad4-4e14-9c57-0abc9fbc8ae2/image_1.webp)

## Variables

| Name              | Description                           |
|-------------------|---------------------------------------|
| ProjectName       | Invoke-VCRedistModule                 |
| WorkingDirectory   | C:/ProgramData/_automation/script/Install-VCRedist |

### User Parameters

| Name     | Example               | Required | Description                                                                                   |
|----------|-----------------------|----------|-----------------------------------------------------------------------------------------------|
| Release  | 20192012, 2013, 2022 | False    | Set the release id(s) of the Redistributable to install.                                   |
| Purge    | 1                     | False    | Setting this parameter to 1 will remove the unsupported Redistributable and install the supported Redistributable. |