---
id: 'cwa-webroot-keycode-audit'
title: 'Webroot KeyCode Audit and Mismatch Monitoring'
title_meta: 'Webroot KeyCode Audit and Mismatch Monitoring'
keywords: ['webroot', 'keycode', 'audit', 'monitoring', 'security']
description: 'This document outlines a solution for auditing Webroot KeyCodes and monitoring for mismatches. It includes associated scripts, dataviews, and monitors to ensure compliance and alert on discrepancies.'
tags: ['security', 'monitoring', 'audit', 'alert', 'dataview', 'script']
draft: false
unlisted: false
---
## Purpose

This solution fetches the Webroot KeyCode audit and monitors to find any mismatch.

## Associated Content

| Content                                                                                  | Type        | Function                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Webroot Keycode Verification [DV]](https://proval.itglue.com/DOC-5078775-8223773) | Script      | This script collects the Webroot hashed keycode from the machine and further matches it with the keycode setup in the Webroot plugin and the keycode present on the machine. we can review the result using the DV. |
| [Dataview - Webroot KeyCode Audit [Script]](https://proval.itglue.com/DOC-5078775-8105261) | Dataview    | This dataview will show the Webroot hashed keycode present on the machine, the status of the keycode, and whether it matches the keycode setup under the Webroot plugin.                               |
| [Monitor - Execute Script - Webroot Keycode Verification](https://proval.itglue.com/DOC-5078775-11417971) | Monitor     | Alerts if a computer or computers have the wrong Webroot Keycode assigned.                                                                                                                            |
| **△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval**                            | Alert Template | This will call the script [EPM - Data Collection - Script - Webroot Hashed Key Retrieval](https://proval.itglue.com/DOC-5078775-8223773) to perform a reaudit of the code and then create alerts if the keycode mismatched. |

## Implementation

- Import: [Script - Webroot Keycode Verification [DV]](https://proval.itglue.com/DOC-5078775-8223773)
- Import: [Dataview - Webroot KeyCode Audit[Script]](https://proval.itglue.com/DOC-5078775-8105261)
- Import: [Monitor - Proval - Production - AV - Wrong Webroot KeyCode Detected](https://proval.itglue.com/DOC-5078775-11417971).
- Import the alert template "**△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval**".
- Schedule the [Script - Webroot Hashed Key Retrieval](https://proval.itglue.com/DOC-5078775-8223773) to the group "Antivirus Management/Webroot SecureAnyWhere" every week to perform the audit of the Key where the Webroot Antivirus is installed.
- Set the [Monitor - Proval - Production - AV - Wrong Webroot KeyCode Detected](https://proval.itglue.com/DOC-5078775-11417971) to run daily and apply the alert template **△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval** to perform a reaudit and alert if the key code mismatch.
- Go through the documentation [SWM - Software Install - Solution - Webroot](https://proval.itglue.com/DOC-5078775-11665357) to understand how to set the Webroot site keycode in the plugin.

## FAQ

- Will the ticket auto-close if the KeyCode matched for the agent where the KeyCode mismatch was detected?
- Yes, the autofix has the auto-closure of the ticket feature added.



