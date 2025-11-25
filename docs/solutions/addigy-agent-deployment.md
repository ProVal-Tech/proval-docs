---
id: '1f1e6543-8ab7-4b30-adde-ac0f0b2f54a1'
slug: /1f1e6543-8ab7-4b30-adde-ac0f0b2f54a1
title: 'Addigy Agent Deployment'
title_meta: 'Addigy Agent Deployment'
keywords: ['addigy', 'addigy-agent', 'install-addigy-agent', 'mac-manage', 'mac-manage-helper']
description: 'This solution provides automated deployment of the Addigy agent to macOS devices using NinjaOne. It utilizes a compound condition to detect if the agent is missing (checking for `MacManage` or `MacManageHelper` applications) and deploys it only when explicitly enabled via a custom field. The solution supports dynamic configuration of Addigy Organization and Policy IDs at the organization level to ensuring devices report to the correct management bucket.'
tags: ['installation', 'application', 'macos']
draft: false
unlisted: false
---

## Purpose

This solution provides automated deployment of the Addigy agent to macOS devices using NinjaOne. It utilizes a compound condition to detect if the agent is missing (checking for `MacManage` or `MacManageHelper` applications) and deploys it only when explicitly enabled via a custom field. The solution supports dynamic configuration of Addigy Organization and Policy IDs at the organization level to ensuring devices report to the correct management bucket.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Addigy Agent Deployment](/docs/bbe758be-e2fb-4a0b-aa1d-1b1ae0119058) | Enable | Drop-down | Organization, Location, Device | False | Controls Addigy agent auto-deployment for macOS devices |
| [cPVAL Addigy Org ID](/docs/b3a99690-e1d2-40ad-8ee8-9c417330e2b9) | 5d0cf821-3fbf-4ed1-9997-9f343a446cea | Text | Organization | Partially | Store the Addigy Organization ID here for automatic application to all devices |
| [cPVAL Addigy Policy ID](/docs/7061a031-f078-4ee0-b87c-83595adf0a64) | 7ca7ebdd-2ee4-4e71-88a6-8bd633c74d5f | Text | Organization | Partially | Stores the Addigy Policy ID for this organization |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Install Addigy Agent [Macintosh]](/docs/fd5e79e9-e9bf-4d8a-ba85-d61bf6e723fe) | Downloads and installs the Addigy Agent using dynamic NinjaRMM parameters (Org ID and Policy ID) |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Addigy Agent Deployment](/docs/1cfd0e8b-5a27-4bc0-af0a-fea2cc0ea62c) | Executes installation script on machines where deployment is enabled and the agent is missing |

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields under `SETTINGS → Custom Fields` with the corresponding configurations:

**1. [cPVAL Addigy Agent Deployment](/docs/bbe758be-e2fb-4a0b-aa1d-1b1ae0119058)**

* **Definition Scope:** Organization, Location, Device
* **Type:** Drop-down
* **Options:** Enable, Disable
* **Default Value:** (Empty)
* **Tab Name:** Addigy Agent

**2. [cPVAL Addigy Org ID](/docs/b3a99690-e1d2-40ad-8ee8-9c417330e2b9)**

* **Definition Scope:** Organization
* **Type:** Text
* **Required:** Partially (Required for auto-applying Org ID)
* **Tab Name:** Addigy Agent

**3. [cPVAL Addigy Policy ID](/docs/7061a031-f078-4ee0-b87c-83595adf0a64)**

* **Definition Scope:** Organization
* **Type:** Text
* **Required:** Partially (Critical for accurate policy mapping)
* **Tab Name:** Addigy Agent

### Step 2: Import Automation Script

Import the required automation script:

1. **[Install Addigy Agent [Macintosh]](/docs/fd5e79e9-e9bf-4d8a-ba85-d61bf6e723fe)** - Downloads and installs the Addigy Agent.

### Step 3: Configure Compound Condition

