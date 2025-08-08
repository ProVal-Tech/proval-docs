---
id: 'd0a57d05-71c0-495e-a055-803ad7a728ad'
slug: /d0a57d05-71c0-495e-a055-803ad7a728ad
title: 'ImmyBot Agent Deployment'
title_meta: 'ImmyBot Agent Deployment'
keywords: ['immybot', 'immybot-agent', 'deploy-immybot-agent', 'install-immybot-agent', 'reinstall-immybot-agent']
description: 'The solution outlines the process of auto deploying ImmyBot agent from CW RMM.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Purpose

This solution outlines the full process for automatically deploying the ImmyBot agent using ConnectWise RMM, utilizing custom fields, a dynamic device group, a scheduled monitor, and an automated installation script.

## Associated Content

### Custom Fields

| Name                            | Example                    | Type     | Level    | Required | Purpose                                                                                             |
|----------------------------------|----------------------------|----------|----------|----------|-----------------------------------------------------------------------------------------------------|
| [ImmyBot Tenant](/docs/2556d27a-3c3c-4437-aa2c-43143b97ff88)        | xyz                        | Text     | COMPANY  | Yes      | Subdomain part of your ImmyBot URL used for agent installation configuration.                       |
| [ImmyBot Installer ID](/docs/9f10ae6a-e898-4bc6-95cb-946c77abdf2e)  | GUID                       | Text     | COMPANY  | Yes      | Unique installer ID (GUID) for the ImmyBot agent MSI installation.                                  |
| [ImmyBot Installer Key](/docs/9449d91e-3a45-4fa2-b0b4-099dc349bb50) | String                     | Text     | COMPANY  | Yes      | Installer key string required to activate and authorize agent installation.                         |
| [Deploy ImmyBot](/docs/415511bb-26c0-4c9f-ac34-d395f29b223e)        | Workstations and Servers   | Dropdown | COMPANY  | Yes      | Select operating systems to enable auto deployment for the agent.                                   |
| [ImmyBot Exclusion (Site)](/docs/5e44ed99-db67-41d3-b718-532395f2ac11) |                           | Flag     | SITE     | No       | Prevents agent deployment at specific sites.                                                        |
| [ImmyBot Exclusion (Endpoint)](/docs/77b89b50-c343-48a4-b8a0-9e80ceab78ed) |                        | Flag     | ENDPOINT | No       | Prevents agent deployment to specific endpoints or devices.                                         |

### Group

| Name                                                                                  | Purpose                                                                               |
|---------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| [ImmyBot Agent Deployment Enabled](/docs/e69486d9-27f7-4fa6-87cd-d62151d6ddc4)        | Dynamic group targeting devices that are eligible for auto deployment (based on OS and not excluded). |

### Monitor

| Name                                               | Type    | Schedule      | Purpose                                                                         |
|----------------------------------------------------|---------|---------------|---------------------------------------------------------------------------------|
| [ImmyBot Agent Deployment](/docs/864e8d09-999f-4af5-87cc-1e0ad0222c62) | Script  | Every 24 hours | Monitors and runs the agent installation script on devices missing the ImmyBot agent. |

### Task

| Name                              | Purpose                                                                                     |
|----------------------------------- |-------------------------------------------------------------------------------------------|
| [Install ImmyBot Agent](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1) | PowerShell script that installs or reinstalls the ImmyBot agent on selected devices.      |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM. See individual documentation pages for configuration details.

- [ImmyBot Tenant](/docs/2556d27a-3c3c-4437-aa2c-43143b97ff88)
- [ImmyBot Installer ID](/docs/9f10ae6a-e898-4bc6-95cb-946c77abdf2e)
- [ImmyBot Installer Key](/docs/9449d91e-3a45-4fa2-b0b4-099dc349bb50)
- [Deploy ImmyBot](/docs/415511bb-26c0-4c9f-ac34-d395f29b223e)
- [ImmyBot Exclusion (Site)](/docs/5e44ed99-db67-41d3-b718-532395f2ac11)
- [ImmyBot Exclusion (Endpoint)](/docs/77b89b50-c343-48a4-b8a0-9e80ceab78ed)

### Step 2: Create the Dynamic Group

Create the group [ImmyBot Agent Deployment Enabled](/docs/e69486d9-27f7-4fa6-87cd-d62151d6ddc4) under `ENDPOINTS → Groups` as a dynamic group. This group should match workstations or servers with deployment enabled and not excluded.

### Step 3: Create the Installation Task

Create the install script task [Install ImmyBot Agent](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1) under `AUTOMATION → Tasks`. Set up all required variables and use the detailed script from the referenced documentation.

### Step 4: Set up the Deployment Monitor

Configure the monitor [ImmyBot Agent Deployment](/docs/864e8d09-999f-4af5-87cc-1e0ad0222c62) under `ENDPOINTS → Alerts → Monitors` to target the deployment enabled group, running every 24 hours and triggering the installation task on missing/broken agents.

### Step 5: Fetch and Apply Required Values

Follow the guide in the [Install ImmyBot Agent](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1) documentation to fetch the Tenant, Installer ID, and Installer Key from your ImmyBot portal and set these in the appropriate custom fields for each client.

## FAQ

**Q: What happens if an endpoint is excluded at the site or endpoint level?**  
A: Devices or sites flagged for exclusion will not receive the agent, regardless of task or group membership. However, the [Install ImmyBot Agent](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1) task can be executed manually.

**Q: How often does the solution check devices for agent installation?**  
A: The monitor runs every 24 hours, but this can be changed in the monitor’s configuration.

**Q: Can I trigger the agent install manually?**  
A: Yes, the [Install ImmyBot Agent](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1) task can be run on demand independent of monitor or group status.

**Q: Where do I find the installer ID and key for my ImmyBot tenant?**  
A: Generate these in your ImmyBot portal by going through the agent installer workflow; see details in the install script [documentation](/docs/c2576ff2-e86f-43f7-94dc-462a7afbc7f1).

**Q: What OSes are supported for automated deployment?**  
A: Supported OS selection is controlled by the `Deploy ImmyBot` custom field (Workstations, Servers, Both, or None).

**Q: Does the installer support forced reinstallation?**  
A: Yes, enable the "ReinstallAgent" runtime parameter when running the install task/script to force a reinstall even if the agent is present.
