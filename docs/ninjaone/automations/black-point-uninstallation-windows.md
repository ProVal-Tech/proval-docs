---
id: '321970ff-b69d-4fb9-b9e7-6e1c3a581468'
slug: /321970ff-b69d-4fb9-b9e7-6e1c3a581468
title: 'BlackPoint - Uninstall All Components - (Windows)'
title_meta: 'BlackPoint - Uninstall All Components - (Windows)'
keywords: ['agent','windows','deployment','blackpoint']
description: 'This script uninstalls the BlackPoint SnapAgent by performing standard removal and, if necessary, forced removal when remnants remain. It locates the application by display name, identifies the uninstall method type and then removing it.'
tags:  ['windows','security','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Overview

This script uninstalls every BlackPoint component (Agent, Application Control, Defender Manager and Vulnerability Scanner). It finds each uninstall registration by display name, identifies the uninstall method (MSI or silent EXE), stops the BlackPoint services, then removes each component and verifies that nothing is left registered.

## Sample Run
`Play Button` > `Run Automation` > `Script`  
**Run As:** `System`  

![Image1](../../../static/img/docs/321970ff-b69d-4fb9-b9e7-6e1c3a581468/scriptrun.webp)


## Dependencies

- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Automation Setup/Import

- [Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/blackpoint-uninstall-windows.ps1)


## Output

- Activity Details

## Changelog

### 2026-11-06

- Updated the script with the following changes:
  - The script now uninstalls every BlackPoint component (Agent, Application Control, Defender Manager and Vulnerability Scanner) instead of only the SnapAgent and ZTAC.
  - The script finds each component in the Uninstall registry keys and runs the uninstaller that component registered (MSI or silent EXE).
  - The script stops the BlackPoint services before it removes the components, and removes them in up to three passes.
  - After removal, the script verifies that no BlackPoint component is still registered. It exits with code 1 if one is.
  - The script no longer force-deletes leftover files, folders, registry keys or services.
  - The script now runs as 64-bit only.
  - Renamed the script from `Blackpoint SnapAgent - Uninstall - (Windows)` to `BlackPoint - Uninstall All Components - (Windows)`.
- Updated the automation configuration link to `blackpoint-uninstall-windows.ps1`.

### 2025-11-28

- Initial version of the document
