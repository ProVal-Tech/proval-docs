---
id: '59682d1e-d5d7-4cf2-b923-684f6e5c24ce'
title: 'Overview of ProVal Stack Machine Custom Fields Initialization'
title_meta: 'Overview of ProVal Stack Machine Custom Fields Initialization'
keywords: ['proval', 'stack', 'machine', 'customfields', 'initialization']
description: 'This document provides an overview of the process for writing the ProVal Stack Machine Custom Fields to a new client environment using the VSAAPI ProVal Module. It outlines the requirements, process, payload usage, parameters, and expected output.'
tags: ['configuration', 'setup', 'vsa', 'software', 'windows']
draft: false
unlisted: false
---
# Overview
Writes the ProVal Stack Machine Custom Fields to a new client environment

# Requirements
VSAAPI ProVal Module

# Process
Uses VSAAPI module to interface with client environment, setting new CustomFields for the Machine Scope

# Payload Usage
```
./Initialize-VsaAgentFields.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop
```

# Parameters

| Parameter         | Required | Type   | Description                                       |
|-------------------|----------|--------|---------------------------------------------------|
| `BaseURL`        | True     | String | URL Of the Target VSA Environment                 |
| `VsaUserName`    | True     | String | Vsa User with System Role/Scope and API Access   |
| `RestApiToken`   | True     | String | Rest Api Access Token for the Vsa User above      |

# Output
Initialize-VsaAgentFields-Log.txt Initialize-VsaAgentFields-error.txt

**NOTE:** Can be run from VSA 9.5 by running the Agent Procedure: Shared > Vsa Automation > Stack CF Initialization






