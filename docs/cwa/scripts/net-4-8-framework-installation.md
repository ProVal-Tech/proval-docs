---
id: 'bc595922-1293-432f-9b30-4a246d517606'
slug: /bc595922-1293-432f-9b30-4a246d517606
title: '.NET 4.8 Framework installation'
title_meta: '.NET 4.8 Framework installation'
keywords: ['dotnet', 'installation', 'reboot', 'version']
description: 'This document describes a script that checks the installed version of .NET Framework on a machine. If version 4.8 is not present, the script will install it and reboot the machine if specified. It also provides details on user parameters and output logs.'
tags: ['dotnet', 'installation', 'reboot', 'windows']
draft: false
unlisted: false
---

## Summary

The script checks the version of .NET. If version 4.8 is not installed on the machine, it will install it. The machine will also reboot after the installation if the Reboot parameter is set to 1 for a complete installation.

## Sample Run

![Sample Run](../../../static/img/docs/bc595922-1293-432f-9b30-4a246d517606/image_1.png)

## Variables

| Name              | Description                                               |
|-------------------|-----------------------------------------------------------|
| FrameWorkStatus    | This stores the .NET Framework 4.8 installation status.  |

### User Parameters

| Name    | Example | Required | Description                                                                                      |
|---------|---------|----------|--------------------------------------------------------------------------------------------------|
| Reboot  | 1       | False    | If this is set to 1, the agent will be restarted for the complete installation of the .NET Framework 4.8. |

## Output

- Script log

