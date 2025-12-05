---
id: '58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9'
slug: /58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9
title: 'AutoElevate Deployment - NinjaOne'
title_meta: 'AutoElevate Deployment - NinjaOne'
keywords: ['autoelevate','agent','auto-deploy']
description: 'This solution is designed to configure the automatic deployment of the `AutoElevate` application on Windows machines that are missing the agent, using the NinjaOne platform.'
tags: ['security','application','deployment']
draft: false
unlisted: false
---

## Purpose

This solution is designed to configure the automatic deployment of the `AutoElevate` application on Windows machines that are missing the agent, using the NinjaOne platform.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)    | Script |The script installs the AutoElevate Deployment. |
| [cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)    | Custom Field | This field controls whether the AutoElevate deployment process should run on the selected devices. When set to Enable, the deployment script will execute and install configure the AutoElevate agent using the defined parameters |
| [cPVAL Blocker_Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)   | Custom Field | The filed holds the blocker mode parameter. |
| [cPVAL Elevation_Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)   | Custom Field |The filed holds the Elevation mode parameter. |
| [cPVAL Ninja Organization Name](/docs/f6050cf6-67c8-4563-888e-8f34651cf4bb)  | Custom Field |The filed holds the Organization name or get the vaule for it within the ninjaone. |
| [cPVAL Ninja Location Name](/docs/4bfe4881-3687-4a30-bf00-d85067d5c6d8)   | Custom Field |he filed holds the location name or get the vaule for it within the ninjaone.|
| [cPVAL License_Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)   | Custom Field |he filed holds the license key so that agent will get installed on the particular location. |
| [AutoElevate Deployment Windows Workstation](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c)  | Compound Condition | The Compound condition is used to deploy the AutoElevate on windows workstations. |
| [AutoElevate deployment Windows servers](/docs/9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f) | Compound Condition |The Compound condition is used to deploy the AutoElevate on windows srvers. |

## Implementation

### Step 1
Create the following custom fields, set the vaule under those custom field per organization level.

- [cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)
- [cPVAL Blocker_Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)
- [cPVAL Elevation_Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)
- [cPVAL Ninja Organization Name](/docs/f6050cf6-67c8-4563-888e-8f34651cf4bb)
- [cPVAL Ninja Location Name](/docs/4bfe4881-3687-4a30-bf00-d85067d5c6d8)
- [cPVAL License_Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)

### Step 2

Create the following automations:

- [Automation - AutoElevate Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)

### Step 3

Create the [AutoElevate Deployment](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c) compound condition for default `Windows Workstation policy [Default]` agent policy and schedule the  AutoElevate Deployment to install the agent.

### Step 4

Create the [AutoElevate Deployment](/docs/9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f) compound condition for default `Windows Server policy [Default]` agent policy and schedule the  AutoElevate Deployment to install the agent.  

## FAQ

### 1. Can the AutoElevate deployment be executed manually without relying on the auto-deployment custom field (`cPVAL AutoElevate Deployment`)?

Yes, the AutoElevate deployment can be executed manually even if the auto-deployment custom field is disabled. The script can still be run manually to install or update AutoElevate on individual machines when necessary.

### 2. Are the custom fields (`cPVAL License_Key, cPVAL Ninja Organization Name, cPVAL Ninja Location Name, cPVAL Elevation_Mode, cPVAL Blocker_Mode`) mandatory for deployment?

Yes, these fields are required for a successful deployment. They provide the license and configuration settings needed to register the agent to the correct environment and define its elevation and blocker behavior.

### 3. What should I do if AutoElevate does not deploy on certain machines?

Check whether cPVAL AutoElevate Deployment is set to Enable for those machines or the site. Also verify that all required fields contain correct values and the endpoint has internet access to communicate with the AutoElevate portal.

### 4. Can deployment settings be customized per site or per device?

Yes. Each site can have its own set of deployment variables, and overrides can be applied at the individual device level if needed. This allows flexibility for different policies across locations or departments.

### 5. What does the Elevation Mode parameter configure?

Elevation Mode defines how the AutoElevate agent handles privilege elevation requests. Examples include automatic approval, challenge-based approval, or full request/approval workflow depending on the mode selected.

### 6. What is the purpose of the Blocker Mode parameter?

Blocker Mode controls the behavior when an application is not automatically elevated—either blocking execution or allowing access until a rule is created. This provides control over how strictly privilege requests are managed.

### 7. cPVAL Ninja Location NameCan the deployment script be scheduled to run regularly?

Yes, it can be added to a recurring policy so that new machines automatically receive AutoElevate and existing machines can be checked for installation status.

