---
id: 'c7c193f3-3547-42f9-80de-fc718d062c0a'
slug: /c7c193f3-3547-42f9-80de-fc718d062c0a
title: 'Uninstall Kaseya Agent'
title_meta: 'Uninstall Kaseya Agent'
keywords: ['uninstall','kaseya','agent']
description: 'This script is used to uninstall the kaseya agent from the machine.'
tags: ['uninstallation','application','kaseya']
draft: false
unlisted: false
---

## Overview

This script searches the Kaseya installation directory for KASetup.exe, dynamically determines the Agent ID from the installation folder, checks for the associated agent service, and performs a silent uninstall.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/c7c193f3-3547-42f9-80de-fc718d062c0a/kaseyaagentunisntall.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/uninstall-kaseya-agent.ps1)

## Output

- Activity Details
