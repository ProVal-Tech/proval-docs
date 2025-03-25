---
id: '91f1c2be-4667-4e81-b49a-fbc6f65cb9a4'
slug: /91f1c2be-4667-4e81-b49a-fbc6f65cb9a4
title: 'Agnostic - Install-SnapAgent'
title_meta: 'Agnostic - Install-SnapAgent'
keywords: ['snapagent', 'installer', 'windows', 'download', 'validation', 'installation', 'logging']
description: 'This document provides a comprehensive guide on installing SnapAgent on Windows computers using a PowerShell script. It outlines the requirements, process, parameters, and expected outputs, ensuring users can successfully install SnapAgent by providing the necessary URL.'
tags: ['installation', 'logging', 'software', 'windows']
draft: true
unlisted: false
---

## Overview

This document outlines the process to install SnapAgent on Windows computers.

## Requirements

- PowerShell v5+
- Installer package URL

## Process

1. Check if the URL is provided.
2. If not, log that the URL is missing.
3. If the URL is detected, download the `snap_agent_installer.exe` to the working directory `C:/ProgramData_automation/app/SnapAgent`.
4. Validate the downloaded installer package.
5. If the package is valid, execute the command to install it.
6. After execution, pause for 30 seconds and then validate whether SnapAgent is installed.
7. If SnapAgent is not found, check the installation directory `C:/Program Files (x86)/Blackpoint/SnapAgent/Snap_Agent.exe`.
8. If not found, log the error in the file `./Install-SnapAgent-Error.txt`.
9. If detected, execute SnapAgent from this location and monitor its appearance in the Programs and Features list three times with a delay of 60 seconds each.
10. If SnapAgent still does not appear, log the error in the file `./Install-SnapAgent-Error.txt`.
11. Throughout the process, log information to the `./Install-SnapAgent-Log.txt` file.

## Payload Usage

To install SnapAgent, a URL is necessary.

```
./Install-SnapAgent.ps1 -URL 'ProvideURL'
```

## Parameters

| Parameter | Alias | Required | Default | Type   | Description                                           |
|-----------|-------|----------|---------|--------|-------------------------------------------------------|
| URL       |       | True     |         | String | The URL needed to install the SnapAgent               |

## Output

- `./Install-SnapAgent-Log.txt`
- `./Install-SnapAgent-Error.txt`