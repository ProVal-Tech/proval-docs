---
id: 'f499a42f-9194-4109-88c4-6ae61fcfbb93'
slug: /f499a42f-9194-4109-88c4-6ae61fcfbb93
title: 'Set Logon Success and Failure Auditing ON'
title_meta: 'Set Logon Success and Failure Auditing ON'
keywords: ['audit', 'logon', 'success', 'failure', 'dc']
description: 'This document provides a detailed overview of a script that configures logon auditing for success and failure events using auditpol.exe. The script is designed to run on a domain controller and ensures that logon auditing is enabled, facilitating better security monitoring and compliance.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script uses `auditpol.exe` to configure logon auditing for success and failure events to ON. This applies to the default domain controller policy, so it will only run on a DC.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Set-Logon-Success-and-Failure-Auditing-ON/image_1.png)

## Variables

- `%Shellresult%` - Used to check whether the Auditpol command succeeded or not.

## Process

- The script checks if it's running on a DC; it exits if the machine is not a DC.
- It runs `Auditpol.exe /set /subcategory:logon /success:enable /failure:enable` to enable logon success and failure events.
- It checks whether the command succeeded or not.
- It resends the inventory command.

## Output

- Script log


