---
id: 'cwa-add-windows-path-variable'
title: 'Add Windows Path Variable'
title_meta: 'Add Windows Path Variable'
keywords: ['windows', 'path', 'variable', 'environment', 'scope']
description: 'This document outlines the process for adding a requested Windows path to the environmental path variable for a specified scope, including user and machine options. It provides sample runs, dependencies, and detailed variable descriptions.'
tags: ['configuration', 'windows', 'setup']
draft: false
unlisted: false
---
## Summary

Will add a requested windows path to the environmental path variable for the desired scope.

## Sample Run

- Setting a User scoped path variable

![User Scoped Path Variable](5078775/docs/11976251/images/16791832)

- Setting more than one machine scoped path variables.

![Machine Scoped Path Variables](5078775/docs/11976251/images/16791887)

**NOTE:**  Scope is not mandatory and if left blank the scope will default to the machine scoped variable.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Set-PathVariable](https://proval.itglue.com/DOC-5078775-11976265)

## Variables

Standard agnostic template variables apply.

#### User Parameters

| Name  | Example                   | Required | Description                                                                                     |
|-------|---------------------------|----------|-------------------------------------------------------------------------------------------------|
| Path  | C:\windows, C:\temp...   | True     | The paths that must exist in the scoped environmental path variable.                           |
| Scope | User<br>Machine           | False    | The scope of the environmental path variable you wish to target.<br>This is defaulted to 'Machine' |

## Process

Please reference [EPM - Windows Configuration - Agnostic - Set-PathVariable](https://proval.itglue.com/DOC-5078775-11976265) for process information.

## Output

- Script log


