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

The purpose of this solution is to set the update channel for Microsoft 365 products.

## Associated Content

| Content                                                                                         | Type        | Function                                                                                                      |
|-------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------|
| [Custom Field - cPVAL Update Channel](/docs/203a58a8-4041-4d8a-bbfc-c7f0f6b3531f) | Custom Field | Select Channel Type from the drop-down menu for all computers within the client.  |                           
| [Automation - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/2eec1401-f132-4bd2-8b63-d5d0faf64059) | Script | This will make changes in the registry to set the update channel for Microsoft 365 products to the value set in the client or computer-level custom fields `Update Channel`. |

## Implementation

Create the following custom fields:
- [Custom Field - cPVAL Update Channel](/docs/203a58a8-4041-4d8a-bbfc-c7f0f6b3531f)

Create Automation:
- [Automation - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/2eec1401-f132-4bd2-8b63-d5d0faf64059)

## FAQ

## 1. What does this solution do?

`ANS:` This solution changes the Microsoft 365 Click-to-Run update channel by updating the required Office registry configuration values.


### 2. Which Microsoft 365 update channels are supported?

`ANS:` The following channels are supported:

  - Current Channel
  - Monthly Enterprise Channel
  - Semi-Annual Enterprise Channel
  - Current Channel (Preview)
  - Semi-Annual Enterprise Channel (Preview)
  - Beta Channel
  - LTSC Channel (up to Office 2019)
  - LTSC Channel (Preview)
  - LTSC 2021 Channel (Office 2021+)

### 3. How is the update channel selected?

`ANS:` The update channel is selected using the NinjaOne Custom Field: -`cPVAL Update Channel`
       The script can also use the environment variable:  `ChannelUpdate`

### 4. Does this script require administrator privileges?

`ANS:` Yes. The script must run with administrative privileges because it modifies registry values under:

  - `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration`

### 5. Which registry values are modified?

`ANS:` The script updates the following registry values:

  - `CDNBaseUrl`
  - `UpdateChannel`
  - `UnmanagedUpdateUrl`

### 6. Will this immediately update Microsoft 365 applications?

`ANS:` No. The script only changes the configured update channel. Microsoft 365 applications will switch channels during the next Office update cycle or when an Office update is manually triggered.

### 8. Can this be deployed at the client level?

`ANS:` Yes. The custom field can be configured at either:

  - Client Level
  - Site Level
  - Device Level

  depending on deployment requirements.

### 9. What happens if the registry path does not exist?

`ANS:` The script automatically creates the registry path if it is missing.

### 10. Does this script reboot the device?

`ANS:` No. A reboot is not required after changing the update channel.

## Changelog

### 2026-05-08

- Initial version of the document

