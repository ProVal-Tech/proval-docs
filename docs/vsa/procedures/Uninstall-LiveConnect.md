---
id: '02641c45-1e2e-470a-ae9f-224a754bf9c7'
title: 'Uninstall Live Connect'
title_meta: 'Uninstall Live Connect - Kaseya Remote Control Software'
keywords: ['uninstall', 'liveconnect', 'kaseya', 'remote', 'control']
description: 'This document provides a detailed overview of a script that cleanly uninstalls the Live Connect software, which is used for Kaseya Remote Control. It outlines the process, requirements, and output of the script, as well as updates made to enhance its functionality.'
tags: ['kaseya', 'software', 'uninstallation']
draft: false
unlisted: false
---
## Overview

Cleanly uninstalls Live Connect (Kaseya Remote Control software) and optionally reboots the endpoint. This can be used to resolve an update prompt issue in VSA, or to cleanly remove the software for any other reason. Checks for 32 or 64 bit versions of the software in case Kaseya ever changes to 64 bit.

**UPDATE 2/7/22:**
- Corrected function to follow appropriate naming conventions
- Removed reboot parameter (Manual reboot should be fine.)

## Requirements

None

## Process

Run script and choose reboot option 1 or 0. Reboot manually after script runs if not chosen to auto-restart.

## Payload Usage

Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Example:
```
Uninstall-LiveConnect.ps1
```
No Parameters

## Output

Does the content write to the RMM log, a data file, or the console? If so, what is the syntax?
```
./Uninstall-LiveConnect-log.txt
./Uninstall-LiveConnect-data.txt
./Uninstall-LiveConnect-error.txt
```

## Locations

| Payload                       | /repo/scripts/Uninstall-LiveConnect.ps1 |
|-------------------------------|------------------------------------------|
| ConnectWise Automate          |                                          |
| ConnectWise RMM               |                                          |
| Kaseya VSA                    |                                          |
| Datto RMM                     |                                          |











