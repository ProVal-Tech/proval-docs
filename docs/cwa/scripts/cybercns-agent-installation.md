---
id: '15ecac3c-fe43-4d04-9e6c-82099bfa356b'
slug: /15ecac3c-fe43-4d04-9e6c-82099bfa356b
title: 'Cybercns Agent Installation [Windows, MAC]'
title_meta: 'Cybercns Agent Installation [Windows, MAC]'
keywords: ['cybercns', 'agent', 'installation', 'client', 'edf']
description: 'This document provides a comprehensive guide on installing the CyberCNS agent on a computer, detailing the requirements, EDFs, and the process involved in the installation.'
tags: ['installation', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This script installs the CyberCNS agent using the keys provided in the client EDFs.

## Sample Run

Run the script with SetEnvironment = 1, after import to create the required EDFs and system properties.

![Sample Run 1](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image2.webp)

Run without SetEnvironment, for the deployment

![Sample Run 2](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image1.webp)

## Dependencies

[Solution - CyberCNS Agent](/docs/f68fc157-ae00-4c3f-bb05-b53cefab28ac)

### User Parameters

| Name         | Example                                                           | Required | Description                                                                                                                                                                                                                                                                                                                                                                     |
| ------------ | ----------------------------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SetEnvironment | 1 | False     | Run the script with SetEnvironment = 1, after import to create the required client-EDFs and system properties.  |

## EDFs

 

| Name | Type | Level | Section | Editable | Required | Description |
| ------------- | ------ | ------ | ----- | ----- | ----- | -------------------------------------------- |
| `Cybercns Company ID` | Text | Client | CyberCNS| Yes | True | This client EDF is created to store the CyberCNS company ID from the portal for the company whose agent must be installed. | 
| `CyberCNS Tenant ID` | Text | Client | CyberCNS |Yes | Partial True | This client EDF is created to store the CyberCNS tenant ID from the portal. |
| `CyberCNS Token` | Text | Client | CyberCNS |  Yes | Partial True | This client EDF is created to store the CyberCNS token from the portal. |
| `CyberCNS Deploy` | Checkbox | Client | CyberCNS  |  True | Yes | This EDF is required to be selected for the automated deployment of the CyberCNS Agent. |
| `Exclude CyberCNS Deploy` | Checkbox | Location | Exclusions  |   False | Yes | If this EDF is checked, the agents of the location will be excluded from the CyberCNS deployment |
| `Exclude CyberCNS Deploy` | Checkbox | Computer |  Exclusions |   False | Yes | If this EDF is checked, the agent will be excluded from the CyberCNS deployment |


## Properties

Document the various overwriting system properties in the script. 

| Name | Required | Description |
| ------------ | ------- | ------------------------------------------------------ |
| CyberCNS_TenantID | Partial True | Set to store the CyberCNS tenant ID from the portal. The client-EDF `CyberCNS Tenant ID` will override this property. |
| CyberCNS_Token | Partial True | Set to store the CyberCNS token from the portal. The client-EDF `CyberCNS Token` will override this property. |

## Process

1. Retrieve the values for the CompanyID, TenantID, and Token.
2. If anything is missing, create failure ticket.
3. If all values are present, download the installer.
4. Once downloaded, install the application.
5. After execution, verify the installation.

## Output

- Script log


## Changelog

 ### 2026-03-12

 - Introduced system properties `CyberCNS_TenantID` and `CyberCNS_Token` which will be overriden by the client EDFs.
 - Updated the script to use Vendor's logic

### 2025-04-10

- Initial version of the document
