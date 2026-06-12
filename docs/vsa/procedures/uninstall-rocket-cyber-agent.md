---
id: '71eaf31e-adb1-4fd7-84b2-31ecf4873ac5'
slug: /71eaf31e-adb1-4fd7-84b2-31ecf4873ac5
title: 'Uninstall - RocketCyber Agent'
title_meta: 'Uninstall - RocketCyber Agent'
keywords: ['rocket', 'cyber', 'agent']
description: 'Uninstalls the RocketCyber Agent from Windows endpoints by stopping and removing associated services, registry entries, and installation files.'
tags: ['antivirus', 'application', 'uninstallation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-12
---

## Summary

This script performs a complete removal of the RocketCyber Agent from Windows systems. It stops all RocketAgent-related services and processes, removes associated uninstall registry entries, and deletes RocketAgent files, folders, and residual components from the device.

The script is vendor-provided and is intended to ensure a clean uninstallation of the RocketCyber Agent before reinstallation, troubleshooting, or device decommissioning activities.

### References

- **RocketCyber Documentation:** `https://help.rocketcyber.kaseya.com/help/Content/deployment/how-to-uninstall-rocketcyber-agent.html`

- **Vendor-Provided PowerShell Script:** `https://help.rocketcyber.kaseya.com/help/Content/Resources/Documents/rocketagent_uninstall.ps1`

## Sample Run

![Image1](../../../static/img/docs/71eaf31e-adb1-4fd7-84b2-31ecf4873ac5/sample-run.webp)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `Uninstall - RocketCyber Agent`   

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

## Output

- Script Logs

## Changelog

### 2026-06-11

- Initial version of the document

