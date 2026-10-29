---
id: '1c257867-5a6f-4887-a383-7c5af4cf1c98'
slug: /1c257867-5a6f-4887-a383-7c5af4cf1c98
title: 'DNSFilter Deployment'
title_meta: 'DNSFilter Deployment'
keywords: ['dns', 'filter', 'dnsfilter', 'agent', 'deployment', 'certificate']
description: 'Deploys the DNSFilter Agent, with optional installation of the DNSFilter root certificate, to Windows and Macintosh machines in NinjaOne based on custom field selection.'
tags: ['dns', 'installation', 'software', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Purpose

This solution automates the deployment of the DNSFilter Agent to supported machines in NinjaOne and registers each device with the appropriate DNSFilter organization using the DNSFilter Network Key.

The solution supports the following platforms:

* Windows Workstations
* Windows Servers
* Macintosh

Administrators can centrally select the target operating systems for deployment using the [Custom Field - cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da) custom field and provide the DNSFilter Network Key using the [Custom Field - cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) custom field. The compound conditions then trigger the appropriate installation automation on machines where deployment is enabled.

### Key Capabilities

1. **Automated DNSFilter Agent Deployment**  
   Automatically deploys the DNSFilter Agent on Windows Workstations, Windows Servers, and Macintosh machines where deployment is enabled.

2. **Multi-Platform Support**  
   Uses dedicated automations for Windows and Macintosh, with separate compound conditions for Windows Workstations, Windows Servers, and Macintosh so each platform can be targeted independently.

3. **Centralized Deployment Configuration**  
   Uses NinjaOne custom fields to centrally manage DNSFilter configuration settings, including:
   - Target Operating Systems
   - DNSFilter Network Key

4. **Flexible Operating System Targeting**  
   Allows administrators to deploy the agent to Windows Workstations, Windows Servers, Macintosh machines, or any supported combination through a single drop-down selection.

5. **Organization-Specific Registration**  
   Registers each device with the correct DNSFilter organization using the DNSFilter Network Key, allowing different clients or sites to use their own keys.

6. **Optional Root Certificate Installation**  
   Optionally imports the DNSFilter root certificate into the Enterprise Trusted Root Certification Authorities on Windows machines during agent installation.

7. **Granular Scope Control**  
   Custom fields can be configured at the Organization, Location, or Device level, allowing deployment to be enabled broadly and disabled for specific locations or devices.

8. **Policy-Based Automatic Execution**  
   Compound conditions applied to the Windows Workstations, Windows Servers, and MAC agent policies automatically trigger the appropriate installation automation without manual intervention.

## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da)  | Custom Field to select the target operating system for DNSFilter Agent deployment. |
| [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) | Custom Field to enter the DNSFilter Network Key required to register the device with the appropriate DNSFilter organization. |

### Automations

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3)  | Automates the installation of the DNSFilter Agent on Windows machines, with optional installation of the DNSFilter root certificate. |
| [Install DNSFilter Agent - MAC](/docs/70aeb191-3689-4199-a612-41753e7ccfd5)  | Automates the installation of the DNSFilter Agent on Mac machines. |

### Compound Conditions

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [DNSFilter Agent Deployment - Workstations](/docs/9a2990eb-1abf-479e-8dc5-4724ded26eb2) | Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows workstations where deployment is enabled. |
| [DNSFilter Agent Deployment - Servers](/docs/580e01e0-5216-4421-b1c0-c0b27a1819e4) | Triggers the [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation on Windows Servers where deployment is enabled. |
| [DNSFilter Agent Deployment - Macintosh](/docs/450076a6-8004-4edf-bb17-17db0261a64c) | Triggers the [Automation - Install DNSFilter Agent - MAC](/docs/70aeb191-3689-4199-a612-41753e7ccfd5) automation on Mac machines where deployment is enabled. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These fields are required for the solution to function correctly.

* [cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da)
* [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a)

### Step 2: Configure the DNSFilter Key

Set the [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) custom field to the DNSFilter Network Key of the client's DNSFilter organization.

The field can be set at the Organization, Location, or Device level. The installation automations use this key to register the device with the correct DNSFilter organization.

### Step 3: Configure the DNSFilter Deployment

Set the [cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da) custom field to the operating systems where the DNSFilter Agent should be deployed.

The field can be set at the Organization, Location, or Device level. The available options are:

* **Disable** - The DNSFilter Agent is not deployed.
* **Windows** - Deploys the agent to Windows Workstations and Windows Servers.
* **Windows Workstations** - Deploys the agent to Windows Workstations only.
* **Windows Servers** - Deploys the agent to Windows Servers only.
* **Macintosh** - Deploys the agent to Mac machines only.
* **Windows and Macintosh** - Deploys the agent to Windows Workstations, Windows Servers, and Mac machines.
* **Windows Workstations and Macintosh** - Deploys the agent to Windows Workstations and Mac machines.

Machines where the field is not configured or set to `Disable` are not targeted by the compound conditions.

### Step 4: Create the Automation

Set up the following automations:

* [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3)
* [Automation - Install DNSFilter Agent - MAC](/docs/70aeb191-3689-4199-a612-41753e7ccfd5)

For the Windows automation, select the `Install DNSFilter Root Certificate` parameter if the DNSFilter root certificate should be imported into the Enterprise Trusted Root Certification Authorities.

### Step 5: Create the Compound Conditions

Create the following compound conditions and apply them to the recommended agent policies:

| Compound Condition | Recommended Agent Policy |
| ------------------ | ------------------------ |
| [DNSFilter Agent Deployment - Workstations](/docs/9a2990eb-1abf-479e-8dc5-4724ded26eb2) | Windows Workstations |
| [DNSFilter Agent Deployment - Servers](/docs/580e01e0-5216-4421-b1c0-c0b27a1819e4) | Windows Servers |
| [DNSFilter Agent Deployment - Macintosh](/docs/450076a6-8004-4edf-bb17-17db0261a64c) | MAC Policy |

## FAQ

### Q: Which platforms are supported?

> The solution supports Windows Workstations, Windows Servers, and Macintosh machines.

### Q: Where do I find the DNSFilter Network Key?

> The DNSFilter Network Key is available in the DNSFilter dashboard for the client's organization. Enter it in the [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) custom field.

### Q: Can different clients use different DNSFilter Network Keys?

> Yes. The [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) custom field can be set at the Organization, Location, or Device level, so each client or site can register with its own DNSFilter organization.

### Q: Is the DNSFilter root certificate installed automatically?

> The root certificate is installed only on Windows machines and only when the `Install DNSFilter Root Certificate` parameter is selected in the [Automation - Install DNSFilter Agent And Certificate - Windows](/docs/4330fd5c-9c54-4fa0-9083-130ca1630ff3) automation.

### Q: How do I deploy the agent to workstations but not servers?

> Set the [cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da) custom field to `Windows Workstations`, or to `Windows Workstations and Macintosh` to include Mac machines.

### Q: How do I exclude a specific location or device from deployment?

> Set the [cPVAL DNSFilter Deployment](/docs/1030e639-e615-4618-ae49-9db20ee907da) custom field to `Disable` at the Location or Device level.

### Q: What happens if the DNSFilter Key is not configured?

> The DNSFilter Network Key is required to register the device. Ensure the [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a) custom field is set before enabling deployment; otherwise the installation cannot complete.

### Q: Where can I see the result of the installation?

> The installation result is available in the Activity Details of the machine where the automation was executed.

## Changelog

### 2026-10-29

* Initial version of the document.
