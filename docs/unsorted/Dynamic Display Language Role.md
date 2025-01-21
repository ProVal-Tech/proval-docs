---
id: '8d228f8e-c660-4127-a9b4-7f11381b8eec'
title: 'System Locale Detection'
title_meta: 'System Locale Detection'
keywords: ['locale', 'system', 'windows', 'program', 'output']
description: 'This document explains how to detect the system locale in Windows environments using a detection string. It highlights the importance of understanding locale settings for applications that depend on system outputs, particularly in scenarios where date formats and language settings vary by region.'
tags: ['performance', 'software', 'windows']
draft: true
unlisted: false
---

## Summary

This role shows the language used when displaying text in programs that do not support Unicode.

## Settings

| Detection String                                                                                                                                                                            | Comparator | Result                             | Applicable OS |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|------------------------------------|----------------|
| \{%@C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$locale = (systeminfo | findstr /B /C:'System Locale') -replace 'System Locale:',''; $locale.trim()"@%} | Exists     | en-us;English (United States)      | Windows        |

## Uses

This is helpful to be used in a solution that has dependencies on the system output of a program execution like PowerShell/shell, etc. For example, in the United States, the date format is “MM/DD/YYYY,” while in many European countries, it’s “DD/MM/YYYY.” The system locale setting is designed to accommodate these differences.

## Sample

![Sample Image](../../static/img/Dynamic-Display-Language-Role/image_1.png)

