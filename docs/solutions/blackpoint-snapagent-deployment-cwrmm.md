---
id: 'b99808e9-5148-47f6-9da4-bc4eeb590f2a'
slug: /b99808e9-5148-47f6-9da4-bc4eeb590f2a
title: 'BlackPoint SnapAgent Deployment'
title_meta: 'BlackPoint SnapAgent Deployment'
keywords: ['deployment','snapagent','blackpoint']
description: 'Automate the deployment of the Blackpoint Agent on supported endpoints through ConnectWise RMM platform.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-08-18
---

## Purpose

The Blackpoint Deployment solution is designed to automate the deployment of the Blackpoint Agent on supported endpoints through ConnectWise RMM platform. It identifies machines that are configured for Blackpoint deployment but currently do not have the Blackpoint Agent installed and automatically deploys the agent based on the configured deployment settings.

The solution uses centralized configuration through ConnectWise RMM custom fields to control Blackpoint deployment behavior, including operating system selection, installer URL, macOS authentication details, customer ID, and deployment exclusions at the site and endpoint level.

### Key Capabilities

1. **Automated Blackpoint SNAP Agent Deployment**  
   Automatically deploys the Blackpoint SNAP Agent on endpoints where deployment is enabled and the agent is not detected.

2. **Centralized Deployment Configuration**  
   Uses ConnectWise RMM custom fields to centrally manage Blackpoint configuration settings, including:
   - Target Operating System
   - Windows Installer URL
   - macOS Authentication Token
   - macOS Customer ID
   - Deployment Enablement

3. **Site and Endpoint-Level Exclusions**  
   Provides the ability to exclude specific sites or individual endpoints from Blackpoint SNAP Agent deployment without changing the global deployment configuration.

4. **Automatic Installer Download**  
   Downloads the configured Blackpoint installer during execution to ensure the appropriate agent installer is deployed.

5. **Silent Installation and Upgrade Support**  
   Installs or upgrades the Blackpoint SNAP Agent silently without requiring user interaction.

6. **Installation Validation**  
   Verifies successful installation by confirming that the Blackpoint SNAP Agent service is installed and available after deployment.

7. **Multi-Platform Deployment Support**  
   Supports Blackpoint SNAP Agent deployment across supported Windows and Macintosh devices.

## Associated Content

### Custom Fields

| Name | Level | Type | Purpose |
|---------|-------|----|--------|
| [BP_Enable_Deployment](/docs/c71a185f-c8df-4ead-a522-d3a963a8359e) | Company | DropDown | Custom field to select the target operating system for Blackpoint SnapAgent deployment. | 
| [BP_WIN_URL](/docs/efc2b061-c9c9-4d86-9a96-597e796d05c7) | Company | Text | The direct URL used to download the Blackpoint Windows agent installer. This URL is used by the `Install SnapAgent` to retrieve the latest installer package and install the Blackpoint agent on the target Windows machine. | 
| [BP_MAC_Authentication_Token](/docs/87e21aec-769d-43cb-93e7-cb5d0651ea0f) | Company | Text | Unique BlackPoint Authentication token to be used during the installation of the Blackpoint SNAP agent on MacOS endpoints. | 
| [BP_Mac_Customer_ID](/docs/3e2b7506-4380-4e64-838b-e63aed5c0503) | Company | Text |Unique Blackpoint Account UID used to identify and link endpoints to the correct Blackpoint account. This is for MAC agents. | 
| [Exclude_BP_Deployment_Site](/docs/4974acda-b27e-444a-aec1-ad2ff75b64a2) | Site | Flag | CCustom Field to exclude Site from Blackpoint SnapAgent Deployment. | 
| [Exclude_BP_Deployment_Endpoint](/docs/db12afad-326d-4dea-a76f-161a5cd7f1b5) | Endpoint | Flag | 9f637ff9-5110-4278-a315-fc88188256f5 | 


### Group

