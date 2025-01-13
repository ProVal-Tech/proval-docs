---
id: 'ps-logitech-unifying-software-installation'
title: 'Logitech Unifying Software Installation'
title_meta: 'Logitech Unifying Software Installation'
keywords: ['logitech', 'software', 'installation', 'unifying', 'driver']
description: 'This document provides a detailed guide on installing the Logitech Unifying Software, including requirements, sample runs, global parameters, dependencies, and process overview.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

This script will install the Logitech Unifying Software.

## Requirements

1. OS version requirements are set by the installer, reference installers OS requirements on the Logitech site.
2. URL download will depend on the required version and URL will need to be changed to match the desired version.

## Sample Run

![Sample Run](..\..\..\static\img\Logitech---Unifying-Software---Deploy\image_1.png)

## Global Parameter

| Name           | Example                                                                                                           | Remark | Description                                   |
|----------------|-------------------------------------------------------------------------------------------------------------------|--------|-----------------------------------------------|
| URL_Download   | [https://download01.logi.com/web/ftp/pub/techsupport/unifying/unifying252.exe](https://download01.logi.com/web/ftp/pub/techsupport/unifying/unifying252.exe) | True   | The URL to download the Unified software      |

## Dependencies

[https://download01.logi.com/web/ftp/pub/techsupport/unifying/unifying252.exe](https://download01.logi.com/web/ftp/pub/techsupport/unifying/unifying252.exe)  
It depends on the Logitech URL.  
The URL varies for different versions.

## Process

This script will install a specified Logitech Unifying Software version based on the URL provided in the Global Parameter.  
It has error handling to ensure the application installation is done successfully.

## Output

- Script log


