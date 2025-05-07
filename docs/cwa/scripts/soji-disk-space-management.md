---
id: '47f53d1e-f609-46f8-b407-ccdf11eeede4'
slug: /47f53d1e-f609-46f8-b407-ccdf11eeede4
title: 'Soji - Disk Space Management'
title_meta: 'Soji - Disk Space Management'
keywords: ['soji', 'script', 'automate', 'execution', 'logging']
description: 'This document describes the Soji execution script designed for ConnectWise Automate, detailing its functionality, dependencies, user parameters, process steps, and output results. The script facilitates the execution of the Soji application while managing necessary installations and logging outputs effectively.'
tags: ['installation', 'logging', 'software']
draft: false
unlisted: false
---

## Summary

This is an Automate script intended to execute the Soji application found in the GitHub repository.

## Sample Run

![Sample Run](../../../static/img/docs/47f53d1e-f609-46f8-b407-ccdf11eeede4/image_1.webp)

Please refer to the Soji documentation for argument options.

## Dependencies

- [Soji](https://github.com/ProVal-Tech/Soji)

### User Parameters

| Name      | Example                | Required | Description                                                                 |
|-----------|------------------------|----------|-----------------------------------------------------------------------------|
| Arguments | --drives c,f --json    | False    | Please refer to [Soji](https://github.com/ProVal-Tech/Soji) for argument usage. |

## Process

1. Install .NET 6 (if not installed)
2. Set up the environment and download Soji
3. Run Soji with the passed-in arguments
4. Compress the log files as `SojiLogs.zip` and upload them to the Automate server.

## Output

- Script log
- Desired file output to the Soji directory, e.g., JSON, etc.
- On LabTech server: `%LTShare%/Uploads/%ClientName%/%ComputerName% - %ComputerId%/SojiLogs.zip`
