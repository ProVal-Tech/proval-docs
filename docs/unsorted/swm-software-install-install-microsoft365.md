---
id: 'b91e0ebd-2946-4030-bc43-a8eda4d885b1'
slug: /b91e0ebd-2946-4030-bc43-a8eda4d885b1
title: 'SWM - Software Install - Install-Microsoft365'
title_meta: 'SWM - Software Install - Install-Microsoft365'
keywords: ['microsoft', 'installation', 'office365', 'xml', 'odt']
description: 'This document provides a detailed guide on installing Microsoft 365 Apps for Business using PowerShell, including requirements, process steps, and example usage with XML configuration support.'
tags: ['installation', 'office365', 'software', 'windows']
draft: false
unlisted: false
---

## Overview

This guide enables the installation of Microsoft 365 Apps for Business or any Microsoft 365 product with XML configuration support.

## Requirements

- PowerShell 5+
- Windows 10+ / Server 2016+
- Must be run as an Administrator

## Process

1. Checks for elevated session privileges. If not elevated, it warns and exits.
2. Sets up the environment.
3. Checks if a custom XML configuration path is provided. If not, it creates a default configuration for Microsoft 365 Apps for Business installation.
4. Downloads and extracts the Office Deployment Tool (ODT) in a dedicated ODT folder within the script's directory.
5. Uses the ODT with the provided or default XML configuration to start the installation of Microsoft 365 Apps.
6. Cleans up the ODT folder after the installation is complete. Optionally, it restarts the computer if requested.

## Payload Usage

Example:

```
PS C:/> Install-Microsoft365.ps1 
# Installs Microsoft 365 Apps for Business with default configuration.

PS C:/> Install-Microsoft365.ps1 -XMLPath "C:/Path/To/config.xml"
# Installs Microsoft 365 using the specified local XML configuration file.

PS C:/> Install-Microsoft365.ps1 -XMLPath "https://contoso.com/config.xml" -Restart 
# Installs Microsoft 365 using the specified XML configuration file and restarts the computer.
```

### Parameters

| Parameter  | Alias | Required | Default | Type   | Description                         |
| ---------- | ----- | -------- | ------- | ------ | ----------------------------------- |
| `-XMLPath` |       | False    |         | String | The URL/path to the XML config file |
| `-Restart` |       | False    | $False  | Switch | Restart after the installation      |

## Output

```
./Install-Microsoft365-log.txt
./Install-Microsoft365-error.txt
```

