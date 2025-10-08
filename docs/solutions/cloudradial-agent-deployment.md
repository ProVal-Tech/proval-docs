---
id: '9e861bf3-2a05-46ef-9f7f-a46f33b675c5'
slug: /9e861bf3-2a05-46ef-9f7f-a46f33b675c5
title: 'CloudRadial Agent Deployment'
title_meta: 'CloudRadial Agent Deployment'
keywords: ['cloudradial', 'cloud-radial', 'cloudradial-agent']
description: 'The solution outlines the process of auto deploying CloudRadial agent from CW RMM.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Purpose

This solution outlines the full process for automatically deploying the CloudRadial agent using ConnectWise RMM, utilizing custom fields, a dynamic device group, a scheduled monitor, and automated installation scripts for both Windows and Mac computers.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [CloudRadial Installation](/docs/e1ac886a-807a-4c85-9f6a-a1cecbc15910) | Windows Workstation and Macintosh | Dropdown | COMPANY | Yes | Select operating systems to enable CloudRadial Agent deployment for. |
| [CloudRadial Exclusion Location](/docs/d05ec922-2013-4947-a7aa-9b8a557b2253) |  | Flag | SITE | No | Prevents agent deployment at specific locations. |
| [CloudRadial Exclusion Device](/docs/56e9c36a-12da-4b67-92af-2b8cb6a63dbb) |  | Flag | ENDPOINT | No | Prevents agent deployment to specific endpoints or devices. |
| [CloudRadial Windows DownloadUrl](/docs/a254a58c-314c-4fed-964d-d5a64a7a2e61) | https://example.com/installer.exe | Text Box | COMPANY | Yes (for Windows) | The URL from which to download the CloudRadial Agent installer for Windows machines. |
| [CloudRadial Mac SERVICE_ENDPOINT](/docs/65ed6aaa-5ab5-4a82-8f15-ef27a609ce68) | https://service.example.com | Text Box | COMPANY | Yes (for Mac) | Service endpoint URL where the CloudRadial application is hosted. |
| [CloudRadial Mac PARTNER_URL](/docs/227670ae-62cc-48cb-918a-febbf75711d3) | https://partner.example.com | Text Box | COMPANY | Yes (for Mac) | Partner URL where partner information is hosted. |
| [CloudRadial Mac COMPANY_ID](/docs/3e4d904f-841c-4888-8b16-b54c4d7cf65c) | ABC123 | Text Box | COMPANY | Yes (for Mac) | Company ID used to identify the specific company within the application. |

### Group

| Name | Purpose |
|------|---------|
| [CloudRadial Agent Deployment Enabled](/docs/20f0900a-a34c-46c3-9181-ba89b17c14cb) | Dynamic group targeting devices that are eligible for auto deployment based on OS, installation settings, and exclusion status. |

### Monitor

| Name | Type | Schedule | Purpose |
|------|------|----------|---------|
| [CloudRadial Agent Deployment](/docs/9d94a40f-f4ed-4e6c-8616-6a881f5dd9e4) | Complex | Every 60 minutes | Monitors and runs the agent installation task on devices missing the CloudRadial agent. |

### Task

| Name | Purpose |
|------|---------|
| [Install CloudRadial Agent [Windows, Mac]](/docs/76612d42-c62d-4d43-b7fd-227e350b420c) | PowerShell and Bash scripts that install the CloudRadial agent on Windows and Mac devices respectively. |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM. See individual documentation pages for configuration details.

- [CloudRadial Installation](/docs/e1ac886a-807a-4c85-9f6a-a1cecbc15910)
- [CloudRadial Exclusion Location](/docs/d05ec922-2013-4947-a7aa-9b8a557b2253)
- [CloudRadial Exclusion Device](/docs/56e9c36a-12da-4b67-92af-2b8cb6a63dbb)
- [CloudRadial Windows DownloadUrl](/docs/a254a58c-314c-4fed-964d-d5a64a7a2e61)
- [CloudRadial Mac SERVICE_ENDPOINT](/docs/65ed6aaa-5ab5-4a82-8f15-ef27a609ce68)
- [CloudRadial Mac PARTNER_URL](/docs/227670ae-62cc-48cb-918a-febbf75711d3)
- [CloudRadial Mac COMPANY_ID](/docs/3e4d904f-841c-4888-8b16-b54c4d7cf65c)

### Step 2: Create the Dynamic Group

Create the group [CloudRadial Agent Deployment Enabled](/docs/20f0900a-a34c-46c3-9181-ba89b17c14cb) under `ENDPOINTS → Groups` as a dynamic group. This group targets Windows workstations, Windows servers, and Mac devices based on the installation settings and exclusion status.

### Step 3: Create the Installation Task

Create the install script task [Install CloudRadial Agent [Windows, Mac]](/docs/76612d42-c62d-4d43-b7fd-227e350b420c) under `AUTOMATION → Tasks`. Set up all required variables and use the detailed scripts from the referenced documentation.

### Step 4: Set up the Deployment Monitor

Configure the monitor [CloudRadial Agent Deployment](/docs/9d94a40f-f4ed-4e6c-8616-6a881f5dd9e4) under `ENDPOINTS → Alerts → Monitors` to target the deployment enabled group, running every 60 minutes and triggering the installation task on devices missing the CloudRadial agent.

### Step 5: Configure Required Values

Set the Windows DownloadUrl and Mac configuration values (SERVICE_ENDPOINT, PARTNER_URL, COMPANY_ID) in the appropriate custom fields for each client according to your CloudRadial configuration.

## FAQ

**Q: What happens if an endpoint is excluded at the site or device level?**  
A: Devices or sites flagged for exclusion will not receive the agent, regardless of task or group membership. However, the [Install CloudRadial Agent [Windows, Mac]](/docs/76612d42-c62d-4d43-b7fd-227e350b420c) task can be executed manually.

**Q: How often does the solution check devices for agent installation?**  
A: The monitor runs every 60 minutes, but this can be changed in the monitor's configuration.

**Q: Can I trigger the agent install manually?**  
A: Yes, the [Install CloudRadial Agent [Windows, Mac]](/docs/76612d42-c62d-4d43-b7fd-227e350b420c) task can be run on demand independent of monitor or group status.

**Q: Where do I find the Windows DownloadUrl and Mac configuration values?**  
A: These values are provided by CloudRadial and should be obtained from your CloudRadial account or support representative.

**Q: What OSes are supported for automated deployment?**  
A: Supported OS selection is controlled by the `CloudRadial Installation` custom field (Windows Workstation, Windows Server, Macintosh, or combinations).

**Q: Does the installer support verification of successful installation?**  
A: Yes, both the Windows and Mac logics verify the installation was successful before completing.
