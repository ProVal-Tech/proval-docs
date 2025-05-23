---
id: '9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5'
slug: /9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5
title: 'Sentinel One Settings Verification'
title_meta: 'Sentinel One Settings Verification'
keywords: ['sentinelone', 'token', 'verification', 'connectwise', 'automate']
description: 'This document provides a comprehensive guide on how to obtain the site key and URL associated with a target endpoint in ConnectWise Automate, and compare it to the value set in the Client-level EDF named "SentinelOne SITE_TOKEN". It includes variables, parameters, configuration, and output details.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

This document outlines how to obtain the site key and URL associated with the target endpoint and compare that value to the one set in ConnectWise Automate's Client-level EDF named "SentinelOne SITE_TOKEN".

## Sample Run

![Sample Run](../../../static/img/docs/9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5/image_1.webp)

## Variables

| Name                     | Description                                                                                      |
|--------------------------|--------------------------------------------------------------------------------------------------|
| NumRuns                  | This holds the number of times the script has run on the target machine.                        |
| TickID                   | The ticket number for any currently open ticket with the same subject.                          |
| Resolved                 | This variable determines if the end state of the script is a resolved state.                    |
| TicketFinishBody         | The note added to the ticket if the script has resolved the issue.                              |
| MachineDecryptedValue    | The decrypted value of the machine base-64 string.                                            |
| ClientDecryptValue       | The decrypted value of the client base-64 string.                                             |
| MachineUrl               | The URL portion of the decrypted string for the machine.                                       |
| MachineUrlSha            | The SHA value of the machine URL.                                                               |
| MachineSiteKey           | The SiteKey portion of the decrypted string for the machine.                                   |
| MachineKeySHA            | The SHA value of the machine site key.                                                         |
| ClientUrl                | The URL portion of the decrypted string for the client.                                        |
| ClientUrlSha             | The SHA value of the client URL.                                                                |
| ClientSiteKey            | The SiteKey portion of the decrypted string for the client.                                    |
| ClientKeySha             | The SHA value of the Client site key.                                                          |
| TicketBody               | The note added to the ticket regarding the results of the script.                               |

#### Global Parameters

| Name                     | Example                                                                                     | Required | Description                                                                                     |
|--------------------------|---------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------|
| TicketCreateSubject      | Unmatching SentinelOne Token for %LocationName% / %ComputerName% (%ComputerID%)         | True     | The subject of any created ticket for this script.                                            |
| TicketCreationCategory    | 1                                                                                          | True     | The ticket creation category to assign to any created ticket.                                 |

## User Parameters

| Name              | Example | Required | Description                                                                                                    |
|-------------------|---------|----------|----------------------------------------------------------------------------------------------------------------|
| Set_Environment    | 1       | Yes      | Set to 1 for first-time implementation. Running the script with the user parameter `Set_Environment` as `1` will import the System Properties needed for the script. |

## System Properties

| Name                                 | Example                      | Required | Description                                                                                      |
|--------------------------------------|------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Client_Level_Sentinel_One_Token_EDF_Name | SentinelOne_SITE_TOKEN       | True     | The name of the client-level EDF storing the SentinelOne Site Token.                            |

## EDF Configuration

Do not encrypt the EDF used in the Global Variable `Client_Level_Sentinel_One_Token_EDF_Name`.

**Incorrect Configuration:**

![Incorrect Configuration](../../../static/img/docs/9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5/image_2.webp)

**Correct Configuration:**

![Correct Configuration](../../../static/img/docs/9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5/image_3.webp)

## Output

### TicketCreationCategory 

The script will use the ticket creation category mentioned in the monitor [CWM - Automate - Internal Monitor - Execute Script - Sentinel One Settings Verification](/docs/a115d376-6bc5-4392-8407-a6a5448445cf).

![TicketCreationCategory](../../../static/img/docs/9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5/image_4.webp)

### Ticket

![Ticket](../../../static/img/docs/9eb5531e-3a3f-43a6-88e6-cf2b3dc5ebb5/image_5.webp)

### Example: 

**Subject:** `Unmatching SentinelOne Token for %LocationName% / %ComputerName%`

**Body:**

```
The machine details do not match the correct client details.
The agent reports the following details:
SentinelOne URL is: <URL>
SentinelOne Site key is: <LicenseKey>

Automate is configured to install as follows:
SentinelOne URL should be: <URL>
SentinelOne Site key should be: <LicenseKey>
To resolve a license key mismatch in SentinelOne, you must uninstall and then reinstall the software using the correct license key.
```