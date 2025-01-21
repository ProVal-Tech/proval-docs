---
id: '838d8f61-038e-4569-aaf1-c72a1072670a'
title: 'Set-Environmental Path Variable'
title_meta: 'Set-Environmental Path Variable'
keywords: ['windows', 'path', 'variable', 'environment', 'scope']
description: 'This document outlines the process for adding a requested Windows path to the environmental path variable for a specified scope, including user and machine options. It provides sample runs, dependencies, and detailed variable descriptions.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document will guide you through the process of adding a requested Windows path to the environmental path variable for the desired scope.

## Sample Run

- Setting a user-scoped path variable

![User Scoped Path Variable](../../../static/img/Set-Environmental-Path-Variable/image_1.png)

- Setting more than one machine-scoped path variable.

![Machine Scoped Path Variables](../../../static/img/Set-Environmental-Path-Variable/image_2.png)

**NOTE:** The scope is not mandatory; if left blank, the scope will default to the machine-scoped variable.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Set-PathVariable](<../../powershell/Set-PathVariable.md>)

## Variables

Standard agnostic template variables apply.

#### User Parameters

| Name  | Example                   | Required | Description                                                                                     |
|-------|---------------------------|----------|-------------------------------------------------------------------------------------------------|
| Path  | C:/windows, C:/temp...   | True     | The paths that must exist in the scoped environmental path variable.                           |
| Scope | UserMachine               | False    | The scope of the environmental path variable you wish to target. This defaults to 'Machine'.   |

## Process

Please reference [EPM - Windows Configuration - Agnostic - Set-PathVariable](<../../powershell/Set-PathVariable.md>) for process information.

## Output

- Script log



