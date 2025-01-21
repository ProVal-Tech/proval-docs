---
id: '15ecac3c-fe43-4d04-9e6c-82099bfa356b'
title: 'Install CyberCNS Agent'
title_meta: 'Install CyberCNS Agent for Client Management'
keywords: ['cybercns', 'agent', 'installation', 'client', 'edf']
description: 'This document provides a comprehensive guide on installing the CyberCNS agent on a computer, detailing the requirements, variables, global parameters, and the process involved in the installation.'
tags: ['installation', 'software']
draft: true
unlisted: false
---

## Summary

This script installs the CyberCNS agent on a computer.

## Requirements

The following client-level EDFs must be set:
1. EDF CyberCNS Company  
2. EDF CyberCNS Client ID  
3. EDF CyberCNS Client Secret  

The global variable `URL_Download` must have a valid download URL.

## Sample Run

![Sample Run](../../static/img/Cybercns-Agent-Installation/image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name                     | Description                                          |
|--------------------------|------------------------------------------------------|
| CyberCNS Company ID      | Client EDF - Store the value of the CyberCNS company ID  |
| CyberCNS Client ID       | Client EDF - Store the value of the CyberCNS Client ID   |
| CyberCNS Client Secret    | Client EDF - Store the value of the CyberCNS client secret |

## Global Parameter

| Name          | Example                          | Required | Description                                                    |
|---------------|----------------------------------|----------|----------------------------------------------------------------|
| URL_Download  | [https://cbercns.exe](https://cbercns.exe) | True     | This stores the CyberCNS executable package URL to proceed with the installation. |

## Process

1. Retrieve the client-level EDF values.
2. If anything is missing, exit with an error.
3. If all values are present, download the installer using the `URL_Download` parameter.
4. Once downloaded, install the application.
5. After execution, verify the installation.

## Output

- Script log

