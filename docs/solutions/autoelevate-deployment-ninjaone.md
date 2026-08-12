---
id: '58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9'
slug: /58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9
title: 'AutoElevate Deployment'
title_meta: 'AutoElevate Deployment'
keywords: ['autoelevate','agent','auto-deploy']
description: 'This solution is designed to configure the automatic deployment of the `AutoElevate` application on Windows and macOS machines that are missing the agent, using the NinjaOne platform.'
tags: ['security','application','deployment']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Purpose

This solution is designed to configure the automatic deployment of the `AutoElevate` application on Windows and macOS machines that are missing the agent, using the NinjaOne platform.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)    | Script |This script installs the AutoElevate agent on windows machines.|
| [AutoElevate Agent Deployment - Macintosh](/docs/675caeb7-105b-487d-a0ed-79954a52e685)    | Script |This script installs the AutoElevate agent on Mac machines. |
| [cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)    | Custom Field | This field controls whether the AutoElevate deployment process should run on the selected devices. |
| [cPVAL Blocker Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)   | Custom Field | Used to set the Blocker Mode configuration for the end user at the time of installation. |
| [cPVAL Elevation Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)   | Custom Field | Determines how privilege elevation requests are handled on the device once the agent is installed. |
| [cPVAL AutoElevate License Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)   | Custom Field | Holds the license key so that agent will get installed on the particular location. |
| [AutoElevate Deployment - Windows Workstations](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c)  | Compound Condition | This Compound condition is used to deploy the AutoElevate on windows workstations. |
| [AutoElevate deployment - Windows Servers](/docs/9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f) | Compound Condition |This Compound condition is used to deploy the AutoElevate on windows servers. |
| [AutoElevate Deployment - Macintosh](/docs/6fda1573-63f6-4b59-b862-1e8dc834492b) | Compound Condition |This Compound condition is used to deploy the AutoElevate on Mac machines. |


## Implementation

### Step 1

Create the following custom fields, set the vaule under those custom field per organization level.

- [cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)
- [cPVAL Blocker Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)
- [cPVAL Elevation Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)
- [cPVAL AutoElevate License Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)

### Step 2

Create the following automations:

- [Automation - AutoElevate Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)
- [AutoElevate Agent Deployment - Macintosh](/docs/675caeb7-105b-487d-a0ed-79954a52e685) 

### Step 3

Create the  [AutoElevate Deployment - Windows Workstations](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c) compound condition for `Windows Workstation policy [Default]` agent policy and schedule the AutoElevate Deployment to install the agent.

### Step 4

Create the [AutoElevate deployment - Windows Servers](/docs/9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f)  compound condition for`Windows Server policy [Default]` agent policy and schedule the AutoElevate Deployment to install the agent.  

### Step 5

Create the [AutoElevate Deployment - Macintosh](/docs/6fda1573-63f6-4b59-b862-1e8dc834492b) compound condition for `MAC policy [Default]` agent policy and schedule the AutoElevate Deployment to install the agent.  

## FAQ

### 1. Can the AutoElevate deployment be executed manually without relying on the auto-deployment custom field (`cPVAL AutoElevate Deployment`)?

> Yes, the AutoElevate deployment can be executed manually even if the auto-deployment custom field is disabled. The script can still be run manually to install or update AutoElevate on individual machines when necessary.

### 2. Are the custom fields (`cPVAL AutoElevate License Key, cPVAL Elevation Mode, cPVAL Blocker Mode`) mandatory for deployment?

> Yes, these fields are required for a successful deployment. They provide the license and configuration settings needed to register the agent to the correct environment and define its elevation and blocker behavior.

### 3. What should I do if AutoElevate does not deploy on certain machines?

> Check whether `cPVAL AutoElevate Deployment` is set to Enable for those machines or the site. Also verify that all required fields contain correct values and the endpoint has internet access to communicate with the AutoElevate portal.

### 4. Can deployment settings be customized per site or per device?

> Yes. Each site can have its own set of deployment variables, and overrides can be applied at the individual device level if needed. This allows flexibility for different policies across locations or departments.

### 5. What does the Elevation Mode parameter configure?

> Elevation Mode defines how the AutoElevate agent handles privilege elevation requests. Examples include automatic approval, challenge-based approval, or full request/approval workflow depending on the mode selected.

### 6. What is the purpose of the Blocker Mode parameter?

> Blocker Mode controls the behavior when an application is not automatically elevated—either blocking execution or allowing access until a rule is created. This provides control over how strictly privilege requests are managed.

### 7. Can the deployment script be scheduled to run regularly?

> Yes, it can be added to a recurring policy so that new machines automatically receive AutoElevate and existing machines can be checked for installation status.

## Changelog

### 2026-08-12

- Updated solution for deployment on MAC machines as well.
- Updated `cPVAL AutoElevate Deployment` Custom field options to include Mac machines. Removed separate servers options as that will be covered under `Windows` and `Windows and Macintosh` options only.
- Fixed auto-reset criteria for the compound conditions applied on Windows

### 2025-12-08

- Initial version of the document
