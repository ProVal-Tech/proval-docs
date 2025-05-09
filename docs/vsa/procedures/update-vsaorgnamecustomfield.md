---
id: '293abe44-923c-4b2e-abf0-a2f35116996a'
slug: /293abe44-923c-4b2e-abf0-a2f35116996a
title: 'Update-VsaOrgNameCustomField'
title_meta: 'Update-VsaOrgNameCustomField'
keywords: ['vsa', 'custom', 'field', 'organization', 'api']
description: 'This document outlines the process to set the custom field value for "xPVAL Org Name" on machines based on the Parent Organization Name using the VSAAPI module. It details the requirements, process, parameters, and output for the script.'
tags: ['api']
draft: false
unlisted: false
---

# Overview

This document sets the 'xPVAL Org Name' custom field value on machines based on the Machine's Parent Organization Name. This information is essential for other functions in the VSA, as it is not otherwise available.

# Requirements

- Module: VSAAPI

# Process

The script utilizes API calls in the VSAAPI module to retrieve the Organization name from the Agent API and sets the appropriate custom field.

# Payload Usage

The parameters are passed to VSAAPI for use in the API call:

```
./Update-VsaOrgNameCustomField.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiservice -RestApiToken abcd-1234-efgh-5678
```

# Parameters

| Parameter        | Alias | Required | Default | Type   | Description                |
|------------------|-------|----------|---------|--------|----------------------------|
| `BaseURL`       |       | True     |         | String | VSA URL                    |
| `VsaUserName`   |       | True     |         | String | User with API Access       |
| `RestApiToken`  |       | True     |         | String | REST API Token for User    |

# Output

The location of output for log, result, and error files is as follows:

```
./Update-VsaOrgNameCustomField-log.txt
```