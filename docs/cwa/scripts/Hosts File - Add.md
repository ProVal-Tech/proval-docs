---
id: 'cwa-host-file-modification-script'
title: 'Host File Modification Script'
title_meta: 'Host File Modification Script for DNS Management'
keywords: ['dns', 'host', 'ip', 'script', 'configuration']
description: 'This document describes a script that modifies the host file on a machine by taking user-defined parameters for DNS names and IP addresses. It includes a sample run, dependencies, user parameters, and the process for execution, ensuring proper management of DNS entries.'
tags: ['configuration', 'networking', 'windows', 'security', 'update']
draft: false
unlisted: false
---
## Summary

This script takes the user parameters when running the script and places them inside the host file of the machine. Both parameters are required for the script to function properly.

## Sample Run

![Sample Run](5078775/docs/9106955/images/12604515)

## Dependencies

This script is dependent on the following items:
- [EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329)
- Host File Contents (Extra Data Field)

#### User Parameters

| Name      | Example               | Required | Description                                                                                                                                          |
|-----------|-----------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| DNSName   | Server01 OR<br>svr1 svr2 | True     | This depicts what DNS host name you would like linked to the IP address set when running the script. Multiple DNS names can be specified, separated by a space. |
| IPaddress | 192.168.23.10        | True     | This depicts what IP address you would like linked to the DNS host name set when running the script. (Only one IP address can be specified per run of this script) |

## Process

1. Scan the current host file and make sure the DNS Name set in the user parameters is not already located in the host file.
2. Rename the current host file with OLD in the name.
3. Re-build the host file using the contents of the old host file and append the new line at the bottom.
4. Perform a `ipconfig /flushdns`.
5. Update the EDF with the current data.

## Output

This script outputs information to the following areas:
- Script Log
- Host File Contents (Extra Data Field)
  - ![Output 1](5078775/docs/9106955/images/12604596) OR ![Output 2](5078775/docs/9106955/images/12604598)


