---
id: '13e225e3-ebab-45f8-ac25-f1a15eb4ac80'
title: 'Download and Install ShadowControl Client'
title_meta: 'Download and Install ShadowControl Client'
keywords: ['shadowcontrol', 'client', 'install', 'download', 'subscription']
description: 'This document provides a detailed guide on a script that automates the download and installation of the ShadowControl client on a target machine, including steps for subscribing to the appropriate ShadowControl server and cleaning up after installation.'
tags: ['installation', 'software', 'networking', 'configuration']
draft: false
unlisted: false
---
## Summary

This script downloads and installs the ShadowControl client to the target machine and subscribes it to the appropriate SC server.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](../../../static/img/ShadowControl-Installer/image_1.png)

#### Global Parameters

| Name                  | Example                                             | Required | Description                                               |
|-----------------------|-----------------------------------------------------|----------|-----------------------------------------------------------|
| FQDNServerAddress     | [storagecraft.provaltech.com](http://storagecraft.provaltech.com) | True     | Required to subscribe the agent to the ShadowControl portal. |

## Process

- Downloads and installs the ShadowControl client to the target machine.
- Automatically subscribes the installed client to the client's ShadowControl server depending upon the Global value.
- Deletes the downloaded installer upon completion.

## Output

Script Log






