---
id: 'a68fa93c-45c7-4491-80d1-5e7543016b7f'
slug: /a68fa93c-45c7-4491-80d1-5e7543016b7f
title: 'Deploy Quickpass Agent'
title_meta: 'Deploy Quickpass Agent'
keywords: ['quickpass', 'agent', 'windows', 'install']
description: 'Deploys the Quickpass Agent on Windows Workstations and Windows Servers where deployment is enabled, and optionally configures the Duo Security Credential Provider to allow Quickpass.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

## Purpose

This solution deploys the Quickpass Agent on supported Windows machines where deployment is enabled. It can also configure the Duo Security Credential Provider to allow Quickpass.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers

Administrators can centrally choose which operating systems receive the Quickpass Agent using a NinjaOne custom field, and provide the Quickpass Agent ID, Token, and Region at the organization, location, or device level. The [Compound Condition - Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) and [Compound Condition - Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) then trigger the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a), which installs the agent and replaces the older agent when needed.

## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) | Custom field to select the operating system for deploying Quickpass agents on the endpoints. |
| [cPVAL Quickpass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88) | Custom field to enter the Quickpass Agent ID to associate the endpoint with the correct client organization for centralized management and site-level administration. |
| [cPVAL Quickpass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691) | Custom Field to enter the Quickpass Token to authenticate the installer and associate the endpoint with the correct MSP/tenant account. |
| [cPVAL Quickpass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) | Custom field to enter the Quickpass Region to connect the agent to the appropriate regional Quickpass service endpoint for installation and communication. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) | Deploys the Quickpass Agent, replacing the older agent when needed, and can also configure the Duo Security Credential Provider to allow Quickpass. |
| [Uninstall Quickpass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f) | Uninstalls the Quickpass Agent from a Windows device. |

### Compound Condition

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) | Triggers the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on Windows Workstations where deployment is enabled. |
| [Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) | Triggers the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on Windows Servers where deployment is enabled. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These fields are required for the solution to function correctly.

* [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687)
* [cPVAL Quickpass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88)
* [cPVAL Quickpass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691)
* [cPVAL Quickpass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374)

### Step 2: Configure the Quickpass Details

Populate the following custom fields at the organization, location, or device level with the values provided by the Quickpass portal:

* [cPVAL Quickpass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88) - The Quickpass Agent ID for the client organization.
* [cPVAL Quickpass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691) - The Quickpass Token used to authenticate the installer.
* [cPVAL Quickpass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) - The Quickpass Region of the tenant (for example, `US`).

### Step 3: Enable the Deployment

Set the [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to select the operating systems where the Quickpass Agent should be deployed.

* Disable - The Quickpass Agent is not deployed.
* Windows - Deploys the Quickpass Agent on Windows Workstations and Windows Servers.
* Windows Workstations - Deploys the Quickpass Agent on Windows Workstations only.
* Windows Servers - Deploys the Quickpass Agent on Windows Servers only.

Endpoints where the field is not configured are not targeted by the compound conditions.

### Step 4: Create the Automations

Set up the following automations:

* [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a)
* [Automation - Uninstall Quickpass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f)

Select the `Configure Duo Registry` parameter in the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) when the Duo Security Credential Provider must be configured to allow Quickpass.

### Step 5: Create the Compound Conditions

Create the following compound conditions and apply them to the recommended agent policies:

* [Compound Condition - Deploy QuickPass Agent - Workstations](/docs/8602ab10-cdf8-44df-92e4-e043d434fea9) - Apply to the `Windows Workstations` agent policies.
* [Compound Condition - Deploy QuickPass Agent - Servers](/docs/d6786c8c-8a81-4c31-aa9c-8a163656526c) - Apply to the `Windows Servers` agent policies.

The compound conditions trigger the [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) on machines where deployment is enabled through the [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field.

## FAQ

### Q: Which platforms are supported?

> The solution supports Windows Workstations and Windows Servers.

### Q: Where do I find the Quickpass Agent ID, Token, and Region?

> These values are available in the Quickpass portal. Enter them in the [cPVAL Quickpass AgentID](/docs/851f4987-7956-4118-9cb7-fa7bbb7eaf88), [cPVAL Quickpass Token](/docs/3a6239b1-a7d1-470a-80de-f633f69d9691), and [cPVAL Quickpass Region](/docs/fb9e0161-eef4-46e3-b4ca-c879b8322374) custom fields.

### Q: Can different clients use different Quickpass details?

> Yes. The Quickpass custom fields can be set at the organization, location, or device level, so each client or site can use its own Agent ID, Token, and Region.

### Q: How do I deploy the agent only on workstations or only on servers?

> Set the [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to `Windows Workstations` or `Windows Servers`. Select `Windows` to deploy on both.

### Q: What happens if an older Quickpass Agent is already installed?

> The [Automation - Quickpass Agent Deployment](/docs/c9c32433-a31f-4740-9e3c-bf4b8d7aaa5a) replaces the older agent when needed.

### Q: What does the Configure Duo Registry option do?

> When selected, the automation configures the Duo Security Credential Provider to allow Quickpass on the endpoint.

### Q: How do I remove the Quickpass Agent from a machine?

> Run the [Automation - Uninstall Quickpass Agent](/docs/11e74fd1-615f-4df5-a3e4-a10fb1459e6f) on the machine, and set the [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field to `Disable` to prevent the agent from being deployed again.

### Q: What happens when the Enable Quickpass Deployment field is not configured?

> When the [cPVAL Enable Quickpass Deployment](/docs/c17bbbb4-4caf-49ae-9067-f8a752358687) custom field is not configured or is set to `Disable`, the endpoint is not targeted by the compound conditions and the Quickpass Agent is not deployed.

## Changelog

### 2026-10-22

* Initial version of the document.
