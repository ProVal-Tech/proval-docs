---
id: '2b379cba-388e-4980-834b-f7f6654efe3b'
slug: /2b379cba-388e-4980-834b-f7f6654efe3b
title: 'Microsoft 365 - Click-to-Run - Set Update Channel'
title_meta: 'Microsoft 365 - Click-to-Run - Set Update Channel'
keywords: ['microsoft', 'update', 'channel', 'custom', 'field', 'task']
description: 'This document outlines the steps to set the update channel for Microsoft 365 products using Custom Fields in Ninja RMM. It includes links to associated content and implementation instructions for creating the necessary fields and tasks.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-08
---

## Purpose

The purpose of this solution is to set the Update Channel for Microsoft 365 products.

## Associated Content

| Content                                                                                         | Type        | Function                                                                                                      |
|-------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------|
| [cPVAL Set Update Channel](/docs/203a58a8-4041-4d8a-bbfc-c7f0f6b3531f) | Custom Field | Select Channel Type from the drop-down menu for all computers within the client.  |                           
| [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/2eec1401-f132-4bd2-8b63-d5d0faf64059) | Script | This will make changes in the registry to set the update channel for Microsoft 365 products to the value set in the client or computer-level custom fields `Update Channel`. |

## Optional Content

|Content | Type | Function |
|----------|--------|----------|
| [Microsoft 365 - Click-to-Run - Get Details](/docs/f493756c-e4e0-4aba-af87-9aef14f389aa)  | Soluion | The purpose of this solution is to retrieve the installed Microsoft Click-to-Run Office version and Update Channel status on the machines.  |

## Implementation

Create the following custom fields:
- [cPVAL Set Update Channel](/docs/203a58a8-4041-4d8a-bbfc-c7f0f6b3531f)

Create Automation:
- [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/2eec1401-f132-4bd2-8b63-d5d0faf64059)

## FAQ

### Q1. What does this solution do?

`ANS:` This solution changes the Microsoft 365 Click-to-Run update channel by updating the required Office registry configuration values.


### Q2. Which Microsoft 365 update channels are supported?

`Ans:` The following channels are supported:

  - Current Channel
  - Monthly Enterprise Channel
  - Semi-Annual Enterprise Channel
  - Current Channel (Preview)
  - Semi-Annual Enterprise Channel (Preview)
  - Beta Channel
  - LTSC Channel (up to Office 2019)
  - LTSC Channel (Preview)
  - LTSC 2021 Channel (Office 2021+)

### Q3. How is the update channel selected?

`Ans:` The update channel is selected using the NinjaOne Custom Field: `cPVAL Update Channel`. The script can also use the environment variable:  `ChannelUpdate`

### Q4. Does this script require administrator privileges?

`Ans:` Yes. The script must run with administrative privileges because it modifies registry values under:

  - `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration`

### Q5. Which registry values are modified?

`Ans:` The script updates the following registry values:

  - `CDNBaseUrl`
  - `UpdateChannel`
  - `UnmanagedUpdateUrl`

### Q6. Will this immediately update Microsoft 365 applications?

`Ans:` No. The script only changes the configured update channel. Microsoft 365 applications will switch channels during the next Office update cycle or when an Office update is manually triggered.

### Q7. Can this be deployed at the client level?

`Ans:` Yes. The custom field can be configured at either depending on deployment requirements:
  - Client Level
  - Site Level
  - Device Level

### Q8. What happens if the registry path does not exist?

`Ans:` The script automatically creates the registry path if it is missing.

### Q9. Does this script reboot the device?

`Ans:` No. A reboot is not required after changing the update channel.

### Q10. How does the optional solution "Microsoft 365 - Click-to-Run - Get Details" helps?

`Ans:` This solution provides visibility into the Update Channel configured on the machine. The channel status can be verified through the custom field [cPVAL C2R Update Channel](/docs/76865fc9-4736-4590-b365-e4f858b6da8d/). 

## Changelog

### 2026-05-08

- Initial version of the document

