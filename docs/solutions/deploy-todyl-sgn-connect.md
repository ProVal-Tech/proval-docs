---
id: '41308550-ea69-4cca-aa0d-9e6f02fcab43'
slug: /41308550-ea69-4cca-aa0d-9e6f02fcab43
title: 'Deploy Todyl SGN Connect'
title_meta: 'Deploy Todyl SGN Connect'
keywords: ['todyl', 'todyl-sgn-connect', 'deploy-todyl', 'sgn-connect']
description: 'The solution outlines the process of auto deploying Todyl SGN Connect agent from CW RMM.'
tags: ['application', 'installation', 'security']
draft: false
unlisted: false
---

## Purpose

This solution outlines the full process for automatically deploying the Todyl SGN Connect agent using ConnectWise RMM, utilizing custom fields, a dynamic device group, a scheduled monitor, and an automated installation script with device-specific deployment keys.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [Deploy Todyl SGN Connect](/docs/e21d58b1-9fd5-4888-9e1f-788420313237) | Windows Workstation and Server | Dropdown | COMPANY | Yes | Select OS to enable auto-deployment of Todyl SGN Connect agent. |
| [Exclude Todyl Deployment Site](/docs/b4d717f5-38fe-4eac-83d4-d1cb88e7fe9d) |  | Flag | SITE | No | Prevents agent deployment at specific sites. |
| [Exclude Todyl Deployment Device](/docs/ee6d7b42-0783-422a-a820-8ef36aab0713) |  | Flag | ENDPOINT | No | Prevents agent deployment to specific endpoints or devices. |
| [Todyl Desktop Policy Key](/docs/8656e3f6-5cfc-49b9-a700-cbf453744576) |  | Text Box | COMPANY | Yes | Todyl Deployment Key for Desktop Agents. |
| [Todyl Laptop Policy Key](/docs/894b9f2c-e0ac-4351-a312-f7f55865e32a) |  | Text Box | COMPANY | Yes | Todyl Deployment Key for Laptop Agents. |
| [Todyl Servers Policy Key](/docs/e7b46cfc-c872-4d3c-b317-2b59a6c9679d) |  | Text Box | COMPANY | Yes | Todyl Deployment Key for Server Agents. |

### Group

| Name | Purpose |
|------|---------|
| [Todyl SGN Connect Deployment](/docs/34482e9f-122f-490d-b3c8-1e1d466bbc77) | Dynamic group targeting Windows devices that are eligible for auto deployment (based on OS selection and not excluded). |

### Monitor

| Name | Type | Schedule | Purpose |
|------|------|----------|---------|
| [Todyl SGN Connect Deployment](/docs/373305fd-1b01-488e-9105-ada540040fc0) | Application | Continuous | Monitors and runs the agent installation script on devices missing Todyl SGN Connect. |

### Task

| Name | Purpose |
|------|---------|
| [Install Todyl SGN Connect](/docs/c23cdc78-f90e-4aba-b77e-4dff9d612940) | PowerShell script that installs or reinstalls Todyl SGN Connect with device-specific deployment keys. |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM. See individual documentation pages for configuration details.

- [Deploy Todyl SGN Connect](/docs/e21d58b1-9fd5-4888-9e1f-788420313237)
- [Exclude Todyl Deployment Site](/docs/b4d717f5-38fe-4eac-83d4-d1cb88e7fe9d)
- [Exclude Todyl Deployment Device](/docs/ee6d7b42-0783-422a-a820-8ef36aab0713)
- [Todyl Desktop Policy Key](/docs/8656e3f6-5cfc-49b9-a700-cbf453744576)
- [Todyl Laptop Policy Key](/docs/894b9f2c-e0ac-4351-a312-f7f55865e32a)
- [Todyl Servers Policy Key](/docs/e7b46cfc-c872-4d3c-b317-2b59a6c9679d)

### Step 2: Create the Dynamic Group

Create the group [Todyl SGN Connect Deployment](/docs/34482e9f-122f-490d-b3c8-1e1d466bbc77) under `ENDPOINTS → Groups` as a dynamic group. This group targets Windows workstations or servers with deployment enabled and not excluded.

### Step 3: Create the Installation Task

Create the install script task [Install Todyl SGN Connect](/docs/c23cdc78-f90e-4aba-b77e-4dff9d612940) under `AUTOMATION → Tasks`. Set up all required variables and use the detailed script from the referenced documentation.

### Step 4: Set up the Deployment Monitor

Configure the monitor [Todyl SGN Connect Deployment](/docs/373305fd-1b01-488e-9105-ada540040fc0) under `ENDPOINTS → Alerts → Monitors` to target the deployment enabled group, running continuously and triggering the installation task on devices missing Todyl SGN Connect.

### Step 5: Configure Deployment Parameters

Obtain the Desktop, Laptop, and Server deployment keys from your Todyl portal and set these values in the appropriate company-level custom fields for each client.

## FAQ

**Q: What happens if a device is excluded at the site or device level?**  
A: Devices or sites flagged for exclusion will not receive the agent through automatic deployment. However, the [Install Todyl SGN Connect](/docs/c23cdc78-f90e-4aba-b77e-4dff9d612940) task can be executed manually.

**Q: How does the solution check devices for agent installation?**  
A: The monitor runs continuously and checks for devices in the target group that don't have Todyl SGN Connect installed.

**Q: Can I trigger the agent install manually?**  
A: Yes, the [Install Todyl SGN Connect](/docs/c23cdc78-f90e-4aba-b77e-4dff9d612940) task can be run on demand independent of monitor or group status.

**Q: Where do I find the deployment keys for different device types?**  
A: These values are available in your Todyl portal under the agent deployment section, with separate keys for desktops, laptops, and servers.

**Q: What OSes are supported for automated deployment?**  
A: Supported OS selection is controlled by the `Deploy Todyl SGN Connect` custom field (Windows Workstation, Windows Server, Both, or Disabled).

**Q: Does the installer support forced reinstallation?**  
A: Yes, enable the "Force" runtime parameter when running the install task/script to force a reinstall even if the agent is present.

**Q: How does the script determine device type?**  
A: The script automatically detects whether a device is a server, laptop, or desktop and uses the appropriate deployment key for installation.