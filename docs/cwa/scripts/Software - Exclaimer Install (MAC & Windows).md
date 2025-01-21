---
id: '8c3f58b7-7680-45c3-8f40-1e9c27001136'
title: 'Install Exclaimer on MAC and Windows'
title_meta: 'Install Exclaimer on MAC and Windows'
keywords: ['exclaimer', 'mac', 'windows', 'installation', 'automation']
description: 'This document provides a comprehensive guide on how to install the Exclaimer application on both MAC and Windows operating systems. It outlines the dependencies, process, and expected output of the installation script, helping users save time through automation.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script will install Exclaimer on both MAC and Windows.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Software---Exclaimer-Install-(MAC-&-Windows)/image_1.png)

## Dependencies

- **Windows Exclaimer Download link:** [Exclaimer for Windows](https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi)  
- **MAC Exclaimer Download link:** [Exclaimer for MAC](https://outlookclient.exclaimer.net/csua/Exclaimer%20Signature%20Agent-1.1.0.83.dmg)

## Variables

| Variable      | Description                                      |
|---------------|--------------------------------------------------|
| MountedName   | Exclaimer Signature Agent (MAC Installer Name)   |

## Process

1. This script will check for the operating system first.
2. If the OS is Windows, it will check if Exclaimer is already installed.
3. If not installed, it will proceed with the installation and recheck to confirm.
4. If the OS is MAC, it will install the MAC Exclaimer after confirming whether it is already installed or not.
5. For Linux, the script will exit without any action.

## Output

- Script log
