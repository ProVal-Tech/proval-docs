---
id: 'e1e20509-bc51-4b66-8653-d3ab91baad47'
slug: /e1e20509-bc51-4b66-8653-d3ab91baad47
title: 'NTLMv1.1'
title_meta: 'NTLMv1.1'
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
| [Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca)           | Remote Monitor| Check whether NTLMv1.1 is enabled on the end machine.                                               |
| [Dataview - NTLMv1.1 Status [Remote Monitor]](/docs/5a6640f6-f0cb-4231-845f-e48c9445aa22) | Dataview      | Represents whether NTLMv1.1 is enabled or not. It is dependent on the [EPM - Windows Configuration - Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca). |
| [Script - Disable NTLMv1.1](/docs/2be0669b-3c87-4594-81f4-112c7411f513)                       | Script        | This script disables the NTLMv1.1 protocol on the target machine.                                   |
| △ Custom - Autofix - Disable NTLMv1.1                                                      | Alert Template| This will execute the [Script - Disable NTLMv1.1](/docs/2be0669b-3c87-4594-81f4-112c7411f513).           |

## Implementation

- Read the associated documents carefully.
- Import - [Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca) 
  - Using: [Import - Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca)
- Import - [Dataview - NTLMv1.1 Status [Remote Monitor]](/docs/5a6640f6-f0cb-4231-845f-e48c9445aa22)
- Import - [Script - Disable NTLMv1.1](/docs/2be0669b-3c87-4594-81f4-112c7411f513).
  - This script can be used as an auto-fix with the [Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca) or can also be executed manually.
  - If the auto-fix is needed, import the alert template: `△ Custom - Autofix - Disable NTLMv1.1`.