| Name                | Purpose                                                              |
| ------------------- | -------------------------------------------------------------------- |
| [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  | This group contains machines that are opted for BlackPoint SnapAgent deployment but currently do not have the BlackPoint SnapAgent installed. |

### Task 

| Name                         | Purpose                                 |
| ---------------------------------------- | ----------------------------------------------------------- |
| [Install Blackpoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) | Deploy and update of the AutoElevate on windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed. |


## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in ConnectWise RMM. These are required for the solution to function correctly.
- [BP_Enable_Deployment](/docs/c71a185f-c8df-4ead-a522-d3a963a8359e)
- [BP_WIN_URL](/docs/efc2b061-c9c9-4d86-9a96-597e796d05c7)
- [BP_MAC_Authentication_Token](/docs/87e21aec-769d-43cb-93e7-cb5d0651ea0f) 
- [BP_Mac_Customer_ID](/docs/3e2b7506-4380-4e64-838b-e63aed5c0503)
- [AE License Key](/docs/5481f063-b0be-431d-b745-6b6ffe7b4246)
- [Exclude_BP_Deployment_Site](/docs/4974acda-b27e-444a-aec1-ad2ff75b64a2)
- [Exclude_BP_Deployment_Endpoint](/docs/db12afad-326d-4dea-a76f-161a5cd7f1b5)

### Step 2: Create the Group

Create the dynamic group that will automatically target the enabled machines.

- [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  

### Step 3: Create the Task

Set up the script that will run on the targeted endpoints.

-  [Install Blackpoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51)

### Step 4: Schedule the Task

Schedule the [Install Blackpoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) to run once per day against the [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  , as described in the [Schedule Task](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) section of the task's document.

## FAQ

### Q: How does the Blackpoint SNAP Agent Deployment solution work?

> The solution evaluates the Blackpoint deployment settings configured through ConnectWise RMM custom fields and identifies machines where Blackpoint SNAP Agent deployment is enabled but the Blackpoint SNAP Agent is not currently installed. The **Install Blackpoint SnapAgent** task then downloads the configured installer, installs the agent silently, and validates successful installation.

### Q: Which devices are targeted for Blackpoint SNAP Agent deployment?

> Devices are targeted based on the configured operating system, deployment settings, and exclusion rules. Machines must have Blackpoint deployment enabled and must not be excluded through the **Exclude_BP_Deployment_Site** or **Exclude_BP_Deployment_Endpoint** custom fields.

### Q: What configuration is required for Blackpoint deployment?

> Blackpoint deployment requires the appropriate deployment operating system selection and installer configuration. Windows deployment requires a valid Windows installer URL, while macOS deployment requires a valid Blackpoint authentication token and customer ID.

### Q: What happens if the Blackpoint authentication token is missing?

> A valid Blackpoint authentication token is required for macOS deployment. If the authentication token is not available through either the client-specific custom field or configured parameter, the macOS installation task will fail and the agent will not be deployed.

### Q: What happens if the Blackpoint Customer ID is missing?

> A valid Blackpoint Customer ID is required for macOS deployment to associate the endpoint with the correct Blackpoint account. If the Customer ID is not available through either the client-specific custom field or configured parameter, the macOS installation task will fail.

### Q: How can I exclude a specific site from Blackpoint SNAP Agent deployment?

> Use the **Exclude_BP_Deployment_Site** custom field to exclude an entire site from Blackpoint SNAP Agent deployment. Any endpoint within an excluded site will not be targeted for deployment.

### Q: How can I exclude an individual endpoint from deployment?

> Use the **Exclude_BP_Deployment_Endpoint** custom field on the specific endpoint to prevent Blackpoint SNAP Agent deployment on that machine.

### Q: Will the deployment task install the Blackpoint SNAP Agent on both Windows and macOS?

> Yes. The **Install Blackpoint SnapAgent** task supports both Windows and macOS endpoints. The configured operating system selection determines the appropriate deployment process and installation method.

### Q: What happens if the Blackpoint SNAP Agent is already installed?

> The deployment task checks for an existing Blackpoint SNAP Agent installation before starting the deployment. If the agent is already installed, the task will not start a new installation.

### Q: Can the deployment task update an existing Blackpoint SNAP Agent installation?

> The deployment task is designed to deploy the Blackpoint SNAP Agent when it is not detected. Existing installations are checked before deployment to prevent unnecessary installations.

### Q: When will changes to Blackpoint custom fields take effect?

> Changes made to the Blackpoint deployment custom fields will take effect when the **Install Blackpoint SnapAgent** task runs again against the targeted endpoint.

### Q: What happens if the Blackpoint installation fails?

> The installation task will return an error if the installer cannot be downloaded, required configuration values are missing or invalid, or the Blackpoint SNAP Agent cannot be verified after installation. Review the task output and installation logs for additional troubleshooting information.

### Q: Does the solution require administrator privileges?

> Yes. The **Install Blackpoint SnapAgent** task requires administrative privileges on the endpoint to download and install the Blackpoint SNAP Agent successfully.

### Q: Can deployment settings be different for different clients?

> Yes. Blackpoint deployment settings are managed through ConnectWise RMM custom fields, allowing each client, site, or endpoint to have its own deployment configuration and exclusions.

## Changelog

### 2026-08-18

- Initial version of the document