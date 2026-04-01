---
id: '9d83a408-aeea-4efc-9786-59a6192542e3'
slug: /9d83a408-aeea-4efc-9786-59a6192542e3
title: 'Uninstall Automate Agent '
title_meta: 'Uninstall Automate Agent '
keywords: ['automate','uninstall','agent']
description: 'Downloads and executes the ConnectWise Automate Agent Uninstaller.'
tags: ['uninstallation','connectwise']
draft: false
unlisted: false
last_update:
  date: 2026-04-01
---

## Overview

This script automates the removal of the ConnectWise Automate agent from a Windows machine.
It performs the following steps:

  1. Creates the required working directory if it does not already exist.
  2. Downloads the Agent_Uninstaller.zip from the ConnectWise asset server.
  3. Extracts the contents of the zip archive to the working directory.
  4. Locates the uninstaller executable (setup.exe by default, or the first .exe found).
  5. Runs the uninstaller silently and validates the exit code.
  
## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/9d83a408-aeea-4efc-9786-59a6192542e3/automate.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/uninstall-automate-agent.ps1)

## Output

- Activity Details  

## Changelog

### 2026-04-01

This is the initial version of the document.
