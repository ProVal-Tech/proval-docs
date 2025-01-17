---
id: '293abe44-923c-4b2e-abf0-a2f35116996a'
title: 'Update VSA Org Name Custom Field'
title_meta: 'Update VSA Org Name Custom Field'
keywords: ['vsa', 'custom', 'field', 'organization', 'api']
description: 'This document outlines the process to set the custom field value for "xPVAL Org Name" on machines based on the Parent Organization Name using the VSAAPI module. It details the requirements, process, parameters, and output for the script.'
tags: ['api']
draft: false
unlisted: false
---
# Overview

Sets 'xPVAL Org Name' custom field value on machines from the Machine's Parent Organization Name. Needed for other functions in the VSA as this information is not otherwise available.

# Requirements

Module VSAAPI

# Process

Uses API calls in the VSAAPI module to get the Organization name from the Agent API, and sets the appropriate custom field.

# Payload Usage

Passes the parameters to VSAAPI for use in the API call

```
./Update-VsaOrgNameCustomField.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiservice -RestApiToken abcd-1234-efgh-5678
```

# Parameters

| Parameter        | Alias | Required | Default | Type   | Description                |
|------------------|-------|----------|---------|--------|----------------------------|
| `BaseURL`       |       | True     |         | String | VSA URL                    |
| `VsaUserName`   |       | True     |         | String | User with Api Access       |
| `RestApiToken`  |       | True     |         | String | Rest Api Token for User    |

# Output

Location of output for log, result, and error files.

```
./Update-VsaOrgNameCustomField-log.txt
```











