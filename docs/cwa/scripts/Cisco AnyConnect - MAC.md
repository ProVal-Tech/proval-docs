---
id: '9d906bff-cc45-4a2b-b0c5-8e9f97c396a2'
title: 'Install Cisco Anyconnect on Mac Agents'
title_meta: 'Install Cisco Anyconnect on Mac Agents'
keywords: ['cisco', 'anyconnect', 'mac', 'install', 'application']
description: 'This document provides a detailed guide for installing the Cisco Anyconnect application on Mac agents using a script. It includes information about the required files, process steps, and output logs, helping users automate the installation process efficiently.'
tags: ['installation', 'mac', 'application', 'networking', 'software']
draft: false
unlisted: false
---
## Summary

This script will install the Cisco Anyconnect application on Mac agents.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Cisco-AnyConnect---MAC/image_1.png)

## Variables

`installers/360UW/Cisco-AnyConnect/anyconnect-macos-4-7-04056-predeploy-k9.dmg` -- This script requires this file to be on LTshare.

| Variable       | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| MountedName    | This stores name as join of (/ + %shellresult% (till 2nd value after /) + ',' + /glip.app) |
| UnmountedName  | This stores name as join of (/ + %shellresult% (till 2nd value after /) )   |

## Process

- Downloads the dmg package from the LTShare. (The ltshare should have the file at Labtech/Transfer/installers/360UW/Cisco-AnyConnect/anyconnect-macos-4-7-04056-predeploy-k9.dmg).
- Once the download runs successfully, the script will attempt to install it on MAC agent.
- It will set the Mount and Unmount name for the application and copy and detach application respectively based on Mount/Unmount Name.

## Output

- Script log






