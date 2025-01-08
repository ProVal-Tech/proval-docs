---
id: 'cwa-configure-logon-auditing'
title: 'Configure Logon Auditing with Auditpol'
title_meta: 'Configure Logon Auditing with Auditpol'
keywords: ['audit', 'logon', 'success', 'failure', 'dc']
description: 'This document provides a detailed overview of a script that configures logon auditing for success and failure events using auditpol.exe. The script is designed to run on a domain controller and ensures that logon auditing is enabled, facilitating better security monitoring and compliance.'
tags: ['audit', 'security', 'configuration', 'windows', 'report']
draft: false
unlisted: false
---
## Summary

This script uses auditpol.exe to configure logon auditing for success and failures to ON. This applies to the default domain controller policy so it will only run on a DC.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8013656/images/11181086)

## Variables

%Shellresult% - Used to Check the Auditpol command succeeded or not.

## Process

- Script checks if it's running on a DC or not, exits if the machine is not a DC
- Runs Auditpol.exe /set /subcategory:logon /success:enable /failure:enable to enable Logon Success and failure events
- Checks whether the command succeeded or not
- Resends Inventory command

## Output

- Script log


