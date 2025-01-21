---
id: '2cc1d72d-5d5b-4017-8114-ad5f722b10f5'
title: 'Exchange Zero Day Patch Logging'
title_meta: 'Exchange Zero Day Patch Logging'
keywords: ['exchange', 'vulnerability', 'cve', 'patch', 'ticketing']
description: 'This document outlines a script designed to detect recent vulnerabilities associated with Exchange Server, specifically targeting CVEs related to the Zero Day vulnerability. It checks for the presence of necessary patches and can create tickets for unresolved vulnerabilities, improving response times and security management.'
tags: ['cve', 'security', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This script helps to fetch the vulnerability attack detection for the recent Exchange Zero Day Vulnerability.  
It primarily looks for the following CVEs:

- CVE-2021-26855  
- CVE-2021-26858  
- CVE-2021-26857  
- CVE-2021-27065  

If any of the above vulnerabilities are detected, the script checks whether the necessary patches (KB5000978, KB5000871) have been installed.  
If the patches are missing, you can view the logs in the script log or receive logs in the ticket, which informs that the agent is being attacked but no fix has been applied yet.

To create a ticket, you must change the global parameter value for `TicketCreation` to `1`.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Exchange-Zero-Day-Patch-Logging/image_1.png)

## Dependencies

- Windows Exchange Server
- Intended to be triggered from the following monitor(s):
  - [ProVal - Production - CVE-2021-26858 Detection](<../monitors/CVE-2021-26858 Detection.md>)
  - [ProVal - Production - CVE-2021-26857 Detection](<../monitors/CVE-2021-26857 Detection.md>)
  - [ProVal - Production - CVE-2021-26858 Detection](<../monitors/CVE-2021-26858 Detection.md>)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

### Global Parameters

| Name            | Example | Required | Description                                                                                  |
|-----------------|---------|----------|----------------------------------------------------------------------------------------------|
| TicketCreation   | 0       | True     | If set to '1', will enable ticket creation; default is 0 to disable ticketing               |

## Process

The script performs various checks of Exchange server logs via PowerShell to confirm which CVEs apply to that server.  
Corrective steps and checks for patch installations are then taken based on CVE results.  

Primarily, the installation of KB5000871 is confirmed for the resolution of CVEs 2021-26855, 26858, and 27065.

## Output

- Script log
- Ticketing if enabled in Globals



