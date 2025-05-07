---
id: '67f4ab8a-5eb0-49f6-ae41-4b3a308b1f11'
slug: /67f4ab8a-5eb0-49f6-ae41-4b3a308b1f11
title: 'Weak Passwords Audit'
title_meta: 'Weak Passwords Audit'
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
| [CW RMM - Custom Field - Company - Weak Password Count](/docs/1a75efd1-8457-4b11-b9a8-0f7fe1a39db6)  | Text  | Endpoint | Holds the count of accounts with weak passwords gathered by [RSM - Active Directory - Script - Weak Passwords - AD Test](/docs/cf22292d-e874-47ee-9bd1-5ec79c5f3724) |
| [CW RMM - Custom Field - Company - Duplicate Password Count](/docs/98a07020-b4e1-4787-a829-9176de0a8b52) | Text  | Endpoint | Holds the count of accounts with duplicate passwords gathered by [RSM - Active Directory - Script - Weak Passwords - AD Test](/docs/cf22292d-e874-47ee-9bd1-5ec79c5f3724) |

#### Device Groups

| Content                                                                                                        | Type    | Description                          |
|----------------------------------------------------------------------------------------------------------------|---------|--------------------------------------|
| [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)                | Dynamic | This group contains the Domain Controllers. |

#### Monitors

| Content                                                                                                     | Type          | Description                                                                                         |
|-------------------------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------|
| [CW RMM - Monitor - Weak Passwords Detected](/docs/827c282a-8701-42f9-87d3-8dbb7372134d)              | Custom Field  | It creates a ticket if accounts with weak passwords are detected on a domain controller.           |
| [CW RMM - Monitor - Duplicate Password Detected](/docs/d093a07d-e012-4755-a3c1-ffd234b2905c)         | Custom Field  | It creates a ticket if accounts with duplicate passwords are detected on a domain controller.       |

#### Tasks

| Content                                                                                                   | Description                                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - Weak Passwords - AD Test](/docs/1d54d079-e038-46a7-8a03-fe6bad481487)              | This task utilizes the agnostic script [Test-WeakCredentials](/docs/9188a8e9-ba15-45aa-9391-d412866b1ebc  ) to test the hashed credentials in AD against a known compromised or weak list. |

## Implementation

1. Create the following custom fields:
   - [CW RMM - Custom Field - Company - Weak Password Count](/docs/1a75efd1-8457-4b11-b9a8-0f7fe1a39db6)
   - [CW RMM - Custom Field - Company - Duplicate Password Count](/docs/98a07020-b4e1-4787-a829-9176de0a8b52)

2. Create the following device group:
   - [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)

3. Create the following monitors:
   - [CW RMM - Monitor - Weak Passwords Detected](/docs/827c282a-8701-42f9-87d3-8dbb7372134d)
   - [CW RMM - Monitor - Duplicate Password Detected](/docs/d093a07d-e012-4755-a3c1-ffd234b2905c)

4. Create and deploy the following task:
   - [CW RMM - Task - Weak Passwords - AD Test](/docs/1d54d079-e038-46a7-8a03-fe6bad481487)


