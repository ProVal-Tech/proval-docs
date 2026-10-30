---
id: 'b99808e9-5148-47f6-9da4-bc4eeb590f2a'
slug: /b99808e9-5148-47f6-9da4-bc4eeb590f2a
title: 'BlackPoint SnapAgent Deployment'
title_meta: 'BlackPoint SnapAgent Deployment'
keywords: ['deployment','snapagent','blackpoint']
description: 'Automate the deployment of the BlackPoint Agent on supported endpoints through ConnectWise RMM platform.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-10-30
---

## Purpose

The BlackPoint Deployment solution is designed to automate the deployment of the BlackPoint Agent on supported endpoints through ConnectWise RMM platform. It identifies machines that are configured for BlackPoint deployment but currently do not have the BlackPoint Agent installed and automatically deploys the agent based on the configured deployment settings.

The solution uses centralized configuration through ConnectWise RMM custom fields to control BlackPoint deployment behavior, including operating system selection, the BlackPoint authentication token and customer ID, and deployment exclusions at the site and endpoint level.

### Key Capabilities

1. **Automated BlackPoint SNAP Agent Deployment**  
   Automatically deploys the BlackPoint SNAP Agent on endpoints where deployment is enabled and the agent is not detected.

2. **Centralized Deployment Configuration**  
   Uses ConnectWise RMM custom fields to centrally manage BlackPoint configuration settings, including:
   - Target Operating System
   - Authentication Token (Windows and macOS)
   - Customer ID (Windows and macOS)
   - Deployment Enablement

3. **Site and Endpoint-Level Exclusions**  
   Provides the ability to exclude specific sites or individual endpoints from BlackPoint SNAP Agent deployment without changing the global deployment configuration.

4. **Automatic Installer Download**  
   Downloads the latest BlackPoint installer for the configured customer ID during execution, so no installer URL needs to be maintained.

5. **Silent Installation and Upgrade Support**  
   Installs or upgrades the BlackPoint SNAP Agent silently without requiring user interaction.

6. **Installation Validation**  
   Verifies successful installation by confirming that the BlackPoint SNAP Agent service is installed and available after deployment.

7. **Multi-Platform Deployment Support**  
   Supports BlackPoint SNAP Agent deployment across supported Windows and Macintosh devices.

## Associated Content

### Custom Fields

| Name | Level | Type | Purpose |
|---------|-------|----|--------|
| [BP_Enable_Deployment](/docs/c71a185f-c8df-4ead-a522-d3a963a8359e) | Company | DropDown | Custom field to select the target operating system for BlackPoint SnapAgent deployment. | 
| [BP_Authentication_Token](/docs/87e21aec-769d-43cb-93e7-cb5d0651ea0f) | Company | Text | Unique BlackPoint Authentication Code required to authenticate and install the BlackPoint Agent on Windows and macOS endpoints. | 
| [BP_Customer_ID](/docs/3e2b7506-4380-4e64-838b-e63aed5c0503) | Company | Text | Unique BlackPoint Account UID used to identify and link Windows and macOS endpoints to the correct BlackPoint account. | 
| [Exclude_BP_Deployment_Site](/docs/4974acda-b27e-444a-aec1-ad2ff75b64a2) | Site | Flag | Custom Field to exclude Site from BlackPoint SnapAgent Deployment. | 
| [Exclude_BP_Deployment_Endpoint](/docs/9f637ff9-5110-4278-a315-fc88188256f5) | Endpoint | Flag | Custom Field to exclude Endpoint from BlackPoint SnapAgent Deployment. | 


### Group

