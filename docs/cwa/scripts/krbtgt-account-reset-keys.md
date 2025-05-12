---
id: 'a6e7a255-6d3e-4c00-bea0-636533914cbc'
slug: /a6e7a255-6d3e-4c00-bea0-636533914cbc
title: 'KRBTGT Account - Reset Keys'
title_meta: 'KRBTGT Account - Reset Keys'
keywords: ['active-directory', 'reset', 'krbtgt', 'account', 'script']
description: 'This document provides a streamlined script for resetting the KRBTGT Active Directory account. It includes a sample run, dependencies, and output details, while emphasizing the need for caution when executing the script.'
tags: ['active-directory', 'security']
draft: false
unlisted: false
---

## Summary

This document presents a script used to reset the KRBTGT Active Directory account, adapted from [New-KrbtgtKeys.ps1](https://github.com/microsoft/New-KrbtgtKeys.ps1/blob/master/New-KrbtgtKeys.ps1).

This script is provided "without warranty." 

It is essentially a streamlined version of the adapted script designed to always run the live account reset, with some modernization of PowerShell included. 

Due to this, results are not guaranteed. If at all possible, the script should always be run manually, and logins should be immediately tested. 

**YOU HAVE BEEN WARNED**

## Sample Run

![Sample Run](../../../static/img/docs/a6e7a255-6d3e-4c00-bea0-636533914cbc/image_1.webp)

## Dependencies

- [RSM - Active Directory - Agnostic - Reset-KrbtgtKeys](/docs/ae748a86-1683-4d69-9c96-17a6a8f79950)

## Process

See [RSM - Active Directory - Agnostic - Reset-KrbtgtKeys](/docs/ae748a86-1683-4d69-9c96-17a6a8f79950) for process details.

## Output

- Script log
- Local file on the computer