---
id: 'a30a59de-9f71-446c-825c-f85ebceb4517'
slug: /a30a59de-9f71-446c-825c-f85ebceb4517
title: 'Webroot Key AuditMatch'
title_meta: 'Webroot Key AuditMatch'
keywords: ['webroot', 'keycode', 'audit', 'monitoring', 'security']
description: 'This document outlines a solution for auditing Webroot KeyCodes and monitoring for mismatches. It includes associated scripts, dataviews, and monitors to ensure compliance and alert on discrepancies.'
tags: ['security']
draft: false
unlisted: false
---

## Purpose

This solution fetches the Webroot KeyCode audit and monitors to find any mismatches.

## Associated Content

| Content                                                                                  | Type        | Function                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Webroot Keycode Verification [DV]](/docs/4d3b24f2-a55a-4f57-8cad-1345d1e85060) | Script      | This script collects the Webroot hashed keycode from the machine and matches it with the keycode set up in the Webroot plugin and the keycode present on the machine. We can review the results using the DV. |
| [Dataview - Webroot KeyCode Audit [Script]](/docs/5ed671db-6295-42ed-9f44-cd0b4203c4e4) | Dataview    | This dataview shows the Webroot hashed keycode present on the machine, the status of the keycode, and whether it matches the keycode set up under the Webroot plugin.                               |
| [Monitor - Execute Script - Webroot Keycode Verification](/docs/1500f46b-72f9-4194-aafa-2222caf5a649) | Monitor     | Alerts if a computer or computers have the wrong Webroot Keycode assigned.                                                                                                                            |
| **△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval**                            | Alert Template | This will call the script [EPM - Data Collection - Script - Webroot Hashed Key Retrieval](/docs/4d3b24f2-a55a-4f57-8cad-1345d1e85060) to perform a re-audit of the code and then create alerts if the keycode mismatches. |

## Implementation

- Import: [Script - Webroot Keycode Verification [DV]](/docs/4d3b24f2-a55a-4f57-8cad-1345d1e85060)
- Import: [Dataview - Webroot KeyCode Audit [Script]](/docs/5ed671db-6295-42ed-9f44-cd0b4203c4e4)
- Import: [Monitor - Proval - Production - AV - Wrong Webroot KeyCode Detected](/docs/1500f46b-72f9-4194-aafa-2222caf5a649).
- Import the alert template "**△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval**".
- Schedule the [Script - Webroot Hashed Key Retrieval](/docs/4d3b24f2-a55a-4f57-8cad-1345d1e85060) to the group "Antivirus Management/Webroot SecureAnywhere" every week to perform the audit of the Key where the Webroot Antivirus is installed.
- Set the [Monitor - Proval - Production - AV - Wrong Webroot KeyCode Detected](/docs/1500f46b-72f9-4194-aafa-2222caf5a649) to run daily and apply the alert template **△ CUSTOM - Execute Script - Webroot Hashed Key Retrieval** to perform a re-audit and alert if the keycode mismatches.
- Go through the documentation [SWM - Software Install - Solution - Webroot](/docs/2b4f5b7f-0275-4114-8686-0084c1741c9d) to understand how to set the Webroot site keycode in the plugin.

## FAQ

- Will the ticket auto-close if the KeyCode matches for the agent where the KeyCode mismatch was detected?
  - Yes, the autofix has the auto-closure of the ticket feature added.