| Name                | Purpose                                                              |
| ------------------- | -------------------------------------------------------------------- |
| [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  | This group contains machines that are opted for BlackPoint SnapAgent deployment but currently do not have the BlackPoint SnapAgent installed. |

### Task 

| Name                         | Purpose                                 |
| ---------------------------------------- | ----------------------------------------------------------- |
| [Install BlackPoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) | Deploy and update the BlackPoint SnapAgent on Windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed. |

### Agnostic Script

| Name | Purpose |
|------|---------|
| [Install-BlackpointAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9) | PowerShell script used by the task to download the Blackpoint SnapAgent installer for the configured Customer ID, install it silently on Windows, and verify the installation. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in ConnectWise RMM. These are required for the solution to function correctly.
- [BP_Enable_Deployment](/docs/c71a185f-c8df-4ead-a522-d3a963a8359e)
- [BP_Authentication_Token](/docs/87e21aec-769d-43cb-93e7-cb5d0651ea0f)
- [BP_Customer_ID](/docs/3e2b7506-4380-4e64-838b-e63aed5c0503)
- [Exclude_BP_Deployment_Site](/docs/4974acda-b27e-444a-aec1-ad2ff75b64a2)
- [Exclude_BP_Deployment_Endpoint](/docs/9f637ff9-5110-4278-a315-fc88188256f5)

### Step 2: Create the Group

Create the dynamic group that will automatically target the enabled machines.

- [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  

### Step 3: Create the Task

Set up the script that will run on the targeted endpoints.

-  [Install BlackPoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51)

### Step 4: Schedule the Task

Schedule the [Install BlackPoint SnapAgent](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) to run once per day against the [Deploy BlackPoint SnapAgent](/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848)  , as described in the [Schedule Task](/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51) section of the task's document.

## FAQ

### Q: How does the BlackPoint SNAP Agent Deployment solution work?

> The solution evaluates the BlackPoint deployment settings configured through ConnectWise RMM custom fields and identifies machines where BlackPoint SNAP Agent deployment is enabled but the BlackPoint SNAP Agent is not currently installed. The **Install BlackPoint SnapAgent** task then downloads the BlackPoint installer using the configured customer ID and authentication token, installs the agent silently, and validates successful installation.

### Q: Which devices are targeted for BlackPoint SNAP Agent deployment?

> Devices are targeted based on the configured operating system, deployment settings, and exclusion rules. Machines must have BlackPoint deployment enabled and must not be excluded through the **Exclude_BP_Deployment_Site** or **Exclude_BP_Deployment_Endpoint** custom fields.

### Q: What configuration is required for BlackPoint deployment?

> BlackPoint deployment requires the deployment operating system selection in **BP_Enable_Deployment**, plus a valid BlackPoint authentication token and customer ID. The same **BP_Authentication_Token** and **BP_Customer_ID** values are used for both Windows and macOS deployment. A Windows installer URL is no longer required.

### Q: What happens if the BlackPoint authentication token is missing?

> A valid BlackPoint authentication token is required for both Windows and macOS deployment. If the authentication token is not available through either the **BP_Authentication_Token** custom field or the `Authentication_Token` task parameter, the installation task will fail and the agent will not be deployed.

### Q: What happens if the BlackPoint Customer ID is missing?

> A valid BlackPoint Customer ID is required for both Windows and macOS deployment to associate the endpoint with the correct BlackPoint account. If the Customer ID is not available through either the **BP_Customer_ID** custom field or the `Customer_ID` task parameter, the installation task will fail.

### Q: How can I exclude a specific site from BlackPoint SNAP Agent deployment?

> Use the **Exclude_BP_Deployment_Site** custom field to exclude an entire site from BlackPoint SNAP Agent deployment. Any endpoint within an excluded site will not be targeted for deployment.

### Q: How can I exclude an individual endpoint from deployment?

> Use the **Exclude_BP_Deployment_Endpoint** custom field on the specific endpoint to prevent BlackPoint SNAP Agent deployment on that machine.

### Q: Will the deployment task install the BlackPoint SNAP Agent on both Windows and macOS?

> Yes. The **Install BlackPoint SnapAgent** task supports both Windows and macOS endpoints. The configured operating system selection determines the appropriate deployment process and installation method.

### Q: What happens if the BlackPoint SNAP Agent is already installed?

> The deployment task checks for an existing BlackPoint SNAP Agent installation before starting the deployment. If the agent is already installed, the task will not start a new installation.

### Q: Can the deployment task update an existing BlackPoint SNAP Agent installation?

> The deployment task is designed to deploy the BlackPoint SNAP Agent when it is not detected. Existing installations are checked before deployment to prevent unnecessary installations.

### Q: When will changes to BlackPoint custom fields take effect?

> Changes made to the BlackPoint deployment custom fields will take effect when the **Install BlackPoint SnapAgent** task runs again against the targeted endpoint.

### Q: What happens if the BlackPoint installation fails?

> The installation task will return an error if the installer cannot be downloaded, required configuration values are missing or invalid, or the BlackPoint SNAP Agent cannot be verified after installation. Review the task output and installation logs for additional troubleshooting information.

### Q: Does the solution require administrator privileges?

> Yes. The **Install BlackPoint SnapAgent** task requires administrative privileges on the endpoint to download and install the BlackPoint SNAP Agent successfully.

### Q: Can deployment settings be different for different clients?

> Yes. BlackPoint deployment settings are managed through ConnectWise RMM custom fields, allowing each client, site, or endpoint to have its own deployment configuration and exclusions.

## Changelog

### 2026-10-30

- Renamed the `BP_MAC_Authentication_Token` and `BP_Mac_Customer_ID` custom fields to `BP_Authentication_Token` and `BP_Customer_ID`. Both are now used for Windows and macOS deployment.
- Removed the `BP_WIN_URL` custom field. The Windows installer is now downloaded using the customer ID and authentication token.
- Added the [Install-BlackpointAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9) agnostic script to the Associated Content.

### 2026-08-25

- Initial version of the document