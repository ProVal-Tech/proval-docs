---
id: '7fe6a52b-79fd-487b-8009-523996e74d11'
slug: /7fe6a52b-79fd-487b-8009-523996e74d11
title: 'Windows 10 ESU Licensing and Auditing'
title_meta: 'Windows 10 ESU Licensing and Auditing'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'This solution provides automated auditing of Windows 10 Extended Security Updates (ESU) license status across Windows 10 22H2 machines from ConnectWise Automate platform. It includes functionality to track activation status and optionally deploy ESU licenses when needed.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Purpose

This solution provides automated auditing of Windows 10 Extended Security Updates (ESU) license status across Windows 10 22H2 machines from ConnectWise Automate platform. It includes functionality to track activation status and optionally deploy ESU licenses when needed.

**References:**

- [Enable Extended Security Updates](https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates)
- [Deploy Windows 10 Security Updates with Intune or SCCM](https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/)

## Associated Content

### Audit Content

| Content                                             | Type               | Purpose |
|-----------------------------------------------------|--------------------|--------------------|
| [ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)      | Script             | Performs ESU activation checks on a device, collects status details and writes results to an EDF for reporting. |
| [ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc)      | Dataview           | Presents the collected ESU audit results for reporting and remediation planning. |
| [Windows 10 22H2 ESU License Status](/docs/75abc7b8-1ff2-42d4-8028-dd0a3adaf899) | Internal Monitor   | Identifies 22H2 endpoints that have not been audited in the last 7 days. |
| △ Custom - Execute Script - ESU License Activation Detection | Alert Template     | Automatically runs the audit script against devices detected by the internal monitor. |

### Additional Content

| Content                                             | Type               | Purpose |
|-----------------------------------------------------|--------------------|--------------------|
| [Windows 10 ESU License Upgrade](/docs/765670f5-5120-4066-89d8-2cda873e8212)    | Script  | On‑demand installer/activator that applies an ESU product key to a target machine using supplied runtime parameters. Designed for manual execution or scheduled use if desired. |

## Implementation

### Step 1

Import the following content from ProSync plugin:

- [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)
- [Script - Windows 10 ESU License Upgrade](/docs/765670f5-5120-4066-89d8-2cda873e8212)
- [Dataview - ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc)
- [Internal Monitor - Windows 10 22H2 ESU License Status](/docs/75abc7b8-1ff2-42d4-8028-dd0a3adaf899)
- Alert Template - △ Custom - Execute Script - ESU License Activation Detection

### Step 2

Reload System Cache (Ctrl + R)

### Step 3

Configure the auditing solution as follow:

- Internal Monitor: [Windows 10 22H2 ESU License Status](/docs/75abc7b8-1ff2-42d4-8028-dd0a3adaf899)
  - Alert Template: `△ Custom - Execute Script - ESU License Activation Detection`

### Step 4

- Use [ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc) dataview for an at‑a‑glance inventory and filtering of devices by ESU state.
- Run [Windows 10 ESU License Upgrade](/docs/765670f5-5120-4066-89d8-2cda873e8212) manually on devices that require key installation, or create a scheduled job targeting non‑compliant hosts.

## FAQ

Q: What does this solution detect?  
A: It determines whether Windows 10 22H2 devices have ESU activated, captures activation metadata, and flags devices that have not been audited recently.

Q: How frequently are devices checked?  
A: The internal monitor flags devices that haven't been audited in the last 7 days; the alert template runs the audit script against those devices automatically. You can adjust monitor frequency to fit your cadence.

Q: Can ESU keys be applied automatically?  
A: The included [Windows 10 ESU License Upgrade](/docs/765670f5-5120-4066-89d8-2cda873e8212) script can be run on demand. For automated deployments, create a scheduled job or alert action that executes the script with the required runtime parameters against selected targets.

Q: Where do I view results and plan remediation?  
A: Use the [ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc) dataview to filter by ESU state, last audited date, and other attributes to build remediation lists.

Q: What happens if the activation script fails on a device?  
A: The audit output will capture the failure details. Use the dataview to identify failed attempts, review the script output in the device's script history, correct any precondition issues (connectivity, privileges, key validity) and retry.

Q: Is this solution limited to ConnectWise Automate?  
A: This package and the implementation instructions are tailored for ConnectWise Automate (ProSync import). The concepts (audit script, reporting, and an activation script) can be adapted to other platforms but require platform‑specific packaging and triggers.
