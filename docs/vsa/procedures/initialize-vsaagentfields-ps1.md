---
id: '59682d1e-d5d7-4cf2-b923-684f6e5c24ce'
slug: /59682d1e-d5d7-4cf2-b923-684f6e5c24ce
title: 'Initialize-VsaAgentFields.ps1'
title_meta: 'Initialize-VsaAgentFields.ps1'
keywords: ['proval', 'stack', 'machine', 'customfields', 'initialization']
description: 'This document provides an overview of the process for writing the ProVal Stack Machine Custom Fields to a new client environment using the VSAAPI ProVal Module. It outlines the requirements, process, payload usage, parameters, and expected output.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

# Overview
This document describes the process of writing the ProVal Stack Machine Custom Fields to a new client environment.

# Requirements
- VSAAPI ProVal Module

# Process
The VSAAPI module is used to interface with the client environment, setting new CustomFields for the Machine Scope.

# Payload Usage
```
./Initialize-VsaAgentFields.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop
```

# Parameters

| Parameter         | Required | Type   | Description                                       |
|-------------------|----------|--------|---------------------------------------------------|
| `BaseURL`        | True     | String | URL of the target VSA environment                 |
| `VsaUserName`    | True     | String | VSA user with system role/scope and API access   |
| `RestApiToken`   | True     | String | REST API access token for the VSA user above      |

# Output
- `Initialize-VsaAgentFields-Log.txt`
- `Initialize-VsaAgentFields-error.txt`

**NOTE:** This can be run from VSA 9.5 by executing the Agent Procedure: Shared > VSA Automation > Stack CF Initialization.


