---
id: '67f4ab8a-5eb0-49f6-ae41-4b3a308b1f11'
title: 'Weak Passwords Detection in ConnectWise RMM'
title_meta: 'Weak Passwords Detection in ConnectWise RMM'
keywords: ['weak', 'passwords', 'detection', 'connectwise', 'rmm']
description: 'This document outlines a solution for detecting users with potentially compromised passwords by querying known password hashes. It includes details on custom fields, device groups, monitors, and tasks necessary for implementation in ConnectWise RMM.'
tags: ['active-directory', 'report', 'security']
draft: false
unlisted: false
---
## Purpose

This solution gathers information on users with potentially compromised passwords by querying currently available comprehensive lists of known password hashes.

## Associated Content

#### Custom Fields

| Content                                                                                                    | Type  | Level    | Function                                                                                                                                              |
|------------------------------------------------------------------------------------------------------------|-------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Company - Weak Password Count](https://proval.itglue.com/DOC-5078775-17872284)  | Text  | Endpoint | Holds the count of accounts with weak passwords gathered by [RSM - Active Directory - Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761) |
| [CW RMM - Custom Field - Company - Duplicate Password Count](https://proval.itglue.com/DOC-5078775-17872282) | Text  | Endpoint | Holds the count of accounts with duplicate passwords gathered by [RSM - Active Directory - Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761) |

#### Device Groups

| Content                                                                                                        | Type    | Description                          |
|----------------------------------------------------------------------------------------------------------------|---------|--------------------------------------|
| [CW RMM - Machine Group - Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214)                | Dynamic | This group contains the Domain Controllers. |

#### Monitors

| Content                                                                                                     | Type          | Description                                                                                         |
|-------------------------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------|
| [CW RMM - Monitor - Weak Passwords Detected](https://proval.itglue.com/DOC-5078775-17872291)              | Custom Field  | It creates a ticket if accounts with weak passwords are detected on a domain controller.           |
| [CW RMM - Monitor - Duplicate Password detected](https://proval.itglue.com/DOC-5078775-17898333)         | Custom Field  | It creates a ticket if accounts with duplicate passwords are detected on a domain controller.       |

#### Tasks

| Content                                                                                                   | Description                                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-17546396)              | This task utilizes the agnostic script [Test-WeakCredentials](https://proval.itglue.com/DOC-5078775-9622592) to test the hashed credentials in AD against a known compromised or weak list. |

## Implementation

1. Create the following custom fields:
   - [CW RMM - Custom Field - Company - Weak Password Count](https://proval.itglue.com/DOC-5078775-17872284)
   - [CW RMM - Custom Field - Company - Duplicate Password Count](https://proval.itglue.com/DOC-5078775-17872282)

2. Create the following device group:
   - [CW RMM - Machine Group - Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214)

3. Create the following monitors:
   - [CW RMM - Custom Field - Company - Weak Password Count](https://proval.itglue.com/DOC-5078775-17872284)
   - [CW RMM - Monitor - Duplicate Password detected](https://proval.itglue.com/DOC-5078775-17898333)

4. Create and deploy the following tasks:
   - [CW RMM - Task - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-17546396)











