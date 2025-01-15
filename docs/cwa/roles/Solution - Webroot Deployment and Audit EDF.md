---
id: 'a13e2f1a-70b3-4957-bf21-c528c1b5932c'
title: 'Webroot Keycode Deployment and Auditing Solution'
title_meta: 'Webroot Keycode Deployment and Auditing Solution'
keywords: ['webroot', 'keycode', 'deployment', 'auditing', 'monitoring']
description: 'This document outlines a solution for deploying Webroot and auditing keycode status for partners experiencing issues with the Webroot plugin. It includes associated scripts, monitors, and dataviews necessary for effective implementation and management of Webroot security.'
tags: ['monitoring', 'deployment', 'audit', 'security', 'script', 'alert', 'dataview']
draft: false
unlisted: false
---
## Purpose

This solution will be used for partners where the webroot plugin is broken which is currently a known issue to deploy the webroot and audit the keycode status.

## Associated Content

### Auditing Content

| Content | Type | Function |
|---------|------|----------|
| [Script - Webroot Keycode Verification [DV, EDF]](https://proval.itglue.com/DOC-5078775-14989420) | Script | This script collects the machine's Webroot hashed keycode and matches it with the keycode set up in the client EDF "Webroot Site Keycode". We can review the result using the DV. This also creates a ticket for the Webroot keycode mismatch or during a missing case when it is mapped with the monitor [SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291) where the ticket category is set. |
| [Internal Monitor - Execute Script - Webroot Keycode Verification [EDF]](https://proval.itglue.com/DOC-5078775-14989291) | Monitor | This monitor checks the online agent where the script [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](https://proval.itglue.com/DOC-5078775-14989420) has not run in the last 30 days and the agent has Webroot installed and the deployment enabled. |
| [Dataview - Webroot KeyCode Audit [Script]](https://proval.itglue.com/DOC-5078775-8105261) | Dataview | This dataview will show the Webroot hashed keycode present on the machine, the status of the keycode, and whether it matches the keycode setup under the Webroot plugin. |
| △ CUSTOM - Execute Script - Webroot Keycode Verification - EDF | Alert Template | This alert template is used with the monitor [SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291) to run the script [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](https://proval.itglue.com/DOC-5078775-14989420) as an autofix. |

### Automation Content

| Content | Type | Function |
|---------|------|----------|
| [Install Webroot SecureAnyWhere [EDF]](https://proval.itglue.com/DOC-5078775-14989293) | Script | This script deploys the Webroot to the agents using the "Webroot site keycode" client-EDF. |
| [Internal Monitor - Webroot Deployment [EDF]](https://proval.itglue.com/DOC-5078775-14989425) | Monitor | This monitor checks the online agent where the client EDF "Enable Webroot Deployment" is checked and the "Exclude Webroot Deployment" location/computer EDF is set to false and the agent missing Webroot and runs the script [Install Webroot SecureAnyWhere [EDF]](https://proval.itglue.com/DOC-5078775-14989293). |
| △ Custom - Execute Script - Install Webroot | Alert Template | This alert template is used with the monitor [SEC - Endpoint Protection - Monitor - Webroot Deployment [EDF]](https://proval.itglue.com/DOC-5078775-14989425) to run the script [Install Webroot SecureAnyWhere [EDF]](https://proval.itglue.com/DOC-5078775-14989293) as an autofix. |

### Other Content

| Content | Type | Function |
|---------|------|----------|
| [Webroot Site KeyCode](https://proval.itglue.com/DOC-5078775-14989313) | Document | This document shows steps on how to get the webroot site keycode. |
| [Webroot GroupCode and GroupName Fetching](https://proval.itglue.com/DOC-5078775-14989323) | Document | This document shows steps on how to get the webroot GroupCode and GroupName. |
| [Copy Webroot Plugin Data to EDF](https://proval.itglue.com/DOC-5078775-14501467) | Script | This client script will update the client EDFs value from the Webroot plugin only when AutoDeploy is enabled in the plugin table plugin_webroot3_clients or plugin_webroot_sa_cls_basic based on the Webroot version. |

## Implementation

1. **Import the following scripts using the ProSync plugin:**
   - [Script - △ Install Webroot SecureAnyWhere [Autofix, EDF]](https://proval.itglue.com/DOC-5078775-14989293)
   - [Script - Webroot Keycode Verification [DV, EDF]](https://proval.itglue.com/DOC-5078775-14989420)

   **If you would like to copy license keys + Deployment information from the plugin to the EDFs:**
   - Import the following script:
     - [Copy Webroot Plugin Data to EDF](https://proval.itglue.com/DOC-5078775-14501467)

2. **Import the following Internal Monitors using the ProSync plugin:**
   - [Internal Monitor - Execute Script - Webroot Keycode Verification [EDF]](https://proval.itglue.com/DOC-5078775-14989291)
   - [Internal Monitor - Execute Script - Webroot Deployment [EDF]](https://proval.itglue.com/DOC-5078775-14989425)

3. **Import the following dataview using the ProSync plugin:**
   - [Dataview - Webroot KeyCode Audit [Script]](https://proval.itglue.com/DOC-5078775-8105261)

4. **Import the following Alert Templates using the ProSync plugin:**
   - △ Custom - Execute Script - Install Webroot
   - △ Custom - Execute Script - Webroot Keycode Verification - EDF

5. **Reload the System Cache**
   ![Reload System Cache](../../../static/img/Solution---Webroot-Deployment-and-Audit-EDF/image_1.png)

6. **Configure the solution as follows:**
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291)
       - Configure with the alert template: △ Custom - Execute Script - Webroot Keycode Verification - EDF
       - Right-click and Run Now to start the monitor
     - [Internal Monitor - Webroot Deployment [EDF]](https://proval.itglue.com/DOC-5078775-14989425)
       - Configure with the alert template: △ Custom - Execute Script - Install Webroot
       - Right-click and Run Now to start the monitor

   **Note:**
   Please read the complete EDF detailing in the script before implementing the solution: [Install Webroot SecureAnyWhere [EDF]](https://proval.itglue.com/DOC-5078775-14989293). Also, follow the Other Content ([Webroot Site KeyCode](https://proval.itglue.com/DOC-5078775-14989313) and [Webroot GroupCode and GroupName Fetching](https://proval.itglue.com/DOC-5078775-14989323)) to get the steps on how to get the Site keycode and Group Code from the Webroot Portal.






