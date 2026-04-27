---
id: '84a1de4d-0f17-407a-8c98-7ffc76e1d150'
slug: /84a1de4d-0f17-407a-8c98-7ffc76e1d150
title: 'Install All Updates'
title_meta: 'Install All Updates'
keywords: ['vendor-specific','windows','patching','updates','application','installation','software','dell','lenovo','hp','drivers','bios','firmware']
description: 'This solution provides a simple, centralized way to install updates for Dell, HP, Lenovo, and Windows systems. It lets users, choose what updates to run using parameters, making the process flexible and consistent. By handling everything in one place, it simplifies maintenance and helps to keep devices up to date.'
tags: ['windows','patching','application','installation','software','dell','lenovo','hp','drivers','bios','firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-21
---

## Purpose

This solution provides a simple, centralized way to install updates for Dell, HP, Lenovo, and Windows systems. It lets users, choose what updates to run using parameters, making the process flexible and consistent. By handling everything in one place, it simplifies maintenance and helps to keep devices up to date.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Enable All Updates](/docs/ec240162-384b-4cf1-b111-090b55838dc6)  | Custom Field  | Controls solution deployment across different clients. |
| [Disable All Updates](/docs/5ee16bfb-503e-40e9-a037-868afbc17f0c)  | Custom Field  | Controls solution exclusion across Sites/Endpoints. |
| [Deploy All Updates](/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341)  | Group | Includes Windows workstations that have been opted for the solution. |
| [Install Updates - Dell, HP, Lenovo, Windows](/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341)  | Script | Installs updates for Dell, HP, Lenovo, and Windows based on the parameters selected. |

## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
  - [Enable All Updates](/docs/ec240162-384b-4cf1-b111-090b55838dc6)
  - [Disable All Updates](/docs/5ee16bfb-503e-40e9-a037-868afbc17f0c)
- Create [ Deploy All Updates](/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341) using the implementation instruction provided in the documents.
- Create [Install Updates - Dell, HP, Lenovo, Windows](/docs/f5a97ff3-ac6c-4d50-a826-5fcfa40cb341) using the implementation instruction provided in the documents.

## FAQ

### What is the Default behaviour of the script?

> If no parameters are selected when running the script, it will install Windows driver updates by default.

### Does Script works for multiple OEM simultaneously?

> Yes, the script supports multiple OEMs at the same time. You can choose different update types for each OEM, such as all updates for Dell machines, BIOS and firmware updates for HP machines, and driver updates for Lenovo machines. You can also select the type of Windows updates separately.

### Does windows updates will work if any OEM update is selected for a machine?

> No, if an OEM update is selected, the script will not run Windows updates. It will only perform the selected OEM updates.

### what is default behaviour for an OEM update if update type is not selected?

> If no update type is specified for an OEM, the script will perform driver updates by default.

### Does it automatically reboots the machines?

> No, the script does not automatically reboot the machine. However, a reboot can be enabled by using the Reboot parameter when running the script.


## Changelog

### 2026-04-21

- Initial version of the document