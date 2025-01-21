---
id: 'e1e20509-bc51-4b66-8653-d3ab91baad47'
title: 'Disable NTLMv1.1 Detection and Remediation'
title_meta: 'Disable NTLMv1.1 Detection and Remediation'
keywords: ['ntlm', 'detection', 'remediation', 'security', 'protocol']
description: 'This document outlines the process to detect and disable the NTLMv1.1 protocol, including associated content and implementation steps to ensure proper security measures are in place.'
tags: ['security']
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to detect and disable NTLMv1.1.

## Associated Content

| Content                                                                                     | Type          | Function                                                                                              |
|---------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------|
| [Remote Monitor - NTLMv1.1 Detection](<../cwa/monitors/NTLMv1.1 Detection.md>)           | Remote Monitor| Check whether NTLMv1.1 is enabled on the end machine.                                               |
| [Dataview - NTLMv1.1 Status [Remote Monitor]](<../cwa/dataviews/NTLMv1.1 Status Remote Monitor.md>) | Dataview      | Represents whether NTLMv1.1 is enabled or not. It is dependent on the [EPM - Windows Configuration - Remote Monitor - NTLMv1.1 Detection](<../cwa/monitors/NTLMv1.1 Detection.md>). |
| [Script - Disable NTLMv1.1](<../cwa/scripts/Disable NTLMv1.1.md>)                       | Script        | This script disables the NTLMv1.1 protocol on the target machine.                                   |
| △ Custom - Autofix - Disable NTLMv1.1                                                      | Alert Template| This will execute the [Script - Disable NTLMv1.1](<../cwa/scripts/Disable NTLMv1.1.md>).           |

## Implementation

- Read the associated documents carefully.
- Import - [Remote Monitor - NTLMv1.1 Detection](<../cwa/monitors/NTLMv1.1 Detection.md>) 
  - Using: [Import - Remote Monitor - NTLMv1.1 Detection](<../cwa/monitors/NTLMv1.1 Detection.md>)
- Import - [Dataview - NTLMv1.1 Status [Remote Monitor]](<../cwa/dataviews/NTLMv1.1 Status Remote Monitor.md>)
- Import - [Script - Disable NTLMv1.1](<../cwa/scripts/Disable NTLMv1.1.md>).
  - This script can be used as an auto-fix with the [Remote Monitor - NTLMv1.1 Detection](<../cwa/monitors/NTLMv1.1 Detection.md>) or can also be executed manually.
  - If the auto-fix is needed, import the alert template: `△ Custom - Autofix - Disable NTLMv1.1`.

