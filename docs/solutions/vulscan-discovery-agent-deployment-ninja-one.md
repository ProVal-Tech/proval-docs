---
id: '8d79f7ef-5984-44b9-9ed2-ae1368fbb50a'
slug: /8d79f7ef-5984-44b9-9ed2-ae1368fbb50a
title: 'Vulscan Discovery Agent Deployment'
title_meta: 'Vulscan Discovery Agent Deployment'
keywords: ['rapid-fire', 'vulscan', 'discovery-agent', 'security', 'auto-deploy']
description: 'This solution is designed to configure the automatic deployment of the Vulscan Discovery Agent application on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Purpose

This solution is designed to configure the automatic deployment of the `Vulscan Discovery Agent` application on Windows and Macintosh machines that are missing the agent, using the NinjaOne platform.

**Reference:** [VulScan_Discovery_Agents_Install_Guide.pdf](https://www2.rapidfiretools.com/nd/VulScan_Discovery_Agents_Install_Guide.pdf)

## Associated Content

### Custom Field

| Content | Definition Scope | Required | Type | Available Options | Applicable OS | Function |
| ------- | ---------------- | -------- | ---- | ----------------- | ------------- | -------- |
| [cPVAL Vulscan Discovery Agent Deployment](/docs/317af03f-eb40-4f3f-a0e7-0b1433f2c2e1) | `Organization` | True | Drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Windows`, `Macintosh` | Enables Vulscan Discovery Agent's auto-deployment for the selected platform. |
| [cPVAL Vulscan Discovery Agent - Exclude](/docs/685d8bef-ebda-40cb-a997-a7f9a208c837) | `Location`, `Device` | False | Drop-down | `Yes`, `No` | `Windows`, `Macintosh` | Excludes the device or location from Vulscan Discovery Agent deployment automation when set to 'Yes'. |
| [cPVAL Vulscan Install Key](/docs/ea08b033-7c1f-48e4-a58d-1851ea84932e) | `Organization` | True | Text |  | `Windows`, `Macintosh` | Allows agents to be associated with the organization during the agent installation. |

### Automation

| Content | Function |
| ------- | -------- |
| [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771) | Installs `Discovery Agent` on Windows machines, retrieving required install key from [cPVAL Vulscan Install Key](/docs/ea08b033-7c1f-48e4-a58d-1851ea84932e) custom fields if not provided at runtime. |
| [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7) | Installs the `DiscoveryAgent` on Macintosh machines, retrieving required install key from [cPVAL Vulscan Install Key](/docs/ea08b033-7c1f-48e4-a58d-1851ea84932e) custom field. |

### Compound Conditions

| Content | Function |
| ------- | -------- |
| [Deploy Vulscan Discovery Agent - Windows Workstations](/docs/0a45663a-0274-4e07-bfba-03d7c6b7478f) | Triggers the [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771) automation on Windows workstations where deployment is enabled and `Discovery Agent` is not installed. |
| [Deploy Vulscan Discovery Agent - Windows Servers](/docs/256083db-4ee7-435d-9ce4-ba56e937b733) | Triggers the [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771) automation on Windows servers where deployment is enabled and `Discovery Agent` is not installed. |
| [Deploy Vulscan Discovery Agent - Macintosh](/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0) | Triggers the [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7) automation on Macintosh machines where deployment is enabled and `DiscoveryAgent` is not installed. |

## Implementation

### Step 1

Create the following custom fields:

- [cPVAL Vulscan Discovery Agent Deployment](/docs/317af03f-eb40-4f3f-a0e7-0b1433f2c2e1)
- [cPVAL Vulscan Discovery Agent - Exclude](/docs/685d8bef-ebda-40cb-a997-a7f9a208c837)
- [cPVAL Vulscan Install Key](/docs/ea08b033-7c1f-48e4-a58d-1851ea84932e)

### Step 2

Create the following automations:

- [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771)
- [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7)

### Step 3

Create the [Deploy Vulscan Discovery Agent - Windows Workstations](/docs/0a45663a-0274-4e07-bfba-03d7c6b7478f) compound condition for default `Windows Workstation [Default]` agent policy.  
![DefaultWindowsWorkstation](../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.png)

### Step 4

Create the [Deploy Vulscan Discovery Agent - Windows Servers](/docs/256083db-4ee7-435d-9ce4-ba56e937b733) compound condition for default `Windows Server [Default]` agent policy.  
![DefaultWindowsServer](../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsservers.png)

### Step 5

Create the [Deploy Vulscan Discovery Agent - Macintosh](/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0) compound condition for both default agent policies: `Mac Server [Default]` and `Mac [Default]`. The example in the [document](/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0) illustrates the deployment process for the `Mac [Default]` agent policy. It is also recommended to apply this compound condition to the `Mac Server [Default]` agent policy, following the same process.
![Image2](../../static/img/docs/8d79f7ef-5984-44b9-9ed2-ae1368fbb50a/image2.png)

## FAQ

### 1. Can the automations be executed manually without relying on the auto-deployment custom fields (`cPVAL Vulscan Discovery Agent Deployment`, `cPVAL Vulscan Discovery Agent - Exclude`)?

Yes, the automations can be executed manually, independent of the auto-deployment custom fields. Even if deployment is not enabled or the machine is excluded, the scripts can still be run manually to perform the required actions.

### 2. Are the [cPVAL Vulscan Install Key] and other custom fields mandatory for deployment?

Yes, the [cPVAL Vulscan Install Key] custom field is mandatory for the deployment to function correctly. It ensures that the agent installation is associated with the correct organization.

### 3. What should I do if the auto-deployment is not working for certain machines?

If auto-deployment is not working, check if the machines are excluded using the `cPVAL Vulscan Discovery Agent - Exclude` custom field or if they are using a different agent policy. Ensure the compound conditions are applied to the correct agent policies for deployment to work.

### 4. Can the deployment process be customized for specific platforms?

Yes, the deployment process can be customized by selecting the appropriate options in the `cPVAL Vulscan Discovery Agent Deployment` custom field. This allows you to enable deployment for specific platforms such as Windows workstations, Windows servers, or Macintosh machines.

### 5. What happens if the Vulscan service is unreachable during deployment?

If the Vulscan service is unreachable, the deployment process will fail. Ensure that the network connection to the Vulscan service is stable and that the required key is correctly configured.