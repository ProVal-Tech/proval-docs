---
id: 'f1ae37d6-7fa7-414c-8550-1ae9ea11b987'
slug: /f1ae37d6-7fa7-414c-8550-1ae9ea11b987
title: 'Windows 10 ESU Licensing and Auditing'
title_meta: 'Windows 10 ESU Licensing and Auditing'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'This solution built to explain the ESU licensing audit and license activation in Ninja RMM'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Purpose

This solution provides automated auditing of Windows 10 Extended Security Updates (ESU) license status across Windows 10 22H2 machines using NinjaOne platform. It includes functionality to track activation status and optionally deploy ESU licenses when needed.

**References:**

- [Enable Extended Security Updates](https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates)
- [Deploy Windows 10 Security Updates with Intune or SCCM](https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/)

## Associated Content

### Custom Fields

| Content | Type | Available Options | Function |
| ------- | ---- | ----------------- | -------- |
| [cPVAL ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59) | Text | | Stores the endpoint's ESU status fetched by the ESU License Activation Detection script |
| [cPVAL ESU Key](/docs/6d3f6848-1c50-44e1-867a-1eb3ef94f419) | Text | | Stores the ESU license key for activation of Windows 10 extended use |
| [cPVAL ESU Year](/docs/e54c319a-a8e9-4d58-9a67-6c310289320f) | Drop-down | `1`, `2`, `3` | Stores the ESU license key year validation |

### Automations

| Content | Function |
| ------- | -------- |
| [ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015) | Checks ESU license activation status and updates the ESU Status custom field |
| [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380) | Applies ESU license on Windows 10 22H2 systems |

### Groups

| Content | Function |
| ------- | -------- |
| [cPVAL Windows 10 22H2](/docs/de098cf9-4ed4-49bb-b302-df3b76d70590) | Contains Windows 10 22H2 machines for ESU auditing |
| [cPVAL Win10 ESU Activated](/docs/07f95e9f-bcf2-4544-aa45-9ee3a9515316) | Dynamic group of Windows 10 devices with activated ESU |
| [cPVAL Win10 ESU Not Activated](/docs/eece6281-68b5-49f6-9c47-e48f9c929bd4) | Dynamic group of Windows 10 devices without ESU activation |

### Tasks

| Content | Function |
| ------- | -------- |
| [Windows 10 22H2 ESU Audit](/docs/d0241d14-c13f-4113-99ed-e267befd3103) | Daily scheduled task that runs ESU License Activation Detection script on Windows 10 22H2 machines |

## Implementation

### Step 1

Create the following custom fields:

- [cPVAL ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59)
- [cPVAL ESU Key](/docs/6d3f6848-1c50-44e1-867a-1eb3ef94f419)
- [cPVAL ESU Year](/docs/e54c319a-a8e9-4d58-9a67-6c310289320f)

### Step 2

Create the following automations:

- [ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015)
- [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380)

### Step 3

Create the following groups:

- [cPVAL Windows 10 22H2](/docs/de098cf9-4ed4-49bb-b302-df3b76d70590)
- [cPVAL Win10 ESU Activated](/docs/07f95e9f-bcf2-4544-aa45-9ee3a9515316)
- [cPVAL Win10 ESU Not Activated](/docs/eece6281-68b5-49f6-9c47-e48f9c929bd4)

### Step 4

Create the [Windows 10 22H2 ESU Audit](/docs/d0241d14-c13f-4113-99ed-e267befd3103) scheduled task to run daily ESU status checks.

### Step 5

To activate ESU on machines:

1. Set the [ESU Key](/docs/6d3f6848-1c50-44e1-867a-1eb3ef94f419) and [ESU Year](/docs/e54c319a-a8e9-4d58-9a67-6c310289320f) values at organization/location/device level
2. Run the [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380) automation on target devices
3. Monitor the ESU activation status through dynamic groups.

## Frequently Asked Questions

### Q: What is Windows 10 ESU?

**A:** Extended Security Updates (ESU) for Windows 10 provides critical security updates after Windows 10's end of support date. This helps organizations maintain security compliance while planning their Windows 11 migration.

### Q: How do I know if ESU is activated on a device?

**A:** You can check the ESU activation status in two ways:

1. View the [cPVAL ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59) custom field value for the device
2. Check if the device appears in the [cPVAL Win10 ESU Activated](/docs/07f95e9f-bcf2-4544-aa45-9ee3a9515316) dynamic group

### Q: How often is the ESU status checked?

**A:** The ESU status is checked daily through the [Windows 10 22H2 ESU Audit](/docs/d0241d14-c13f-4113-99ed-e267befd3103) scheduled task that runs at 11:30 AM.

### Q: Can I exclude specific devices from ESU deployment?

**A:** Yes, you can manage ESU deployment at three levels:

- Organization level: Set default ESU key and year
- Location level: Override organization settings if needed
- Device level: Configure specific settings for individual devices

### Q: What happens if ESU activation fails?

**A:** If activation fails:

1. The device will appear in the [cPVAL Win10 ESU Not Activated](/docs/eece6281-68b5-49f6-9c47-e48f9c929bd4) group
2. The [cPVAL ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59) field will indicate the failure reason
3. You can retry activation by running the [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380) automation again

### Q: Can I automate the ESU license deployment?

**A:** Yes, you can:

1. Configure the ESU key and year at the desired level (organization/location/device)
2. Create a scheduled task using the [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380) automation
3. Target the [cPVAL Win10 ESU Not Activated](/docs/eece6281-68b5-49f6-9c47-e48f9c929bd4) group
