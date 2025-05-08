---
id: '21ae27d2-c179-4f26-92cf-15760af6791a'
slug: /21ae27d2-c179-4f26-92cf-15760af6791a
title: 'Service StartType Change'
title_meta: 'Service StartType Change'
keywords: ['services', 'starttype', 'configuration', 'windows', 'automation']
description: 'This document provides a detailed overview of a script that configures the start type for specified services in Windows. It includes parameters, available start types, file hash information, sample run output, and variable descriptions for effective implementation.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary
This script configures the start type for specified services.

## Parameters
- **Services**: A list of services to configure.
- **StartType**: The desired start type for the specified services.

**Note:**  
Please ensure each service name is enclosed in single quotes.  
Example: `'wuauserv', 'bits', 'cryptsvc', 'VaultSvc', 'dtestv'`

**Available StartType Values**
- **DelayStart**: Sets the service start type to 'Automatic (Delayed Start)'
- **Manual**: Sets the service start type to 'Manual'
- **Automatic**: Sets the service start type to 'Automatic'
- **Disabled**: Sets the service start type to 'Disabled'

Please have the following file hash whitelisted in your security environment to prevent blocking:

**File Path:**  
`C:/ProgramData/_automation/script/SVC-SetStartType/SVC-SetStartType.ps1`  
**File Hash (SHA256):**  
`16C105FE35406D9980177C52EB0D68FDE07A5CE3948A2949761C7359C1AC0AB`  
**File Hash (MD5):**  
`BCEC14B37F7DF39D1F9D74AC14B7D526`

## Sample Run
![Sample Run](/img/docs/21ae27d2-c179-4f26-92cf-15760af6791a/data.webp)

## Variables

| Name               | Description                                                  |
|--------------------|--------------------------------------------------------------|
| **WorkingDirectory** | The directory where the PS1 file will be placed for operation. |
| **ProjectName**     | The name of the PS1 file and its parent folder.              |
| **psout**           | Stores the output of the PS1 execution.                      |

## Global Parameters

| Name                     | Example | Required | Description                                                                                                                                                                                                                      |
|--------------------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **TicketCreationCategory** | 123     | False    | Specify this if a ticket is required upon failure or success, pointing to the appropriate category on the service board. Ensure the correct category is used, mapped to the required service board with the proper priority, as per client requirements. |

## User Parameters

| Name      | Example                                         | Required | Description                                                                                                           |
|-----------|-------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------|
| **Services**   | `'wuauserv', 'bits', 'cryptsvc', 'VaultSvc'` | True     | A list of services whose start type needs to be changed. Each service name must be enclosed in single quotes. Separate multiple services with a comma (,). |
| **StartType** | `Manual`                                       | True     | The start type to set for the specified services. Accepted values are: `DelayStart`, `Manual`, `Automatic`, `Disabled`. |

## Output
- Script log
- Ticket
