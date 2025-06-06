---
id: '69eb5408-b476-4440-a788-dd546eae4a80'
slug: /69eb5408-b476-4440-a788-dd546eae4a80
title: 'Aging VM Checkpoint Alert'
title_meta: 'Aging VM Checkpoint Alert'
keywords: ['vm', 'checkpoint', 'hyper-v', 'alert', 'proval']
description: 'This document outlines the procedure for alerting the ProVal support team when a VM in a Hyper-V environment contains a checkpoint that is older than 24 hours. It includes an example log of the agent procedure and details on the dependencies and process involved in generating the alert.'
tags: ['hyper-v']
draft: false
unlisted: false
---

## Summary

Alerts the ProVal support team when a VM in a Hyper-V environment contains a checkpoint that is older than 24 hours.

## Example Agent Procedure Log

| Time                       | Alert                                      | Status                                      | Link                           |
|----------------------------|--------------------------------------------|---------------------------------------------|--------------------------------|
| 11:11:06 am 29-Nov-22      | Aging VM Checkpoint Alert                  | Success THEN                               | provaltech.com/dan.hicks      |
| 11:11:06 am 29-Nov-22      | Aging VM Checkpoint Alert-0001             | No aging checkpoints have been identified on any virtual machines in the Hyper-V environment on this endpoint. | provaltech.com/dan.hicks      |
| 11:11:06 am 29-Nov-22      | Aging VM Checkpoint Alert                  |                                             | provaltech.com/dan.hicks      |
| 11:11:06 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System) | Success THEN                               | provaltech.com/dan.hicks      |
| 11:11:05 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0016 | PowerShell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 11:11:05 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/793850582926898/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks      |
| 11:11:02 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0011 | Executing 64-bit PowerShell command as System: \"\" -command \"Get-VM | Get-VMCheckpoint | Where-Object \\\{ $_.CreationTime -lt $((Get-Date).AddDays(-1))} | Select-Object VMName, Name, CreationTime\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks      |
| 11:11:02 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0013 | Sending output to global variable.         | provaltech.com/dan.hicks      |
| 11:11:01 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-VM | Get-VMCheckpoint | Where-Object \\\{ $_.CreationTime -lt $((Get-Date).AddDays(-1))} | Select-Object VMName, Name, CreationTime | provaltech.com/dan.hicks      |
| 11:11:01 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0003 | No PowerShell file variable detected.      | provaltech.com/dan.hicks      |
| 11:11:00 am 29-Nov-22      | Execute PowerShell Command (64-bit, Run As System)-0002 | PowerShell is present.                     | provaltech.com/dan.hicks      |
| 11:10:59 am 29-Nov-22      | Aging VM Checkpoint Alert                  | Checking for aging checkpoints in the Hyper-V environment on this endpoint... | provaltech.com/dan.hicks      |
| 11:10:52 am 29-Nov-22      | Run Now - Aging VM Checkpoint Alert        | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Aging VM Checkpoint Alert to run at Nov 29 2022 11:10 AM | prov                           |

## Dependencies

The endpoint must be configured with the Hyper-V role and have the related PowerShell modules installed.

## Process

Gets a list of VM checkpoints via PowerShell that are older than 1 day. If any are found, an email is sent to ProVal Support with the details for remediation.

## Output

Agent Procedure Log