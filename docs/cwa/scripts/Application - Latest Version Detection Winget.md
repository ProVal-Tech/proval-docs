---
id: 'ffb77c6c-8dd7-4ca5-82a2-327b1658cbde'
title: 'Application - Latest Version Detection Winget'
title_meta: 'Application - Latest Version Detection Winget'
keywords: ['winget', 'application', 'version', 'packageid', 'script']
description: 'This document outlines a script designed to gather and store the latest version of applications supported by Winget in system properties, using the PackageID as the identifier for each application.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to gather the latest version of applications supported by Winget and store them in the system properties created with the name of the PackageID.

## Sample Run

![Sample Run](../../../static/img/Application---Latest-Version-Detection-Winget/image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                                                              |
|-------|--------------------------------------------------------------------------|
| psout | Contains the latest version number of the PackageID mentioned            |

### User Parameters

| Name       | Example                       | Required | Description                                                                                     |
|------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------|
| PackageID  | Microsoft.RemoteDesktopClient  | False    | The parameter passes the value to the script for the PackageID application version detection    |

### System Properties

| Name         | Example                       | Required | Description                                                                                     |
|--------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------|
| @PackageID@  | Microsoft.RemoteDesktopClient  | False    | This automatically gets created by the script once the PackageID version is detected with the PackageID name |

## Output

- Script log



