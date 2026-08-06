---
id: '4a95cdd5-dec1-4d8e-aa3a-0ee4dd7c0273'
slug: /4a95cdd5-dec1-4d8e-aa3a-0ee4dd7c0273
title: 'AutoElevate Deployment'
title_meta: 'AutoElevate Deployment'
keywords: ['agent','windows','security']
description: 'Automates the deployment of the AutoElevate Agent on supported endpoints through ConnectWise RMM platform.'
tags:  ['security','application','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Purpose

The AutoElevate Deployment solution is designed to automate the deployment of the AutoElevate Agent on supported endpoints through ConnectWise RMM platform. It identifies machines that are configured for AutoElevate deployment but currently do not have the AutoElevate Agent installed and automatically deploys the agent based on the configured deployment settings.

The solution uses centralized configuration through ConnectWise RMM custom fields to control AutoElevate deployment behavior, including license registration, company identification, elevation mode, blocker mode, and deployment exclusions at the site and endpoint level.

### Key Capabilities

1. **Automated AutoElevate Agent Deployment**  
   Automatically deploys the AutoElevate Agent on endpoints where deployment is enabled and the agent is not detected.

2. **Centralized Deployment Configuration**  
   Uses ConnectWise RMM custom fields to centrally manage AutoElevate configuration settings, including:
   - License Key
   - Company Initials
   - Elevation Mode
   - Blocker Mode
   - Deployment Enablement

3. **Site and Endpoint-Level Exclusions**  
   Provides the ability to exclude specific sites or individual endpoints from AutoElevate deployment without changing the global deployment configuration.

4. **Automatic Installer Download**  
   Downloads the latest AutoElevate installer during execution to ensure the most recent available agent version is deployed.

5. **Silent Installation and Upgrade Support**  
   Installs or upgrades the AutoElevate Agent silently without requiring user interaction.

6. **Installation Validation**  
   Verifies successful installation by confirming that the AutoElevate Agent service is installed and available after deployment.

7. **Multi-Platform Deployment Support**  
   Supports AutoElevate Agent deployment across supported workstation, server, and Macintosh devices.

### Important Caveats & Behavior

1. **Agent Uninstallation**

   Since AutoElevate agents are updated on a continual basis, script-based uninstallation is not recommended if the agent has already been installed and is reporting in the AutoElevate Admin Portal.

   If an uninstall is required, AutoElevate recommends removing the computer from the AutoElevate Admin Portal (https://msp.autoelevate.com/). Deleting the computer entry from the portal will remove the device and initiate the AutoElevate Agent uninstall process.

2. **Configuration Updates**

   Changes made to the AutoElevate deployment custom fields are applied when the **Install AutoElevate Agent** task runs again against the targeted endpoint.

3. **License Key Requirement**

   A valid AutoElevate License Key is required for successful installation and registration of the AutoElevate Agent. If a valid license key is not available, the installation task will fail.

4. **Existing AutoElevate Installations**

   The deployment task is intended for initial deployment and agent updates. Administrative actions such as removing an existing agent should be performed through the AutoElevate Admin Portal.

5. **Deployment Exclusions**

   Machines excluded through the **Exclude AE Deployment Site** or **Exclude AE Deployment Endpoint** custom fields will not be targeted for AutoElevate deployment, even if the primary deployment setting is enabled.

6. **Installation Permissions**

   The installation task requires administrative privileges on the endpoint to download and install the AutoElevate Agent successfully.

## Associated Content

### Custom Fields

| Name | Level | Type | Purpose |
|---------|-------|----|--------|
| [AutoElevate Deployment](/docs/087d044f-a130-4650-ba45-eaf144d45b65) | Company | DropDown | Custom Field to Control AutoElevate deployment. | 
| [AE Blocker Mode](/docs/42e621c4-24fa-469e-9ea9-9109f8928388) | Company | DropDown | Custom Field to select the Auto Elevate Blocker Mode configuration to configure for the end user at the time of installation. | 
| [AE Elevation Mode](/docs/7561b830-134d-4e7b-9dab-30518d724dd0) | Company | DropDown | Custom Field to choose the Auto Elevate Elevation Mode to determine how privilege elevation requests are handled on the device once the agent is installed. | 
| [AE Company Short Initials](/docs/30bbb34e-579f-4186-97b3-f30a46a3fbe7) | Company | Text | Custom Field to Enter 2 or 3 Character Initials for the client that will show up in the Technicians AutoElevate Mobile App. | 
| [AE License Key](/docs/5481f063-b0be-431d-b745-6b6ffe7b4246) | Company | Text | Custom Field to add AutoElevate License Key. It is required for installing and registering the AutoElevate agent. | 
| [Exclude AE Deployment Site](/docs/d4fd67e2-f69d-4d12-9b38-e7fadcdeb5cc) | Site | DropDown  |Custom Field to exclude Site from AutoElevate Deployment. | 
| [Exclude AE Deployment Endpoint](/docs/db12afad-326d-4dea-a76f-161a5cd7f1b5) | Site | DropDown  | Custom Field to exclude Endpoint from AutoElevate Deployment. | 


### Group

| Name                | Purpose                                                              |
| ------------------- | -------------------------------------------------------------------- |
| [Deploy AutoElevate Agent](/docs/c7d6031a-55e8-451c-9b62-688cbd61b1ce)  | Dynamic group containing  machines that are opted for AutoElevate Agent deployment but currently do not have the AutoElevate Agent installed. |

### Task 

| Name                         | Purpose                                 |
| ---------------------------------------- | ----------------------------------------------------------- |
| [Install AutoElevate Agent](/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7) | Deploy and update of the AutoElevate on windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed. |


## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in ConnectWise RMM. These are required for the solution to function correctly.
- [AutoElevate Deployment](/docs/087d044f-a130-4650-ba45-eaf144d45b65)
- [AE Blocker Mode](/docs/42e621c4-24fa-469e-9ea9-9109f8928388) 
- [AE Elevation Mode](/docs/7561b830-134d-4e7b-9dab-30518d724dd0)
- [AE Company Short Initials](/docs/30bbb34e-579f-4186-97b3-f30a46a3fbe7)
- [AE License Key](/docs/5481f063-b0be-431d-b745-6b6ffe7b4246)
- [Exclude AE Deployment Site](/docs/d4fd67e2-f69d-4d12-9b38-e7fadcdeb5cc)
- [Exclude AE Deployment Endpoint](/docs/db12afad-326d-4dea-a76f-161a5cd7f1b5)

### Step 2: Create the Group

Create the dynamic group that will automatically target the enabled machines.

- [Deploy AutoElevate Agent](/docs/c7d6031a-55e8-451c-9b62-688cbd61b1ce)

### Step 3: Create the Task

Set up the script that will run on the targeted endpoints.

-  [Install AutoElevate Agent](/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7)

### Step 4: Schedule the Task

Schedule the [Task : Install AutoElevate Agent](/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7) to run once per day against the [Group : Deploy AutoElevate Agent](/docs/c7d6031a-55e8-451c-9b62-688cbd61b1ce), as described in the [Schedule Task](/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7) section of the task's document.

## FAQ

### Q: How does the AutoElevate Deployment solution work?

> The solution evaluates the AutoElevate deployment settings configured through ConnectWise RMM custom fields and identifies machines where AutoElevate deployment is enabled but the AutoElevate Agent is not currently installed. The **Install AutoElevate Agent** task then downloads the latest installer, installs the agent silently, and validates successful installation.

### Q: Which devices are targeted for AutoElevate deployment?

> Devices are targeted based on the configured deployment settings and exclusion rules. Machines must have AutoElevate deployment enabled and must not be excluded through the **Exclude AE Deployment Site** or **Exclude AE Deployment Endpoint** custom fields.

### Q: What happens if the AutoElevate License Key is missing?

> The installation task requires a valid AutoElevate License Key to register the agent. If the license key is not available, the installation task will fail and the agent will not be deployed.

### Q: How can I exclude a specific site from AutoElevate deployment?

> Use the **Exclude AE Deployment Site** custom field to exclude an entire site from AutoElevate deployment. Any endpoint within an excluded site will not be targeted for deployment.

### Q: How can I exclude an individual endpoint from deployment?

> Use the **Exclude AE Deployment Endpoint** custom field on the specific endpoint to prevent AutoElevate deployment on that machine.

### Q: Will the deployment task update existing AutoElevate installations?

> Yes. The **Install AutoElevate Agent** task supports installing or updating the AutoElevate Agent by downloading and executing the latest available installer.

### Q: Can I uninstall the AutoElevate Agent using this deployment task?

> No. Script-based uninstallation is not recommended for existing AutoElevate installations. AutoElevate recommends removing the computer from the AutoElevate Admin Portal, which will remove the device and initiate the agent uninstall process.

### Q: When will changes to AutoElevate custom fields take effect?

> Changes made to the AutoElevate deployment custom fields will take effect when the **Install AutoElevate Agent** task runs again against the targeted endpoint.

### Q: What happens if the AutoElevate installation fails?

> The installation task will return an error if the installer download fails, required configuration values are missing, or the AutoElevate Agent service is not detected after installation. Review the task output and installation logs for additional troubleshooting information.

### Q: Where can I find the AutoElevate installation log?

> The installation log is generated during installation and is stored at:
> `C:\AEInstallLog.log`

### Q: Does the solution require administrator privileges?

> Yes. The **Install AutoElevate Agent** task requires administrative privileges on the endpoint to download and install the AutoElevate Agent successfully.

### Q: Can deployment settings be different for different clients?

> Yes. AutoElevate deployment settings are managed through ConnectWise RMM custom fields, allowing each client, site, or endpoint to have its own deployment configuration.

## Changelog

### 2026-08-06

- Initial version of the document