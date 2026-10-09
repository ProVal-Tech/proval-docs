---
id: '70d10692-83c6-4c25-b546-9beadaba5468'
slug: /70d10692-83c6-4c25-b546-9beadaba5468
title: 'Disable UPnP Service'
title_meta: 'Disable UPnP Service'
keywords: ['upnp', 'windows','disable']
description: 'Disables the UPnP Device Host (upnphost) service on supported Windows endpoints'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Purpose

This solution disables the UPnP Device Host (`upnphost`) service on supported Windows endpoints where UPnP service disablement is enabled.

The solution uses a NinjaOne custom field to centrally determine which Windows devices should have the UPnP Device Host service disabled. Separate compound conditions automatically target Windows Workstations and Windows Servers based on the selected configuration.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers

When enabled for an endpoint, the associated automation stops the UPnP Device Host (`upnphost`) service, if running, and configures the service with a Disabled startup type.


## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba)  | Custom Field | Custom Field to choose operating system to disable the UPnP Device Host (upnphost) service on Windows devices. |
| [Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) | Automation | This script stops and disables the UPnP Device Host (upnphost) service on Windows devices. |
| [Disable UPnP Service - Workstations](/docs/de590749-0673-456b-b8c8-65d7eaf1cc0f)| Compound Condition | Triggers the [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) on Windows workstations where UPnP service disablement is enabled through the [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) |
| [Disable UPnP Service - Servers](/docs/b9c741fb-911c-410e-b0d4-754f4436fa60) | Compound Condition |Triggers the [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) on Windows Servers where UPnP service disablement is enabled through the [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) |


## Implementation

The solution requires the custom field, automation, and applicable compound conditions to be configured in NinjaOne.

### Step 1: Create the Custom Field

Create the following custom field in NinjaOne:

* [cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba)

The custom field is used to determine whether UPnP Device Host service disablement should be applied to Windows Workstations, Windows Servers, or both, based on the available options configured for the field.

### Step 2: Configure UPnP Service Disablement

Set the [cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) custom field on the applicable endpoint or at the appropriate organizational level.

### Step 3: Create the Automation

Create the following automation:

* [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e)

The automation verifies that the UPnP Device Host (`upnphost`) service exists on the device. If the service is present, it stops the service if it is running and configures the service with a Disabled startup type.

If the service is not present, the automation exits successfully without making changes.

### Step 4: Create the Compound Conditions

Create and apply the following compound conditions:

* [Compound Condition - Disable UPnP Service - Workstations](/docs/de590749-0673-456b-b8c8-65d7eaf1cc0f)
* [Compound Condition - Disable UPnP Service - Servers](/docs/b9c741fb-911c-410e-b0d4-754f4436fa60)

The Workstations compound condition targets supported Windows Workstations where UPnP service disablement is enabled.

The Servers compound condition targets supported Windows Servers where UPnP service disablement is enabled.

### Manual Configuration

No manual configuration is required directly on the endpoint.

The required configuration is performed through the NinjaOne custom field and associated compound conditions. Once the custom field is configured and the appropriate compound condition is applied through the agent policy, the automation can be triggered automatically for matching endpoints.


## FAQ

### Q: Which platforms are supported?

> The solution supports:
> * Windows Workstations
> * Windows Servers

### Q: What service does this solution disable?

> The solution disables the UPnP Device Host (`upnphost`) service on Windows.

### Q: What happens when the solution runs?

> The automation verifies that the `upnphost` service exists. If it is running, the service is stopped. The service startup type is then configured as Disabled to prevent it from starting automatically.

### Q: Does the automation make changes if the UPnP Device Host service does not exist?

> No. If the UPnP Device Host (`upnphost`) service is not available on the device, the automation exits successfully without making changes.

### Q: How do I enable UPnP service disablement for an endpoint?

> Configure the [cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) custom field with the appropriate option for the endpoint's operating system.

### Q: How is the correct automation triggered?

> Separate compound conditions target Windows Workstations and Windows Servers. When the endpoint matches the applicable operating system and the [cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) configuration, the [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) is triggered.

### Q: Is any manual configuration required on the endpoint?

> No. The solution is designed to manage the UPnP Device Host service through NinjaOne custom fields, automations, and compound conditions.

### Q: What happens if UPnP service disablement is not enabled?

> If the endpoint does not match the configuration required by the applicable compound condition, the automation is not triggered for that endpoint.

### Q: Will disabling the UPnP Device Host service affect UPnP functionality?

> Yes. Disabling the UPnP Device Host (`upnphost`) service prevents Windows from providing functionality that depends on this service while it remains disabled.

## Changelog

### 2026-10-09

- Initial version of the document
