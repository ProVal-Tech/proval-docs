---
id: '9861efb2-53f1-495a-b664-b5e10e335526'
slug: /9861efb2-53f1-495a-b664-b5e10e335526
title: 'Restart-HyperVHost'
title_meta: 'Restart-HyperVHost'
keywords: ['vm', 'hyper-v', 'reboot', 'restart', 'suspend', 'resume', 'scheduled task', 'maintenance']
description: 'Safely restarts a Hyper-V host while preserving and restoring the running state of all hosted virtual machines.'
tags: ['hyper-v', 'virtualization', 'windows', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Overview

This script uses the Agnostic script [Restart-HyperVHost](/docs/6da0235c-ed6e-4a81-b085-411337706b36) to restarts a **Windows Hyper-V host**, ensuring that the running state of all hosted virtual machines (VMs) is preserved. It is designed for environments where VM state preservation is critical during maintenance, patching, or updates, and where live migration to another host is not available or desired.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/9861efb2-53f1-495a-b664-b5e10e335526/host.webp)

## Dependencies

- [Agnostic: Restart-HyperVHost](/docs/6da0235c-ed6e-4a81-b085-411337706b36)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/restart-hypervhost.ps1)

## Output

- Activity Details

## Changelog

### 2026-08-06

- Initial version of the document