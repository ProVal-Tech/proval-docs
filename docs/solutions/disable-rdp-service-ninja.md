---
id: '4e49b064-d81d-47ac-8711-78261a494f5b'
slug: /4e49b064-d81d-47ac-8711-78261a494f5b
title: 'Disable RDP Service'
title_meta: 'Disable RDP Service'
keywords: ['rdp', 'windows','disable']
description: 'Disables the Remote Desktop Services (TermService) service on supported Windows endpoints'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Purpose

This solution disables the Remote Desktop Services (TermService) service on supported Windows endpoints where Remote Desktop Protocol (RDP) service disablement is enabled.

The solution uses a NinjaOne custom field to centrally determine which Windows devices should have the RDP service disabled. Separate compound conditions automatically target Windows Workstations and Windows Servers based on the selected configuration.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers

When enabled for an endpoint, the associated automation stops the Remote Desktop Services (`TermService`) service, if running, and configures the service with a Disabled startup type.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f)   | Custom Field | Custom Field to choose the operating system to disable the Remote Desktop Protocol Service. |
| [Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062) | Automation |This script stops and disables the Disable Remote Desktop Protocol Service (TermService) service on Windows devices. |
| [Disable RDP Service - Workstations](/docs/7a05c718-053d-4823-8fcc-b3f44dd2c8f1)| Compound Condition |Triggers the [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062) on Windows workstations where service disablement is enabled through the [Custom Field - cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f). |
| [Disable RDP Service - Servers](/docs/200b5c1f-c4ac-45ad-9fe6-7d5bc426d130) | Compound Condition | Triggers the [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062) on Windows Servers where service disablement is enabled through the [Custom Field - cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f). |


## Implementation

The solution requires the custom field, automation, and applicable compound conditions to be configured in NinjaOne.

### Step 1: Create the Custom Field

Create the following custom field in NinjaOne:

* [cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f)

The custom field is used to determine whether RDP service disablement should be applied to Windows Workstations, Windows Servers, or both, based on the available options configured for the field.

### Step 2: Configure RDP Service Disablement

Set the [cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f) custom field on the applicable endpoint or at the appropriate organizational level.


### Step 3: Create the Automation

Create the following automation:

* [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062)

The automation verifies that the Remote Desktop Services (`TermService`) service exists on the device. If the service is present, it stops the service if it is running and configures the service with a Disabled startup type.

If the service is not present, the automation exits successfully without making changes.

### Step 4: Create the Compound Conditions

Create and apply the following compound conditions:

* [Compound Condition - Disable RDP Service - Workstations](/docs/7a05c718-053d-4823-8fcc-b3f44dd2c8f1)
* [Compound Condition - Disable RDP Service - Servers](/docs/200b5c1f-c4ac-45ad-9fe6-7d5bc426d130)

The Workstations compound condition targets supported Windows Workstations where RDP service disablement is enabled.

The Servers compound condition targets supported Windows Servers where RDP service disablement is enabled.

### Manual Configuration

No manual configuration is required directly on the endpoint.

The required configuration is performed through the NinjaOne custom field and associated compound conditions. Once the custom field is configured and the appropriate compound condition is applied through the agent policy, the automation can be triggered automatically for matching endpoints.

## FAQ

### Q: Which platforms are supported?

> The solution supports:
>
> * Windows Workstations
> * Windows Servers

### Q: What service does this solution disable?

> The solution disables the Remote Desktop Services (`TermService`) service, which provides Remote Desktop Protocol (RDP) functionality on Windows.

### Q: What happens when the solution runs?

> The automation verifies that the `TermService` service exists. If it is running, the service is stopped. The service startup type is then configured as Disabled to prevent it from starting automatically.

### Q: Does the automation make changes if the TermService service does not exist?

> No. If the Remote Desktop Services (`TermService`) service is not available on the device, the automation exits successfully without making changes.

### Q: How do I enable RDP service disablement for an endpoint?

> Configure the [cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f) custom field with the appropriate option for the endpoint's operating system.

### Q: How is the correct automation triggered?

> Separate compound conditions target Windows Workstations and Windows Servers. When the endpoint matches the applicable operating system and the [cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f) configuration, the [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062) is triggered.

### Q: Is any manual configuration required on the endpoint?

> No. The solution is designed to manage the RDP service through NinjaOne custom fields, automations, and compound conditions.

### Q: What happens if RDP service disablement is not enabled?

> If the endpoint does not match the configuration required by the applicable compound condition, the automation is not triggered for that endpoint.

### Q: Will disabling the service prevent Remote Desktop connections?

> Yes. Disabling the Remote Desktop Services (`TermService`) service prevents the Windows Remote Desktop service from operating while the service remains disabled.


## Changelog

### 2026-10-07

- Initial version of the document