Create the compound condition to target the appropriate device policy:

* **Name:** [Addigy Agent Deployment](/docs/1cfd0e8b-5a27-4bc0-af0a-fea2cc0ea62c)
* **Policy:** `Mac Policy [Default]`
* **Logic:** Executes on machines where `cPVAL Addigy Agent Deployment` is set to "Enable" AND either `MacManage` or `MacManageHelper` applications are NOT installed.

### Step 4: Set Organizational Default

Configure the organizational-level custom fields to establish deployment parameters:

1. Navigate to the **Organization** level settings.
2. Enter the valid Addigy **Organization ID** into the [cPVAL Addigy Org ID](/docs/b3a99690-e1d2-40ad-8ee8-9c417330e2b9) field.
3. Enter the valid Addigy **Policy ID** into the [cPVAL Addigy Policy ID](/docs/7061a031-f078-4ee0-b87c-83595adf0a64) field.
4. Set the [cPVAL Addigy Agent Deployment](/docs/bbe758be-e2fb-4a0b-aa1d-1b1ae0119058) field to **Enable** to begin deployment for the organization.
5. Use Location or Device level overrides to **Disable** deployment for specific groups or endpoints if necessary.

## FAQ

**Q: How does the solution prevent reinstalling the agent on devices that already have it?**
**A:** The [Addigy Agent Deployment](/docs/1cfd0e8b-5a27-4bc0-af0a-fea2cc0ea62c) compound condition checks for the presence of `MacManage` or `MacManageHelper` applications. The installation script is only triggered if these applications are missing.

**Q: Can I exclude specific devices or locations from the deployment?**
**A:** Yes. You can set the [cPVAL Addigy Agent Deployment](/docs/bbe758be-e2fb-4a0b-aa1d-1b1ae0119058) custom field to **Disable** at the Location or Device level to override the Organization-level setting.

**Q: Where should I enter the Addigy Organization and Policy IDs?**
**A:** These must be entered in the [cPVAL Addigy Org ID](/docs/b3a99690-e1d2-40ad-8ee8-9c417330e2b9) and [cPVAL Addigy Policy ID](/docs/7061a031-f078-4ee0-b87c-83595adf0a64) custom fields at the **Organization** level.

**Q: What happens if the Org ID or Policy ID is missing?**
**A:** The [Install Addigy Agent [Macintosh]](/docs/fd5e79e9-e9bf-4d8a-ba85-d61bf6e723fe) script requires these values to function correctly. If they are not set in the custom fields, the installation may fail or the device might not report to the correct tenant.

**Q: How often is the deployment condition evaluated?**
**A:** The [Addigy Agent Deployment](/docs/1cfd0e8b-5a27-4bc0-af0a-fea2cc0ea62c) compound condition runs once per day automatically to monitor the device state. If a device matches the criteria (Deployment Enabled AND Agent Missing), the script will queue for execution.

**Q: Is it mandatory to configure the custom fields to run the installation script?**
**A:** Not for manual execution. If you run the [Install Addigy Agent [Macintosh]](/docs/fd5e79e9-e9bf-4d8a-ba85-d61bf6e723fe) script manually, you can input the **Org ID** and **Policy ID** directly as runtime parameters. However, for the automated deployment via the [Addigy Agent Deployment](/docs/1cfd0e8b-5a27-4bc0-af0a-fea2cc0ea62c) compound condition, the custom fields are required because the automation cannot prompt for runtime inputs.

**Q: What takes precedence if both a Custom Field and a Runtime Parameter are provided?**
**A:** The Runtime Parameter takes precedence. If a value exists in the [cPVAL Addigy Org ID](/docs/b3a99690-e1d2-40ad-8ee8-9c417330e2b9) custom field, but you manually run the script and provide a different value in the **Org ID** parameter, the script will use the manually entered parameter. This allows for one-off installations on devices that may need to belong to a different organization or policy than the default.
