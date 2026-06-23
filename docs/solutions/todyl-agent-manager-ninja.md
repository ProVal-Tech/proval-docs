---
id: '01e0e3c8-adc5-4035-84d5-9266e5af0760'
slug: /01e0e3c8-adc5-4035-84d5-9266e5af0760
title: 'Todyl Agent Manager'
title_meta: 'Todyl Agent Manager'
keywords: ['todyl', 'todyl-agent', 'sgn-connect', 'deployment', 'windows']
description: 'Solution to automate the installation and uninstallation of the Todyl Agent on Windows and Mac endpoints managed by NinjaOne.'
tags: ['installation', 'uninstallation', 'security', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-06-22
---

## Purpose

This solution deploys and removes Todyl SGN Connect across Windows and Mac devices in NinjaOne.

Use one control field, [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3), to choose the action and target device type. The related compound conditions then run the correct automation automatically.

For protected endpoints, uninstallation can use [cPVAL Todyl Tamper Protection](/docs/f37b4a17-ada4-4455-8723-ef994cb6a803) and [cPVAL Todyl Maintenance Key](/docs/7dadd797-66b4-4f2e-b21a-6445b2841c1d) so removals complete safely.

## Associated Content

### Custom Fields

| Name | Default | Level | Function |
| --- | --- | --- | --- |
| [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) | `Disabled` | Org, Loc, Dev | Controls the deployment action. Select a target OS to install, or `Uninstall` to remove the agent. |
| [cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369) | - | Org, Loc, Dev | Todyl deployment key for Windows Desktop devices. |
| [cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0) | - | Org, Loc, Dev | Todyl deployment key for Windows Laptop devices. |
| [cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c) | - | Org, Loc, Dev | Todyl deployment key for Windows Servers. |
| [cPVAL Todyl Mac Policy Key](/docs/44b1e55c-ff5e-42d4-b232-a52a9b5c4ae5) | - | Org, Loc, Dev | Todyl deployment key for Mac devices. |
| [cPVAL Todyl Tamper Protection](/docs/f37b4a17-ada4-4455-8723-ef994cb6a803) | - | Org, Loc, Dev | Indicates whether tamper protection is active on the endpoint. When enabled, the uninstall scripts use the maintenance key. |
| [cPVAL Todyl Maintenance Key](/docs/7dadd797-66b4-4f2e-b21a-6445b2841c1d) | - | Org, Loc, Dev | The maintenance key used to disable tamper protection during uninstallation. |

### Deployment Options

The [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) dropdown determines which devices are targeted and what action is taken:

| Option | Effect |
| --- | --- |
| `Disabled` | No action taken. Existing installations remain unchanged. |
| `All` | Deploys Todyl to all supported Windows and Mac devices in scope. |
| `Windows` | Deploys Todyl to all Windows devices (Workstations and Servers) in scope. |
| `Windows Servers` | Deploys Todyl only to Windows Server devices in scope. |
| `Windows Workstations` | Deploys Todyl only to Windows Workstation devices in scope. |
| `Mac` | Deploys Todyl only to Mac devices in scope. |
| `Windows Workstations and Mac` | Deploys Todyl to Windows Workstations and Mac devices only. |
| `Uninstall` | Removes Todyl from all devices in scope where it is currently installed. |

Set this field at Organization level for broad rollout, then override at Location or Device level when needed.

### Automations

| Name | OS | Function |
| --- | --- | --- |
| [Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) | Windows | Installs or updates SGN Connect on Windows devices. |
| [Todyl Deployment [Macintosh]](/docs/f9f61fb3-68f5-43f8-9aa8-88a4d091d42b) | macOS | Installs or updates SGN Connect on Mac devices. |
| [Todyl Uninstall [Windows]](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9) | Windows | Removes SGN Connect from Windows devices. |
| [Todyl Uninstall [Macintosh]](/docs/7bf87cc4-d3d6-465d-a159-f0b4dd4890a6) | macOS | Removes SGN Connect from Mac devices. |

### Compound Conditions

| Name | Target | Function |
| --- | --- | --- |
| [Todyl Deployment [Windows Workstations]](/docs/737b576e-d7ac-48ec-ae04-14d7aa5f6d45) | Windows Workstations | Triggers [Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) when deployment is enabled for workstations. |
| [Todyl Deployment [Windows Servers]](/docs/10bbcdc1-b979-4d3b-9355-74587556ffee) | Windows Servers | Triggers [Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) when deployment is enabled for servers. |
| [Todyl Deployment [Macintosh]](/docs/c36416df-2a26-4528-ac3f-393de31a5b81) | macOS | Triggers [Todyl Deployment [Macintosh]](/docs/f9f61fb3-68f5-43f8-9aa8-88a4d091d42b) when deployment is enabled for Mac devices. |
| [Uninstall Todyl [Windows Workstations]](/docs/4aa89b28-4f6b-46a5-8249-3273f4af7a6d) | Windows Workstations | Triggers [Todyl Uninstall [Windows]](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9) when uninstall is enabled for workstations. |
| [Uninstall Todyl [Windows Servers]](/docs/ffa0e6db-0345-493f-a7aa-2566c551880e) | Windows Servers | Triggers [Todyl Uninstall [Windows]](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9) when uninstall is enabled for servers. |
| [Uninstall Todyl [Macintosh]](/docs/3f32039b-7e00-457e-9d14-f652fb33d1ef) | macOS | Triggers [Todyl Uninstall [Macintosh]](/docs/7bf87cc4-d3d6-465d-a159-f0b4dd4890a6) when uninstall is enabled for Mac devices. |

## Implementation

### Step 1: Create custom fields

Create these fields first:

- [Custom Field: cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3)
- [Custom Field: cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369)
- [Custom Field: cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0)
- [Custom Field: cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c)
- [Custom Field: cPVAL Todyl Mac Policy Key](/docs/44b1e55c-ff5e-42d4-b232-a52a9b5c4ae5)
- [Custom Field: cPVAL Todyl Tamper Protection](/docs/f37b4a17-ada4-4455-8723-ef994cb6a803)
- [Custom Field: cPVAL Todyl Maintenance Key](/docs/7dadd797-66b4-4f2e-b21a-6445b2841c1d)

### Step 2: Create automations

Create these automations:

- [Automation: Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629)
- [Automation: Todyl Deployment [Macintosh]](/docs/f9f61fb3-68f5-43f8-9aa8-88a4d091d42b)
- [Automation: Todyl Uninstall [Windows]](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9)
- [Automation: Todyl Uninstall [Macintosh]](/docs/7bf87cc4-d3d6-465d-a159-f0b4dd4890a6)

### Step 3: Create compound conditions

Create these compound conditions:

- [Compound Condition: Todyl Deployment [Windows Workstations]](/docs/737b576e-d7ac-48ec-ae04-14d7aa5f6d45)
- [Compound Condition: Todyl Deployment [Windows Servers]](/docs/10bbcdc1-b979-4d3b-9355-74587556ffee)
- [Compound Condition: Todyl Deployment [Macintosh]](/docs/c36416df-2a26-4528-ac3f-393de31a5b81)
- [Compound Condition: Uninstall Todyl [Windows Workstations]](/docs/4aa89b28-4f6b-46a5-8249-3273f4af7a6d)
- [Compound Condition: Uninstall Todyl [Windows Servers]](/docs/ffa0e6db-0345-493f-a7aa-2566c551880e)
- [Compound Condition: Uninstall Todyl [Macintosh]](/docs/3f32039b-7e00-457e-9d14-f652fb33d1ef)

### Step 4: Add policy keys

Populate policy-key fields before enabling deployment:

- Set [cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369) for Windows Desktop machines.
- Set [cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0) for Windows Laptop machines.
- Set [cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c) for Windows Servers.
- Set [cPVAL Todyl Mac Policy Key](/docs/44b1e55c-ff5e-42d4-b232-a52a9b5c4ae5) for Mac devices.

### Step 5: Enable the solution

Set [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) to the option you want (`All`, `Windows`, `Windows Servers`, `Windows Workstations`, `Mac`, `Windows Workstations and Mac`, or `Uninstall`).

You'll know it worked when the matching deployment or uninstallation automation runs for the target device type.

## FAQs

### **Q.** What does this solution do?

**A:** It manages Todyl SGN Connect lifecycle tasks in NinjaOne: install, update, and uninstall across supported Windows and Mac devices.

### **Q.** What turns the solution on?

**A:** [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) is the control field. The selected option decides which devices are targeted and which action runs.

### **Q.** Which value should I choose for broad deployment?

**A:** Use `All` to deploy to both Windows and Mac. Use `Windows` for all Windows devices only. Use `Mac` for Mac-only rollout.

### **Q.** Can I deploy only to servers or only to workstations?

**A:** Yes. Use `Windows Servers` to target only servers, or `Windows Workstations` to target only workstations.

### **Q.** How do I remove Todyl from devices?

**A:** Set [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) to `Uninstall`. Matching uninstall compound conditions will run automatically.

### **Q.** When do I need the maintenance key?

**A:** You need it when tamper protection is enabled. Set [cPVAL Todyl Tamper Protection](/docs/f37b4a17-ada4-4455-8723-ef994cb6a803), then store the key in [cPVAL Todyl Maintenance Key](/docs/7dadd797-66b4-4f2e-b21a-6445b2841c1d).

### **Q.** What if policy key fields are blank?

**A:** Deployment will fail for affected devices. Add the right keys before rollout:

- [cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369)
- [cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0)
- [cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c)
- [cPVAL Todyl Mac Policy Key](/docs/44b1e55c-ff5e-42d4-b232-a52a9b5c4ae5)

### **Q.** Where should I set values: Organization, Location, or Device?

**A:** Start at Organization for standard behavior. Use Location or Device to create exceptions.

### **Q.** How can I confirm the solution is working?

**A:** Check recent automation activity in NinjaOne. You should see the matching deployment or uninstall automation run for each targeted device type.

### **Q.** Does this support both Windows and Mac in one solution?

**A:** Yes. The same solution supports both platforms through separate automations and compound conditions.

### **Q.** Is this solution safe for security-focused environments?

**A:** Yes. It supports tamper-protected uninstall workflows using maintenance-key validation when required.

## Changelog

### 2026-06-22

- Added support for Mac machines: introduced [Todyl Deployment [Macintosh]](/docs/f9f61fb3-68f5-43f8-9aa8-88a4d091d42b) and [Todyl Uninstall [Macintosh]](/docs/7bf87cc4-d3d6-465d-a159-f0b4dd4890a6) automations.
- Added [cPVAL Todyl Mac Policy Key](/docs/44b1e55c-ff5e-42d4-b232-a52a9b5c4ae5) custom field to store the Todyl deployment key for Mac devices.
- Added [cPVAL Todyl Tamper Protection](/docs/f37b4a17-ada4-4455-8723-ef994cb6a803) and [cPVAL Todyl Maintenance Key](/docs/7dadd797-66b4-4f2e-b21a-6445b2841c1d) custom fields to support safe uninstallation when tamper protection is active on an endpoint.
- Updated [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) dropdown to include `Mac`, `All`, and `Windows Workstations and Mac` options.
- Improved Windows deployment and uninstallation reliability.
- Split compound conditions into dedicated rules by device type and action.
- Added [Compound Condition: Todyl Deployment [Macintosh]](/docs/c36416df-2a26-4528-ac3f-393de31a5b81) and [Compound Condition: Uninstall Todyl [Macintosh]](/docs/3f32039b-7e00-457e-9d14-f652fb33d1ef).

### 2026-05-20

- Initial version of the document.
