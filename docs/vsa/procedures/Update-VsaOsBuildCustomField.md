---
id: '9d026118-1651-4000-a908-a31c44c4df09'
slug: /9d026118-1651-4000-a908-a31c44c4df09
title: 'Update-VsaOsBuildCustomField'
title_meta: 'Update-VsaOsBuildCustomField'
keywords: ['customfield', 'osbuild', 'vsa', 'api', 'audit']
description: 'This document provides an overview of how to set the custom field value for the OS Build on machines using the VSAAPI module. It includes requirements, process details, parameters for the script, and output information.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

# Overview
This document sets the 'xPVAL OS Build' custom field value on machines.

# Requirements
- Module: VSAAPI

# Process
The process uses API calls in the VSAAPI module to get the OSInfo field from the audit, parse it to extract the build number, and set the appropriate custom field.

# Payload Usage
The following command passes the parameters to VSAAPI for use in the API call:

```
./Update-OsBuildCustomField.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiservice -RestApiToken abcd-1234-efgh-5678
```

# Parameters

| Parameter        | Alias | Required | Default | Type   | Description                |
|------------------|-------|----------|---------|--------|----------------------------|
| `BaseURL`       |       | True     |         | String | VSA URL                   |
| `VsaUserName`   |       | True     |         | String | User with API Access      |
| `RestApiToken`  |       | True     |         | String | REST API Token for User   |

# Output
The output location for log, result, and error files is as follows:

```
./Update-OsBuildCustomField-log.txt
```


