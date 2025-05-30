---
id: '19cf3c3f-14e2-40a0-86c3-735b614a9331'
slug: /19cf3c3f-14e2-40a0-86c3-735b614a9331
title: 'Deploy - KB5005394 - Out of Band Patch'
title_meta: 'Deploy - KB5005394 - Out of Band Patch'
keywords: ['kb5005394', 'patch', 'windows', 'update', 'installation']
description: 'This document describes a script designed to install the KB5005394 Out of Band Patch if it is not already installed. It includes prerequisite verification and may require multiple reboots during the installation process. The script ensures that the system is ready for the update and logs the outcomes of each step.'
tags: ['installation', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script will install KB5005394 - Out of Band Patch only if it is not already installed. It will fulfill and verify the prerequisites as well. The script may reboot the computer multiple times: it will reboot after the installation of the patch, and a reboot may be performed prior to installation if the computer is in a reboot pending state.

**Time Saved by Automation:** 20 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/19cf3c3f-14e2-40a0-86c3-735b614a9331/image_1.webp)

## Variables

- **@PFolder@**: A global variable storing the path to download the update file.
- **@Reason@**: Stores and logs the download failure, either of the prerequisite or the primary update.
- **@FailureReason@**: Stores and logs the installation failure of the primary update.
- **@OSVersion@**: Stores the operating system version of Windows 10 machines.
- **@RP@**: Used to check if the machine is reboot pending or not.
- **@PrereqCheck@**: Stores the output of the PowerShell script used to verify the installation of required patches in order to install the primary patch.

#### Script States

| Name      | Example   | Description                                                        |
|-----------|-----------|--------------------------------------------------------------------|
| KB5005394 | Installed | Installed, Failed, or Download Failed depends on the output of the script. |

## Process

- Exits if KB5005394 is already installed.
- Verifies the OS; if it's Windows Server 2019 or Windows 10 (1809), the script will proceed; otherwise, it exits.
- Will reboot the computer if it's already reboot pending.
- Will download and install July's SSU after verifying the absence of the required SSU.
- The KB5005394 will be downloaded and installed.
- Checks the installation's outcome.
- Modifies the script's state according to the outcome.

## Output

- Script log
- Script state