---
id: '14e999fb-5dc4-45b8-96e6-40d05fa2119e'
slug: /14e999fb-5dc4-45b8-96e6-40d05fa2119e
title: 'CSE SonicWall Deployment - NinjaOne'
title_meta: 'CSE SonicWall Deployment - NinjaOne'
keywords: ['sonicwall-cse', 'install-banyan-app', 'sonicwall-cloud-security-edge-app']
description: 'This solution is designed to configure the automatic deployment of the `AutoElevate` application on Windows machines that are missing the agent, using the NinjaOne platform.'
tags: ['application', 'installation', 'vpn', 'custom-field']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Purpose

Provide an automated solution to detect endpoints without **SonicWall Cloud Secure Edge** and deploy the client automatically across Windows, macOS, and Linux devices using CWA scripts, an internal monitor, and an alert template.

## Associated Content

### Compound Conditions

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [CSE SonicWall Deployment - Servers](/docs/0e96e9ab-436d-4d90-9bd5-59713edee157) | Compound Condition | Used to target supported Windows Server devices for automated CSE installation.|
| [CSE SonicWall Deployment - Workstations](/docs/ac43f3f2-821f-4103-91c7-783e33f4aa0f) | Compound Condition | Used to target supported Windows Workstation devices for automated CSE installation. |

### Automation

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [SonicWALL CSE App Deployment - Windows](/docs/7806076a-7298-40fa-a20a-e35f13143423) | Script | Installs the CSE SonicWall agent on Windows devices.                                      |

### Custom Field

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [cPVAL CSE Deployment](/docs/acd50145-b46f-4168-af13-b4512061d240)  | Custom Field | Controls deployment logic during automation and compound condition evaluation. |
| [cPVAL CSE Deployment Key](/docs/96e9cd4c-975b-44eb-85d1-b138e0de1d48)   | Custom Field | Stores the CSE Deployment key used during authorization and deployment. |
| [cPVAL CSE InviteCode](/docs/f596a2b4-a5c3-439b-a1b4-57d2c5ffd998)   | Custom Field | Stores the CSE Invite Code for the installation. |

## Implementation

### Step 1: Create the following Custom Field

- [cPVAL CSE Deployment](/docs/acd50145-b46f-4168-af13-b4512061d240)
- [cPVAL CSE Deployment Key](/docs/96e9cd4c-975b-44eb-85d1-b138e0de1d48)
- [cPVAL CSE InviteCode](/docs/f596a2b4-a5c3-439b-a1b4-57d2c5ffd998)

### Step 2: Import Automation Scripts

Import the following automation scripts:

- [SonicWALL CSE App Deployment - Windows](/docs/7806076a-7298-40fa-a20a-e35f13143423)

### Step 3: Configure the following Compound Conditions

Create three compound conditions targeting the appropriate device policies:

- [CSE SonicWall Deployment - Servers](/docs/0e96e9ab-436d-4d90-9bd5-59713edee157)
- [CSE SonicWall Deployment - Workstations](/docs/ac43f3f2-821f-4103-91c7-783e33f4aa0f)

## FAQ

**Q: What devices are supported by this solution?

A: This solution supports Windows Server and Windows Workstation devices that meet the requirements defined in the associated compound conditions.

**Q: What is the purpose of the cPVAL CSE Deployment custom field?

A: This custom field controls whether a device is eligible for automatic SonicWall CSE deployment and is evaluated by the compound conditions.

**Q: What information is required before deployment?

A: The following custom fields OR variables must be configured:

Custom Fields
  `- cPVAL CSE Deployment`
  `- cPVAL CSE Deployment Key`
  `- cPVAL CSE InviteCode`

Variables
  `-InviteCode`
  `-Deploymentkey`


**Q: How does the solution determine whether SonicWall CSE should be installed?

A: The compound conditions identify devices where the SonicWall CSE client is not installed and where deployment has been enabled through the custom field configuration.

**Q: Can different Deployment Keys and Invite Codes be used for different organizations or locations?

A: Yes. The custom fields can be configured at the Organization, Location, or Device level, allowing unique deployment settings for different environments.

**Q: Will the solution reinstall SonicWall CSE if it is already installed?

A: No. The deployment logic targets only devices where the SonicWall CSE client is not detected.

**Q: How can automatic deployment be disabled?

A: Automatic deployment can be disabled by updating the cPVAL CSE Deployment custom field or removing the device from the applicable deployment scope.

**Q: Can this be manually triggered for a single device?

A: Yes. The SonicWall CSE deployment script can be executed on-demand from the device's Automation menu within NinjaOne.

**Q: What happens if the installation fails?

A: Review the script execution output in NinjaOne and verify that the Deployment Key and Invite Code are configured correctly before rerunning the deployment.

**Q: Does the installation require a user to be logged in?

A: No. The deployment runs silently in the system context and does not require an active user session.

## Changelog

### 2026-06-08

- Initial version of the document