---
id: 'b4c2b307-41af-4ebf-8132-9f883351b09b'
slug: /b4c2b307-41af-4ebf-8132-9f883351b09b
title: 'Windows 10 Upgrade Assistant'
title_meta: 'Windows 10 Upgrade Assistant'
keywords: ['windows', 'upgrade', 'assistant', 'installation', 'automation']
description: 'This document provides a comprehensive overview of a PowerShell script designed to download, install, and run the Windows 10 Upgrade Assistant Application, facilitating the upgrade of eligible devices to the latest Windows 10 version. It details the process, dependencies, and expected outcomes, highlighting the time saved by automation.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script will attempt to download, install, and run the Windows 10 Upgrade Assistant Application. It aims to upgrade the target device to the most recent version of Windows 10.

**Time Saved by Automation:** 120 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/b4c2b307-41af-4ebf-8132-9f883351b09b/image_1.webp)

## Dependencies

The target machine must be a Windows-based machine. This script may upgrade eligible devices running older Windows operating systems, such as Windows 7.

## Variables

`@PSout@` - The result from downloading and running the PowerShell script built into this script.

## Process

The script will execute a PowerShell script that downloads, installs, and runs the Windows 10 Upgrade Assistant. The script will output the results from the start of the application to the `@PSout@` variable.

The script will then pause for 2 minutes before checking if the `Windows10UpgraderApp` process is running. The upgrade process can take several hours, depending on the age of the device being updated. (The older the version of Windows, the longer this script may take, as it downloads the requirements for the latest build of Windows.)

If the process for the Windows 10 app exists, the script will exit successfully, indicating that the machine has begun the upgrade process. If the process is not running, the script will exit with an error, indicating that it failed to start the process and advising a review of the device to ensure it is eligible for the upgrade.

## Output

- Script log messages only