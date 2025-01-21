---
id: '9d906bff-cc45-4a2b-b0c5-8e9f97c396a2'
title: 'Install Cisco AnyConnect on Mac Agents'
title_meta: 'Install Cisco AnyConnect on Mac Agents'
keywords: ['cisco', 'anyconnect', 'mac', 'install', 'application']
description: 'This document provides a detailed guide for installing the Cisco AnyConnect application on Mac agents using a script. It includes information about the required files, process steps, and output logs, helping users automate the installation process efficiently.'
tags: ['application', 'installation', 'networking', 'software']
draft: false
unlisted: false
---

## Summary

This script will install the Cisco AnyConnect application on Mac agents.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Cisco-AnyConnect---MAC/image_1.png)

## Variables

`installers/360UW/Cisco-AnyConnect/anyconnect-macos-4-7-04056-predeploy-k9.dmg` — This script requires this file to be on LTShare.

| Variable       | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| MountedName    | This stores the name as a join of (/ + %shellresult% (up to the 2nd value after /) + ',' + /glip.app) |
| UnmountedName  | This stores the name as a join of (/ + %shellresult% (up to the 2nd value after /))   |

## Process

- Downloads the DMG package from LTShare. (The LTShare should have the file at Labtech/Transfer/installers/360UW/Cisco-AnyConnect/anyconnect-macos-4-7-04056-predeploy-k9.dmg).
- Once the download runs successfully, the script will attempt to install it on the Mac agent.
- It will set the Mount and Unmount names for the application and copy and detach the application respectively based on the Mount/Unmount names.

## Output

- Script log
