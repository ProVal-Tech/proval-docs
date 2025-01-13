---
id: 'cwa-smb-signing-detection'
title: 'SMB Signing Detection Remote Monitor'
title_meta: 'SMB Signing Detection Remote Monitor'
keywords: ['smb', 'monitor', 'detection', 'security', 'vulnerability']
description: 'This document outlines the functionality of a remote monitor designed to check the status of SMB signing. It detects whether SMB signing is enabled on the agent and applies an autofix if it is disabled. The document includes details on check actions, dependencies, target groups, ticketing, and implementation steps.'
tags: ['security', 'monitor', 'vulnerability', 'custom', 'automation']
draft: false
unlisted: false
---
## Summary

This remote monitor is designed to check whether the SMB signing is enabled or not.  
If SMB Signing is disabled on the agent then it detects it and applies the autofix.

## Details

| Check Action         | Server Address           | Check Type | Check Value  | Comparator         | Interval | Result                  |
|----------------------|--------------------------|------------|--------------|---------------------|----------|-------------------------|
| System               | 127.0.0.1                | Run File   | **REDACTED** | Does Not Contain    | 300      | Remediation Required     |

## Dependencies

[CWA Script - CVE-2016-2115 - SMB Signing](https://proval.itglue.com/DOC-5078775-15762068)  
**△ Custom - Execute Script - CVE-2016-2115 - SMB Signing**

## Target

**Custom Groups:**  
**Group: CVE Vulnerability Detection Only**  
**Group: CVE-2016-2115 SMB Signing Detection & Rem**

## Ticketing

**_The ticket part is handled by the script.  
Refer to the script documentation [CWA Script - CVE-2016-2115 - SMB Signing](https://proval.itglue.com/DOC-5078775-15762068) on how the ticketing will be set up._**

## Implementation

Please follow the below implementation document to install this content:
- [Import - Remote Monitor - SMB Signing Detection](https://proval.itglue.com/DOC-5078775-15775362)


