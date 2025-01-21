---
id: ps-set-vmgueststate
title: 'Set-VMGuestState'
title_meta: 'Set-VMGuestState'
keywords: ['vm', 'guest', 'state', 'hyper-v']
description: 'Documentation for the Set-VMGuestState command to start or stop all running VMs on the Hyper-V host, with special handling for domain controllers.'
tags: ['hyper-v', 'virtualization', 'windows']
draft: false
unlisted: false
---

## Description
Starts or stops all running VMs on the Hyper-V host. If a domain controller guest is detected, it will be stopped last and started first.

## Requirements
VMs must be stopped first using this script.

## Usage

### Stop Process
1. Find all machines with a valid heartbeat and categorize those machines as Domain Controllers or Standard VMs.
2. Stop all VMs, starting with Standard VMs.
3. If any VM fails to stop in the allotted time, power on VMs that were previously stopped and exit.
4. A final check is performed to ensure all VMs are off. If this check fails, power on VMs that were previously stopped and exit.
5. Exports an XML list of powered-off VMs for use in the `-Start` process.

### Start Process
1. If the `-Stop` process has not been run previously, write an error and exit.
2. If the XML files from the `-Stop` process are found, start all previously stopped VMs, starting with Domain Controllers.

*Stop all running VMs on the host, ending with any detected domain controller guests.*
```powershell
.\Set-VMGuestState.ps1 -Stop
```

*Start all previously running VMs on the host from the last time the 'Stop' action was run, starting with any detected domain controller guests. If any machine fails to start within 300 seconds, the script will abort.*
```powershell
.\Set-VMGuestState.ps1 -Start -LeadTime 300
```

## Parameters
| Parameter  | Alias | Required    | Default | Type   | Description                                                         |
| ---------- | ----- | ----------- | ------- | ------ | ------------------------------------------------------------------- |
| `Stop`     |       | True (Semi) |         | String | Attempt to stop all running VMs on the host.                       |
| `Start`    |       | True (Semi) |         |        | Attempt to start all previously stopped VMs on the host.           |
| `LeadTime` |       | False       | 300     | Int    | The amount of time to wait before considering the action a failure. |

## Output
Location of output for log, result, and error files.

```
.\Set-VMGuestState-log.txt
.\Set-VMGuestState-error.txt
```



