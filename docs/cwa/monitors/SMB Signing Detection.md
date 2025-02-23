---
id: '4ae6f939-e049-499e-8651-e452e0d5ba24'
title: 'SMB Signing Detection'
title_meta: 'SMB Signing Detection'
keywords: ['smb', 'monitor', 'detection', 'security', 'vulnerability']
description: 'This document outlines the functionality of a remote monitor designed to check the status of SMB signing. It detects whether SMB signing is enabled on the agent and applies an autofix if it is disabled. The document includes details on check actions, dependencies, target groups, ticketing, and implementation steps.'
tags: ['security', 'vulnerability']
draft: false
unlisted: false
---

## Summary

This remote monitor is designed to check whether SMB signing is enabled.  
If SMB signing is disabled on the agent, it detects this and applies the autofix.

## Details

| Check Action         | Server Address           | Check Type | Check Value  | Comparator         | Interval | Result                  |
|----------------------|--------------------------|------------|--------------|---------------------|----------|-------------------------|
| System               | 127.0.0.1                | Run File   | **REDACTED** | Does Not Contain    | 300      | Remediation Required     |

## Dependencies

[CWA Script - CVE-2016-2115 - SMB Signing](<../scripts/CVE-2013-3900 WinVerifyTrust Signature Vulnerability.md>)  
**△ Custom - Execute Script - CVE-2016-2115 - SMB Signing**

## Target

**Custom Groups:**  
**Group: CVE Vulnerability Detection Only**  
**Group: CVE-2016-2115 SMB Signing Detection & Rem**

## Ticketing

**_The ticketing part is handled by the script.  
Refer to the script documentation [CWA Script - CVE-2016-2115 - SMB Signing](<../scripts/CVE-2013-3900 WinVerifyTrust Signature Vulnerability.md>) for details on how the ticketing will be set up._**

## Implementation

Please follow the implementation document below to install this content:
- [Import - Remote Monitor - SMB Signing Detection](<./Import - Remote Monitor - SMB Signing Detection.md>)



