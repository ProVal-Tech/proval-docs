---
id: 'cwa-disable-ntlmv1.1'
title: 'Disable NTLMv1.1 Detection and Remediation'
title_meta: 'Disable NTLMv1.1 Detection and Remediation'
keywords: ['ntlm', 'detection', 'remediation', 'security', 'protocol']
description: 'This document outlines the process to detect and disable the NTLMv1.1 protocol, including associated content and implementation steps to ensure proper security measures are in place.'
tags: ['security', 'configuration', 'alert', 'monitor', 'script']
draft: false
unlisted: false
---
## Purpose

The goal of this solution is to detect and disable NTLMv1.1.

## Associated Content

| Content                                                                                     | Type          | Function                                                                                              |
|---------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------|
| [Remote Monitor - NTLMv1.1 Detection](https://proval.itglue.com/DOC-5078775-14448809)     | Remote Monitor| Check whether the NTLMv1.1 is enabled on the end machine or not.                                     |
| [Dataview - NTLMv1.1 Status [Remote Monitor]](https://proval.itglue.com/DOC-5078775-14448790) | Dataview      | Represents If NTLMv1.1 is enabled or not. It is dependent on the [EPM - Windows Configuration - Remote Monitor - NTLMv1.1 Detection](https://proval.itglue.com/DOC-5078775-14448809). |
| [Script - Disable NTLMv1.1](https://proval.itglue.com/DOC-5078775-14448793)               | Script        | This script disables the NTLMv1.1 protocol on the target machine.                                   |
| △ Custom - Autofix - Disable NTLMv1.1                                                      | Alert Template| This will execute the [Script - Disable NTLMv1.1](https://proval.itglue.com/DOC-5078775-14448793). |

## Implementation

- Read the associated documents carefully.
- Import - [Remote Monitor - NTLMv1.1 Detection](https://proval.itglue.com/DOC-5078775-14448809) 
  - Using: [Import - Remote Monitor - NTLMv1.1 Detection](https://proval.itglue.com/DOC-5078775-14448845)
- Import - [Dataview - NTLMv1.1 Status [Remote Monitor]](https://proval.itglue.com/DOC-5078775-14448790)
- Import - [Script - Disable NTLMv1.1](https://proval.itglue.com/DOC-5078775-14448793).
  - This script can be used as an auto fix with the [Remote Monitor - NTLMv1.1 Detection](https://proval.itglue.com/DOC-5078775-14448809) or can also be executed manually.
  - If the auto fix is needed, import the alert template: `△ Custom - Autofix - Disable NTLMv1.1`.



