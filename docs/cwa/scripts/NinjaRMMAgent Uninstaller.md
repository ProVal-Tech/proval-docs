---
id: 'cwa-uninstall-ninjarmagent'
title: 'Uninstall NinjaRMMAgent Script'
title_meta: 'Uninstall NinjaRMMAgent Script - ConnectWise Automate'
keywords: ['uninstall', 'ninjarmagent', 'script', 'ticketing', 'failure']
description: 'This document outlines a script designed to uninstall the NinjaRMMAgent from a machine. It includes a global parameter for ticketing, which, when enabled, generates a support ticket if the uninstallation process fails. The document also provides a summary of the script functionality and sample run output.'
tags: ['uninstallation', 'ticketing', 'windows', 'software']
draft: false
unlisted: false
---
## Summary

The script tries to uninstall NinjaRMMAgent from the machine. If the global variable `Ticketing` is set to `1`, it generates a ticket when the uninstallation fails.

## Sample Run

![Sample Run](5078775/docs/15736070/images/22933112)

#### Global Parameters

| Name      | Default | Required | Description                                              |
|-----------|---------|----------|----------------------------------------------------------|
| Ticketing | 0       | True     | Set this variable to 1 to enable ticket creation on failure. |

## Output

- Script Log
- Ticket

