---
id: 'e0ad73d2-fcab-43f0-9866-72a48623ef48'
slug: /e0ad73d2-fcab-43f0-9866-72a48623ef48
title: 'Huntress Agent Deployment'
title_meta: 'Huntress Agent Deployment'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy', 'ninja']
description: 'This solution is designed to configure the automatic deployment of the Huntress Agent on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Purpose

This solution is designed to configure the automatic deployment of the Huntress Agent on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.

## Associated Content

### Custom Field

| Content | Type | Available Options | Function |
| ------- | ---- | ----------------- | -------- |
| [cPVAL Huntress Deployment](../ninjaone/custom-fields/cpval-huntress-deployment.md) | Drop-down | `Windows`, `Windows and Macintosh`, `Disabled` | Enables Huntress auto-deployment for Windows or both Windows and Macintosh machines at the organization level. |
| [cPVAL Huntress Install - Exclude](../ninjaone/custom-fields/cpval-huntress-install-exclude.md) | Drop-down | `Yes`, `No` | Allows exclusion of specific locations or devices from Huntress agent auto-deployment. |
| [cPVAL Huntress Account Key](../ninjaone/custom-fields/cpval-huntress-account-key.md) | Text | | Stores the Huntress Account Key to associate agents with the correct Huntress account. |
| [cPVAL Huntress Org Key](../ninjaone/custom-fields/cpval-huntress-org-key.md) | Text | | Stores the Huntress Organization Key. By default, this is the organization's name, but it can be customized if needed. |
| [cPVAL Huntress Tags](../ninjaone/custom-fields/cpval-huntress-tags.md) | Text | | Stores one or more tags, separated by commas (optional). |

### Automation

| Content | Function |
| ------- | -------- |
| [Install Huntress Agent - Windows](../ninjaone/automations/install-huntress-agent-windows.md) | Installs the Huntress agent on Windows machines, retrieving required keys from custom fields if not provided at runtime. |
| [Install Huntress Agent - Macintosh](../ninjaone/automations/install-huntress-agent-macintosh.md) | Installs the Huntress agent on Macintosh machines, retrieving required keys from custom fields. |

### Compound Conditions

| Content | Function |
| ------- | -------- |
| [Install Huntress Agent - Windows](../ninjaone/compound-conditions/install-huntress-agent-windows.md) | Triggers the [Install Huntress Agent - Windows](../automations/install-huntress-agent-windows.md) automation on Windows machines where deployment is enabled and `Huntress Agent` is not installed. |
| [Install Huntress Agent - Macintosh](../ninjaone/compound-conditions/install-huntress-agent-macintosh.md) | Triggers the [Install Huntress Agent - Macintosh](../automations/install-huntress-agent-macintosh.md) automation on Macintosh machines where deployment is enabled and `Huntress` is not installed. |

## Implementation

### Step 1

Create the following custom fields:

- [cPVAL Huntress Deployment](../ninjaone/custom-fields/cpval-huntress-deployment.md)  
- [cPVAL Huntress Install - Exclude](../ninjaone/custom-fields/cpval-huntress-install-exclude.md)  
- [cPVAL Huntress Account Key](../ninjaone/custom-fields/cpval-huntress-account-key.md)  
- [cPVAL Huntress Org Key](../ninjaone/custom-fields/cpval-huntress-org-key.md)  
- [cPVAL Huntress Tags](../ninjaone/custom-fields/cpval-huntress-tags.md)

### Step 2

Create the following automations:

- [Install Huntress Agent - Windows](../ninjaone/automations/install-huntress-agent-windows.md)  
- [Install Huntress Agent - Macintosh](../ninjaone/automations/install-huntress-agent-macintosh.md)

### Step 3

Create the [Install Huntress Agent - Windows](../ninjaone/compound-conditions/install-huntress-agent-windows.md) compound condition for both default agent policies: `Windows Server [Default]` and `Windows Workstation [Default]`. The example in the [document](../ninjaone/compound-conditions/install-huntress-agent-windows.md) illustrates the deployment process for the `Windows Workstations [Default]` agent policy. It is also recommended to apply this compound condition to the `Windows Server [Default]` agent policy, following the same process.  
![Image1](../../static/img/ninja-one-solution-huntress-agent-deployment/image1.png)

### Step 4

Create the [Install Huntress Agent - Macintosh](../ninjaone/compound-conditions/install-huntress-agent-macintosh.md) compound condition for both default agent policies: `Mac Server [Default]` and `Mac [Default]`. The example in the [document](../ninjaone/compound-conditions/install-huntress-agent-macintosh.md) illustrates the deployment process for the `Mac [Default]` agent policy. It is also recommended to apply this compound condition to the `Mac Server [Default]` agent policy, following the same process.
![Image2](../../static/img/ninja-one-solution-huntress-agent-deployment/image2.png)

## FAQ

### 1. Can the automations be executed manually and independently of the deployment custom fields?

Yes, the automations can be executed manually without relying on the deployment custom fields. If deployment is not enabled or the machine is excluded, the scripts can still be run manually to perform the desired actions.

### 2. Is the [cPVAL Huntress Account Key](../ninjaone/custom-fields/cpval-huntress-account-key.md) custom field mandatory for the auto-deployment solution to work?

Yes, the [cPVAL Huntress Account Key](../ninjaone/custom-fields/cpval-huntress-account-key.md) custom field is mandatory for the auto-deployment solution to function correctly. It is used to associate the Huntress Agent with the appropriate Huntress account.

### 3. What actions can the Windows script perform, and how are they controlled?

The [Windows script](../ninjaone/compound-conditions/install-huntress-agent-windows.md) can perform installation, repair, uninstallation, or reinstallation of the Huntress Agent for Windows machines. These actions are controlled by the `Action` runtime parameter of the script, which can be set to `Install`, `Repair`, `Uninstall`, `Reinstall`, or `Reregister`.

### 4. Why is the auto-deployment not working for a client even after enabling it?

If the auto-deployment is not working for a client, verify whether the organization, location, or machines are using a different agent policy. If they are, the compound conditions must be added to those specific agent policies as well to ensure the deployment functions correctly.
