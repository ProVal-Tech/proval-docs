---
id: 'a68fa93c-45c7-4491-80d1-5e7543016b7f'
slug: /a68fa93c-45c7-4491-80d1-5e7543016b7f
title: 'Deploy QuickPass Agent'
title_meta: 'Deploy QuickPass Agent'
keywords: ['quickpass', 'agent', 'windows', 'install']
description: 'Deploys the QuickPass Agent on Windows Workstations and Windows Servers where deployment is enabled, and optionally configures the Duo Security Credential Provider to allow QuickPass.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

## Purpose

This solution deploys the QuickPass Agent on supported Windows machines where deployment is enabled. It can also configure the Duo Security Credential Provider to allow QuickPass.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers

Administrators can centrally choose which operating systems receive the QuickPass Agent using a NinjaOne custom field, and provide the QuickPass Agent ID, Token, and Region at the organization, location, or device level. The [Compound Condition - Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) and [Compound Condition - Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) then trigger the [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a), which installs the agent and replaces the older agent when needed.

## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) | Custom field to select the operating system for deploying QuickPass agents on the endpoints. |
| [cPVAL QuickPass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88) | Custom field to enter the QuickPass Agent ID to associate the endpoint with the correct client organization for centralized management and site-level administration. |
| [cPVAL QuickPass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691) | Custom Field to enter the QuickPass Token to authenticate the installer and associate the endpoint with the correct MSP/tenant account. |
| [cPVAL QuickPass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) | Custom field to enter the QuickPass Region to connect the agent to the appropriate regional QuickPass service endpoint for installation and communication. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) | Deploys the QuickPass Agent, replacing the older agent when needed, and can also configure the Duo Security Credential Provider to allow QuickPass. |
| [Uninstall QuickPass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f) | Uninstalls the QuickPass Agent from a Windows device. |

### Compound Condition

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) | Triggers the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on Windows Workstations where deployment is enabled. |
| [Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) | Triggers the [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on Windows Servers where deployment is enabled. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These fields are required for the solution to function correctly.

* [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687)
* [cPVAL QuickPass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88)
* [cPVAL QuickPass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691)
* [cPVAL QuickPass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374)

### Step 2: Configure the QuickPass Details

Populate the following custom fields at the organization, location, or device level with the values provided by the QuickPass portal:

* [cPVAL QuickPass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88) - The QuickPass Agent ID for the client organization.
* [cPVAL QuickPass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691) - The QuickPass Token used to authenticate the installer.
* [cPVAL QuickPass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) - The QuickPass Region of the tenant (for example, `US`).

### Step 3: Enable the Deployment

Set the [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to select the operating systems where the QuickPass Agent should be deployed.

* Disable - The QuickPass Agent is not deployed.
* Windows - Deploys the QuickPass Agent on Windows Workstations and Windows Servers.
* Windows Workstations - Deploys the QuickPass Agent on Windows Workstations only.
* Windows Servers - Deploys the QuickPass Agent on Windows Servers only.

Endpoints where the field is not configured are not targeted by the compound conditions.

### Step 4: Create the Automations

Set up the following automations:

* [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a)
* [Automation - Uninstall QuickPass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f)

Select the `Configure Duo Registry` parameter in the [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) when the Duo Security Credential Provider must be configured to allow QuickPass.

### Step 5: Create the Compound Conditions

Create the following compound conditions and apply them to the recommended agent policies:

* [Compound Condition - Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) - Apply to the `Windows Workstations` agent policies.
* [Compound Condition - Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) - Apply to the `Windows Servers` agent policies.

The compound conditions trigger the [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on machines where deployment is enabled through the [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field.

## FAQ

### Q: Which platforms are supported?

> The solution supports Windows Workstations and Windows Servers.

### Q: Where do I find the QuickPass Agent ID, Token, and Region?

> These values are available in the QuickPass portal. Enter them in the [cPVAL QuickPass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88), [cPVAL QuickPass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691), and [cPVAL QuickPass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) custom fields.

### Q: Can different clients use different QuickPass details?

> Yes. The QuickPass custom fields can be set at the organization, location, or device level, so each client or site can use its own Agent ID, Token, and Region.

### Q: How do I deploy the agent only on workstations or only on servers?

> Set the [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to `Windows Workstations` or `Windows Servers`. Select `Windows` to deploy on both.

### Q: What happens if an older QuickPass Agent is already installed?

> The [Automation - QuickPass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) replaces the older agent when needed.

### Q: What does the Configure Duo Registry option do?

> When selected, the automation configures the Duo Security Credential Provider to allow QuickPass on the endpoint.

### Q: How do I remove the QuickPass Agent from a machine?

> Run the [Automation - Uninstall QuickPass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f) on the machine, and set the [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to `Disable` to prevent the agent from being deployed again.

### Q: What happens when the Enable QuickPass Deployment field is not configured?

> When the [cPVAL Enable QuickPass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field is not configured or is set to `Disable`, the endpoint is not targeted by the compound conditions and the QuickPass Agent is not deployed.

## Changelog

### 2026-10-22

* Initial version of the document.
