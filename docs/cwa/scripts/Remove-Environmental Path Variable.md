---
id: 'cwa-remove-environmental-path-variable'
title: 'Remove Environmental Path Variable'
title_meta: 'Remove Environmental Path Variable'
keywords: ['windows', 'environment', 'path', 'variable', 'remove', 'scope']
description: 'This document provides a method to remove a specified Windows path from the environmental path variable for a desired scope, including user and machine scoped options. It includes sample runs, dependencies, and parameter details.'
tags: ['windows', 'configuration', 'environment', 'variable', 'setup']
draft: false
unlisted: false
---
## Summary

Will remove a requested windows path from the environmental path variable for the desired scope.

## Sample Run

- To remove a user scoped environmental path variable item.

![Sample Run 1](..\..\..\static\img\Remove-Environmental-Path-Variable\image_1.png)

- To remove multiple machine scoped environmental path variable items.

![Sample Run 2](..\..\..\static\img\Remove-Environmental-Path-Variable\image_2.png)

NOTE: Scope is not mandatory and if left blank the scope will default to the machine scoped variable.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Remove-PathVariable](https://proval.itglue.com/DOC-5078775-11976271)

## Variables

Standard agnostic template variables apply.

#### User Parameters

| Name  | Example                  | Required | Description                                                                                     |
|-------|--------------------------|----------|-------------------------------------------------------------------------------------------------|
| Path  | C:\windows, C:\temp...  | True     | The paths that must be removed from the scoped environmental path variable.                    |
| Scope | User<br>Machine          | False    | The scope of the environmental path variable you wish to target.<br>This is defaulted to 'Machine' |

## Process

Please see agnostic content document [EPM - Windows Configuration - Agnostic - Remove-PathVariable](https://proval.itglue.com/DOC-5078775-11976271) for process information.

## Output

- Script log



