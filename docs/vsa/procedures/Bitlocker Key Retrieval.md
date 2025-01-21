---
id: '999eecab-38a7-41e1-b132-bc4b343e9b65'
title: 'Bitlocker Key Retrieval'
title_meta: 'Bitlocker Key Retrieval'
keywords: ['bitlocker', 'recovery', 'key', 'endpoint', 'cf']
description: 'This document outlines the process for retrieving any available Bitlocker recovery keys from endpoints and saving them to the xPVAL Bitlocker Key CF. It includes example logs, dependencies, and a detailed process for execution.'
tags: ['backup', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document retrieves any available Bitlocker recovery key and saves it to the xPVAL Bitlocker Key CF.

## Example Agent Procedure Log

| Time                     | Action                                        | Status                                    | User                          |
|--------------------------|-----------------------------------------------|-------------------------------------------|-------------------------------|
| 4:07:36 pm 13-Dec-22     | Bitlocker Key Retrieval                       | Success THEN                             | provaltech.com/dan.hicks      |
| 4:07:36 pm 13-Dec-22     | Bitlocker Key Retrieval-0001                 | No Recovery Key found on endpoint.       | provaltech.com/dan.hicks      |
| 4:07:36 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System) | Success THEN                             | provaltech.com/dan.hicks      |
| 4:07:36 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 4:07:22 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "$result = Get-BitLockerVolume | ForEach-Object \{\"$([string]($_.KeyProtector).RecoveryPassword) $RecoveryKey\"}; if (!($result)) \{\"Drive $result\"}" > "c://provaltech//psoutputtmp.txt" | provaltech.com/dan.hicks      |
| 4:07:22 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.       | provaltech.com/dan.hicks      |
| 4:07:22 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as $result = Get-BitLockerVolume | ForEach-Object \{\"$([string]($_.KeyProtector).RecoveryPassword) $RecoveryKey\"}; if (!($result)) \{\"Drive $result\"} | provaltech.com/dan.hicks      |
| 4:07:22 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.    | provaltech.com/dan.hicks      |
| 4:07:17 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                   | provaltech.com/dan.hicks      |
| 4:07:07 pm 13-Dec-22     | Run Now - Bitlocker Key Retrieval            | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Bitlocker Key Retrieval to run at Dec 13 2022 4:07 PM | provaltech.com/dan.hicks      |

## Dependencies

CF xPVAL Bitlocker Key

## Process

This process retrieves Bitlocker recovery keys on the endpoint and prints any that exist to the CF.

## Output

CF, AP Log


