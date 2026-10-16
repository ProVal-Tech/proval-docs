---
id: '72284ce2-4cf0-402b-99c3-7c0cafa3d213'
slug: /72284ce2-4cf0-402b-99c3-7c0cafa3d213
title: 'ImmyBot Agent Deployment - NinjaOne'
title_meta: 'ImmyBot Agent Deployment - NinjaOne'
keywords: ['immybot', 'agent', 'installation', 'reinstallation', 'ninjaone']
description: 'Automate the deployment and reinstallation of the ImmyBot Agent on Windows servers and workstations through NinjaOne using centralized configuration and deployment conditions.'
tags: ['windows', 'software', 'deployment']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Purpose

The ImmyBot Agent Deployment solution automates the deployment of the ImmyBot Agent on Windows servers and workstations through the NinjaOne platform. It uses centralized configuration through NinjaOne custom fields and deployment conditions to manage the installation process on targeted endpoints.

The solution uses the **Install ImmyBot Agent** script to deploy the agent based on the configured ImmyBot tenant information, installer key, installer ID, and deployment settings. Separate compound conditions are used to identify the Windows servers and workstations targeted for deployment.

### Key Capabilities

1. **Automated ImmyBot Agent Deployment**  
   Automates the installation of the ImmyBot Agent on targeted Windows servers and workstations through NinjaOne.

2. **Centralized Deployment Configuration**  
   Uses NinjaOne custom fields to manage the ImmyBot tenant name, installer key, installer ID, and deployment enablement settings.

3. **Server and Workstation Targeting**  
   Uses separate compound conditions to identify Windows servers and workstations targeted for ImmyBot Agent deployment.

4. **Configurable Reinstallation**  
   Supports reinstalling the ImmyBot Agent when required, based on the script's configured options.

5. **Centralized Deployment Management**  
   Allows administrators to manage deployment settings through NinjaOne without manually configuring each endpoint.

## Associated Content

### Custom Fields

| Name | Purpose |
|---|---|
| [cPVAL ImmyBot Tenant](/docs/3f2fa791-6db5-448b-848c-0ee035af31d2) | Stores the ImmyBot tenant name used for agent deployment. |
| [cPVAL ImmyBot Installer Key](/docs/10e4f602-510f-4ca1-8dcd-2845e06a3556) | Stores the ImmyBot installer key required for the configured deployment process. |
| [cPVAL ImmyBot Installer ID](/docs/22d1e1a4-68ab-4895-8694-134df61ea3ea) | Stores the ImmyBot installer ID used for agent deployment. |
| [cPVAL Deploy ImmyBot](/docs/05f6b41c-23ad-43ce-8621-92976ef24fb4) | Controls whether ImmyBot Agent deployment is enabled for the applicable endpoints. |

### Compound Conditions

| Name | Purpose |
|---|---|
| [ImmyBot Agent Deployment - Servers](/docs/90fac165-29c3-4823-b151-70fc5d84c0c5) | Identifies Windows servers targeted for ImmyBot Agent deployment. |
| [ImmyBot Agent Deployment - Workstations](/docs/6b1d7cee-c3a3-4c7a-a090-df20315fd08e) | Identifies Windows workstations targeted for ImmyBot Agent deployment. |

### Script

| Name | Purpose |
|---|---|
| [Install ImmyBot Agent](/docs/b0ed9c36-9a5b-44cc-a8b2-b5bbb7e2c3b7) | Automates the installation of the ImmyBot Agent using the configured deployment settings, with an option to reinstall the agent when required. |

## Implementation

### Step 1: Create the Required Custom Fields

Create or configure the following custom fields in NinjaOne. These fields provide the configuration required for the ImmyBot Agent deployment process.

- [cPVAL ImmyBot Tenant](/docs/3f2fa791-6db5-448b-848c-0ee035af31d2)
- [cPVAL ImmyBot Installer Key](/docs/10e4f602-510f-4ca1-8dcd-2845e06a3556)
- [cPVAL ImmyBot Installer ID](/docs/22d1e1a4-68ab-4895-8694-134df61ea3ea)
- [cPVAL Deploy ImmyBot](/docs/05f6b41c-23ad-43ce-8621-92976ef24fb4)

Populate the custom fields with the appropriate values for the target environment and enable deployment where required.

### Step 2: Configure the Deployment Conditions

Configure the compound conditions to identify the endpoints targeted for ImmyBot Agent deployment.

- [ImmyBot Agent Deployment - Servers](/docs/90fac165-29c3-4823-b151-70fc5d84c0c5)
- [ImmyBot Agent Deployment - Workstations](/docs/6b1d7cee-c3a3-4c7a-a090-df20315fd08e)

Use the appropriate condition for Windows servers or workstations based on the intended deployment scope.

### Step 3: Configure the Installation Script

Set up the [Install ImmyBot Agent](/docs/b0ed9c36-9a5b-44cc-a8b2-b5bbb7e2c3b7) script in NinjaOne.

Ensure the required custom fields are configured correctly and the script is set up with the appropriate deployment and reinstallation options.

## FAQ

### Q: How does the ImmyBot Agent Deployment solution work?

> The solution uses NinjaOne custom fields to manage the ImmyBot deployment configuration and compound conditions to identify the targeted Windows servers and workstations. The **Install ImmyBot Agent** script performs the installation using the configured settings.

### Q: Which devices are supported by this solution?

> The solution is designed to deploy the ImmyBot Agent on Windows servers and workstations through NinjaOne.

### Q: What configuration is required before deployment?

> The required configuration includes the ImmyBot tenant name, installer key, installer ID, and deployment enablement settings. These values must be configured in the corresponding NinjaOne custom fields.

### Q: How are servers and workstations targeted separately?

> The solution uses separate compound conditions for Windows servers and workstations. Select the appropriate condition based on the intended deployment scope.

### Q: Can the ImmyBot Agent be reinstalled?

> Yes. The installation script supports reinstallation when required. Review the script's available options and test the reinstallation process before using it on production endpoints.

### Q: What happens if the deployment configuration is missing or incorrect?

> Missing or incorrect configuration may prevent the installation from completing successfully. Verify the tenant name, installer key, installer ID, and deployment settings before running the script.

### Q: How can I control whether ImmyBot deployment is enabled?

> Use the **cPVAL Deploy ImmyBot** custom field to manage deployment enablement according to the configured deployment conditions.

### Q: Should the script be tested before deployment to all endpoints?

> Yes. Test the script on a suitable server or workstation first to confirm that the agent installs correctly and that the deployment configuration behaves as expected.

### Q: What should I check if the installation fails?

> Review the script execution output, verify the configured custom field values, and confirm that the target endpoint meets the deployment conditions. Investigate any reported download, configuration, or installation errors before retrying.

## Changelog

### 2026-10-16

- Initial version of the document.
