---
id: 'dec6391a-c159-4b45-8c3a-9df4d88dd1c5'
slug: /dec6391a-c159-4b45-8c3a-9df4d88dd1c5
title: 'Deploy CrowdStrike Windows Sensor'
title_meta: 'Deploy CrowdStrike Windows Sensor'
keywords: ['crowdstrike', 'crowdstrike-windows-sensor', 'deploy-crowdstrike', 'windows-sensor', 'exclusion']
description: 'The solution outlines the process of auto deploying CrowdStrike Windows Sensor from CW RMM.'
tags: ['application', 'installation', 'security', 'antivirus']
draft: false
unlisted: false
---

## Purpose

This solution outlines the full process for automatically deploying the CrowdStrike Windows Sensor using ConnectWise RMM, utilizing custom fields, a dynamic device group, a scheduled monitor, and an automated installation script.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [CrowdStrikeCustomerId](/docs/28f5fdfd-c11e-4643-ae07-62d6f7007805) | xyz | Text Box | COMPANY | Yes | Set CrowdStrike Customer ID for the company. |
| [CrordStrikeDownloadUrl](/docs/ae84e56d-df98-42da-b293-7412c01d7db7) | https://download.url | Text Box | COMPANY | Yes | Set download URL for downloading the installer for CrowdStrike Windows Sensor. |
| [DeployCrowdStrikeWindowsSensor](/docs/ffe13fcc-700f-41ea-9fdf-20ea4d253326) | Windows Workstation and Server | Dropdown | COMPANY | Yes | Select OS to enable auto-deployment of CrowdStrike Windows Sensor. |
| [ExcludeCrowdStrikeInstallSite](/docs/8d9498e0-4392-471e-93da-b546e0934b89) |  | Flag | SITE | No | Prevents sensor deployment at specific sites. |
| [ExcludeCrowdStrikeInstallDevice](/docs/cde64225-1c67-4483-9c39-580b315dd30a) |  | Flag | ENDPOINT | No | Prevents sensor deployment to specific endpoints or devices. |

### Group

| Name | Purpose |
|------|---------|
| [CrowdStrike Windows Sensor Deployment](/docs/406c6d18-a948-45f6-897b-b1d0174e21de) | Dynamic group targeting Windows devices that are eligible for auto deployment (based on OS selection and not excluded). |

### Monitor

| Name | Type | Schedule | Purpose |
|------|------|----------|---------|
| [CrowdStrike Windows Sensor Deployment](/docs/ce1b87d4-a1d4-4f37-a03d-3b08c4565086) | Application | Continuous | Monitors and runs the sensor installation script on devices missing the CrowdStrike Windows Sensor. |

### Task

| Name | Purpose |
|------|---------|
| [Install CrowdStrike Windows Sensor](/docs/7eb5860d-08e2-41cb-b22b-48505618f1ae) | PowerShell script that installs or reinstalls the CrowdStrike Windows Sensor on targeted devices. |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM. See individual documentation pages for configuration details.

- [CrowdStrikeCustomerId](/docs/28f5fdfd-c11e-4643-ae07-62d6f7007805)
- [CrordStrikeDownloadUrl](/docs/ae84e56d-df98-42da-b293-7412c01d7db7)
- [DeployCrowdStrikeWindowsSensor](/docs/ffe13fcc-700f-41ea-9fdf-20ea4d253326)
- [ExcludeCrowdStrikeInstallSite](/docs/8d9498e0-4392-471e-93da-b546e0934b89)
- [ExcludeCrowdStrikeInstallDevice](/docs/cde64225-1c67-4483-9c39-580b315dd30a)

### Step 2: Create the Dynamic Group

Create the group [CrowdStrike Windows Sensor Deployment](/docs/406c6d18-a948-45f6-897b-b1d0174e21de) under `ENDPOINTS → Groups` as a dynamic group. This group targets Windows workstations or servers with deployment enabled and not excluded.

### Step 3: Create the Installation Task

Create the install script task [Install CrowdStrike Windows Sensor](/docs/7eb5860d-08e2-41cb-b22b-48505618f1ae) under `AUTOMATION → Tasks`. Set up all required variables and use the detailed script from the referenced documentation.

### Step 4: Set up the Deployment Monitor

Configure the monitor [CrowdStrike Windows Sensor Deployment](/docs/ce1b87d4-a1d4-4f37-a03d-3b08c4565086) under `ENDPOINTS → Alerts → Monitors` to target the deployment enabled group, running continuously and triggering the installation task on devices missing the CrowdStrike sensor.

### Step 5: Configure Deployment Parameters

Obtain the CrowdStrike Customer ID and Download URL from your CrowdStrike portal and set these values in the appropriate company-level custom fields for each client.

## FAQ

**Q: What happens if a device is excluded at the site or device level?**  
A: Devices or sites flagged for exclusion will not receive the sensor through automatic deployment. However, the [Install CrowdStrike Windows Sensor](/docs/7eb5860d-08e2-41cb-b22b-48505618f1ae) task can be executed manually.

**Q: How does the solution check devices for sensor installation?**  
A: The monitor runs continuously and checks for devices in the target group that don't have the CrowdStrike Windows Sensor installed.

**Q: Can I trigger the sensor install manually?**  
A: Yes, the [Install CrowdStrike Windows Sensor](/docs/7eb5860d-08e2-41cb-b22b-48505618f1ae) task can be run on demand independent of monitor or group status.

**Q: Where do I find the Customer ID and Download URL for CrowdStrike?**  
A: These values are available in your CrowdStrike Falcon portal under the sensor deployment section.

**Q: What OSes are supported for automated deployment?**  
A: Supported OS selection is controlled by the `DeployCrowdStrikeWindowsSensor` custom field (Windows Workstation, Windows Server, Both, or Disabled).

**Q: Does the installer support forced reinstallation?**  
A: Yes, enable the "Force" runtime parameter when running the install task/script to force a reinstall even if the sensor is present.
