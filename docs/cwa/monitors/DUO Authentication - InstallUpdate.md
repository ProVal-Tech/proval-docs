---
id: 'cwa-duo-authentication-monitor'
title: 'DUO Authentication Monitor for Windows Agents'
title_meta: 'DUO Authentication Monitor for Windows Agents'
keywords: ['duo', 'authentication', 'windows', 'monitor', 'agent', 'edf', 'exclusion']
description: 'This document outlines a monitor designed to detect online Windows agents with outdated DUO Authentication for Windows Logon. It also identifies agents with specific client EDF settings and exclusions not applied at the location or computer level.'
tags: ['windows', 'monitoring', 'security', 'software', 'exclusion']
draft: false
unlisted: false
---
## Summary

This monitor will detect the online Windows agent where the outdated DUO Authentication for Windows Logon is installed or it also detects the agents whose client EDFs are set with values and the exclusions EDF "DUO Agent Exclusion" are not checked at the location or computer level.

Client EDFs:

![Client EDFs](../../../static/img/DUO-Authentication---InstallUpdate/image_1.png)

Client Exclusion EDF:  
**<u>![Client Exclusion EDF](../../../static/img/DUO-Authentication---InstallUpdate/image_2.png)</u>**  

Location Exclusion EDFs:

![Location Exclusion EDFs](../../../static/img/DUO-Authentication---InstallUpdate/image_3.png)

Computer Exclusion EDFs:

![Computer Exclusion EDFs](../../../static/img/DUO-Authentication---InstallUpdate/image_4.png)

## Dependencies

[Script - DUO Install/Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-9713528)

## Target

Windows OS

## Ticketing

---

**Subject:**  
DUO Authentication Install/Update Failed on %ComputerName% at %ClientName%

---

**Body**

**When installation failed**  
Failed to Install the @ApplicationVersion@ of DUO Authentication for Windows Logon. Here's the result of the installation Command: %ShellResult%

**When Argument Missing**  
Arguments required to install DUO Authentication for Windows Login is not set.




