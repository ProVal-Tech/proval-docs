---
id: '2b68cbb1-1406-4a4b-9173-e91f1b0c7f88'
slug: /2b68cbb1-1406-4a4b-9173-e91f1b0c7f88
title: 'Threatlocker Agent Deployment'
title_meta: 'Threatlocker Agent Deployment'
keywords: ['threatlocker', 'installation', 'windows', 'mac', 'groupkey']
description: 'The Purpose of this solution is to deploy a threatlocker agent on both Windows and Mac machines.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The Purpose of this solution is to deploy a threatlocker agent on both Windows and Mac machines.

## Associated Content

| Content                                                                 | Type             | Function                                                                                                    |
|-------------------------------------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------|
| [Threatlocker Agent Deployment](/docs/6ee04ebc-5867-4310-a8ed-1f800f031774) | Script           | Deploys Threatlocker agent on both MAC and Windows machines                              |
| [Deploy Threatlocker Agent](/docs/392a41e0-bbe1-4270-87a0-0a093aff3671) | Internal Monitor | Detects machines missing Threatlocker agent                                                                 |
| `△ Custom - Execute Script - Threatlocker Agent Deployment`             | Alert Template   | Executes the [Threatlocker Agent Deployment](/docs/6ee04ebc-5867-4310-a8ed-1f800f031774) on the machines detected by the [Deploy Threatlocker Agent](/docs/392a41e0-bbe1-4270-87a0-0a093aff3671) internal monitor |

## Implementation

### Step 1

Import the following content using the ProSync Plugin:

- **Script:** [Threatlocker Agent Deployment](/docs/6ee04ebc-5867-4310-a8ed-1f800f031774)  
- **Internal Monitor:** [Deploy Threatlocker Agent](/docs/392a41e0-bbe1-4270-87a0-0a093aff3671)  
- **Alert Template:** `△ Custom - Execute Script - Threatlocker Agent Deployment`

### Step 2

Reload the system cache:  
![Image1](../../static/img/docs/2b68cbb1-1406-4a4b-9173-e91f1b0c7f88/image1.webp)

### Step 3

Configure the solution as outlined below:

- Run the script [Threatlocker Agent Deployment](/docs/6ee04ebc-5867-4310-a8ed-1f800f031774) script on any agent by setting the `Set_environment` to `1` in order to create associated system properties.  
  ![Image4](../../static/img/docs/6ee04ebc-5867-4310-a8ed-1f800f031774/image4.webp)

- Navigate to `Automation` --> `Monitors` within the CWA Control Center and setup the following:
  - [Internal Monitor - ProVal - Production - Deploy Threatlocker Agent](/docs/392a41e0-bbe1-4270-87a0-0a093aff3671)  

    - Apply `△ Custom - Execute Script - Threatlocker Agent Deployment` alert template on the monitor  
    - Right-click and Run Now to start the monitor

### Step 4

**For Windows Deployment:**

- Enter the Threatlocker Authorization key in System Properties under system property `ThreatLockerAuthKey`
- Enter the Organization name in Client EDF `Threatlocker_Organization_Name`
- Enter the Threatlocker Group ID in Client EDF `ThreatlockerGroupID`

![Image1](../../static/img/docs/6ee04ebc-5867-4310-a8ed-1f800f031774/image1.webp)  

![Image2](../../static/img/docs/6ee04ebc-5867-4310-a8ed-1f800f031774/image2.webp)

![Image8](../../static/img/docs/6ee04ebc-5867-4310-a8ed-1f800f031774/image8.webp)

**For MAC Deployment:**

- Enter Threatlocker Mac in Client EDF `ThreatLockerMacGroupKey`

![Image3](../../static/img/docs/6ee04ebc-5867-4310-a8ed-1f800f031774/image3.webp)
