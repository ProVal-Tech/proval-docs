---
id: 'a13e2f1a-70b3-4957-bf21-c528c1b5932c'
slug: /a13e2f1a-70b3-4957-bf21-c528c1b5932c
title: 'Solution - Webroot Deployment and Audit EDF'
title_meta: 'Solution - Webroot Deployment and Audit EDF'
keywords: ['webroot', 'keycode', 'deployment', 'auditing', 'monitoring']
description: 'This document outlines a solution for deploying Webroot and auditing keycode status for partners experiencing issues with the Webroot plugin. It includes associated scripts, monitors, and dataviews necessary for effective implementation and management of Webroot security.'
tags: ['deployment', 'security']
draft: false
unlisted: false
---

## Purpose

This solution is intended for partners where the Webroot plugin is broken, which is currently a known issue. It aims to deploy Webroot and audit the keycode status.

## Associated Content

### Auditing Content

| Content | Type | Function |
|---------|------|----------|
| [Script - Webroot Keycode Verification [DV, EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263) | Script | This script collects the machine's Webroot hashed keycode and matches it with the keycode set up in the client EDF "Webroot Site Keycode." The results can be reviewed using the DV. This also creates a ticket for the Webroot keycode mismatch or during a missing case when it is mapped with the monitor [SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5), where the ticket category is set. |
| [Internal Monitor - Execute Script - Webroot Keycode Verification [EDF]](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5) | Monitor | This monitor checks the online agent to see if the script [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263) has not run in the last 30 days and if the agent has Webroot installed with deployment enabled. |
| [Dataview - Webroot KeyCode Audit [Script]](/docs/5ed671db-6295-42ed-9f44-cd0b4203c4e4) | Dataview | This dataview displays the Webroot hashed keycode present on the machine, the status of the keycode, and whether it matches the keycode set up under the Webroot plugin. |
| △ CUSTOM - Execute Script - Webroot Keycode Verification - EDF | Alert Template | This alert template is used with the monitor [SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5) to run the script [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263) as an autofix. |

### Automation Content

| Content | Type | Function |
|---------|------|----------|
| [Install Webroot SecureAnywhere [EDF]](/docs/cddb5b54-a76e-4d74-8226-8f536d8f0eb4) | Script | This script deploys Webroot to the agents using the "Webroot site keycode" client EDF. |
| [Internal Monitor - Webroot Deployment [EDF]](/docs/af1a3bc3-874e-41b8-ae7f-d1b11bb664cc) | Monitor | This monitor checks the online agent where the client EDF "Enable Webroot Deployment" is checked, the "Exclude Webroot Deployment" location/computer EDF is set to false, and the agent is missing Webroot. It then runs the script [Install Webroot SecureAnywhere [EDF]](/docs/cddb5b54-a76e-4d74-8226-8f536d8f0eb4). |
| △ Custom - Execute Script - Install Webroot | Alert Template | This alert template is used with the monitor [SEC - Endpoint Protection - Monitor - Webroot Deployment [EDF]](/docs/af1a3bc3-874e-41b8-ae7f-d1b11bb664cc) to run the script [Install Webroot SecureAnywhere [EDF]](/docs/cddb5b54-a76e-4d74-8226-8f536d8f0eb4) as an autofix. |

### Other Content

| Content | Type | Function |
|---------|------|----------|
| [Webroot Site KeyCode](/docs/bde90a61-771c-46ef-98f5-3278febb3278) | Document | This document provides steps on how to obtain the Webroot site keycode. |
| [Webroot GroupCode and GroupName Fetching](/docs/4f44f833-a625-46b6-bae7-c74512ff22da) | Document | This document outlines the steps to retrieve the Webroot GroupCode and GroupName. |
| [Copy Webroot Plugin Data to EDF](/docs/7ea5c70f-f33b-4cf5-88ca-80e66fa68535) | Script | This client script updates the client EDFs value from the Webroot plugin only when AutoDeploy is enabled in the plugin table plugin_webroot3_clients or plugin_webroot_sa_cls_basic, based on the Webroot version. |

## Implementation

1. **Import the following scripts using the ProSync plugin:**
   - [Script - △ Install Webroot SecureAnywhere [Autofix, EDF]](/docs/cddb5b54-a76e-4d74-8226-8f536d8f0eb4)
   - [Script - Webroot Keycode Verification [DV, EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263)

   **If you would like to copy license keys and deployment information from the plugin to the EDFs:**
   - Import the following script:
     - [Copy Webroot Plugin Data to EDF](/docs/7ea5c70f-f33b-4cf5-88ca-80e66fa68535)

2. **Import the following Internal Monitors using the ProSync plugin:**
   - [Internal Monitor - Execute Script - Webroot Keycode Verification [EDF]](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5)
   - [Internal Monitor - Execute Script - Webroot Deployment [EDF]](/docs/af1a3bc3-874e-41b8-ae7f-d1b11bb664cc)

3. **Import the following dataview using the ProSync plugin:**
   - [Dataview - Webroot KeyCode Audit [Script]](/docs/5ed671db-6295-42ed-9f44-cd0b4203c4e4)

4. **Import the following Alert Templates using the ProSync plugin:**
   - △ Custom - Execute Script - Install Webroot
   - △ Custom - Execute Script - Webroot Keycode Verification - EDF

5. **Reload the System Cache**
   ![Reload System Cache](../../../static/img/docs/a13e2f1a-70b3-4957-bf21-c528c1b5932c/image_1.webp)

6. **Configure the solution as follows:**
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Wrong Webroot KeyCode Detected [EDF]](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5)
       - Configure with the alert template: △ Custom - Execute Script - Webroot Keycode Verification - EDF
       - Right-click and Run Now to start the monitor
     - [Internal Monitor - Webroot Deployment [EDF]](/docs/af1a3bc3-874e-41b8-ae7f-d1b11bb664cc)
       - Configure with the alert template: △ Custom - Execute Script - Install Webroot
       - Right-click and Run Now to start the monitor

   **Note:**
   Please read the complete EDF detailing in the script before implementing the solution: [Install Webroot SecureAnywhere [EDF]](/docs/cddb5b54-a76e-4d74-8226-8f536d8f0eb4). Additionally, follow the Other Content sections ([Webroot Site KeyCode](/docs/bde90a61-771c-46ef-98f5-3278febb3278) and [Webroot GroupCode and GroupName Fetching](/docs/4f44f833-a625-46b6-bae7-c74512ff22da)) for steps on how to obtain the Site keycode and Group Code from the Webroot Portal.

