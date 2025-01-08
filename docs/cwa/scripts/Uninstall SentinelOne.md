---
id: 'cwa-uninstall-sentinelone-agent'
title: 'Uninstalling SentinelOne Agent from Windows'
title_meta: 'Uninstalling SentinelOne Agent from Windows'
keywords: ['sentinelone', 'uninstall', 'windows', 'agent', 'reboot']
description: 'This document provides a detailed guide on uninstalling the SentinelOne agent from Windows machines, including requirements for Tamper Protection or a passphrase, and handling reboot scenarios based on the uninstallation status.'
tags: ['uninstallation', 'windows', 'security', 'reboot']
draft: false
unlisted: false
---
## Summary

This script is designed to uninstall the SentinelOne agent from Windows machines. Either Tamper Protection or a passphrase is required to uninstall SentinelOne from the machine. It is recommended to reboot after SentinelOne uninstallation. If SentinelOne is uninstalled as per the Automate database, the script will not flag or issue any reboot. However, if it fails to determine, the script will flag the machine for reboot if a user is logged in and will issue a reboot in case the user is not logged in.

## Sample Run

![Sample Run](5078775/docs/14637337/images/21172932)

## Global Variables

| **Name**   | **Example**                                                                 | **Mandatory**                                               | **Description**                                                                                                                                               |
|------------|-----------------------------------------------------------------------------|------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Passphrase | COSE CUNY BADE MITT IDEA YTYI BANG FEW TWO LEAD SURE BOSE                 | True (False in case Tamper protection is disabled)         | Enter the passphrase for the machine. This passphrase can be obtained from the SentinelOne Portal. GO TO machine > actions and select show passphrase. |

## Output

- Script log


