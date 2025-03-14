---
id: '37781bee-b7cd-448e-9d45-53e789a455b8'
title: 'EPM - Windows Configuration - Component - Huntress Managed EDR - WIN PVAL'
title_meta: 'EPM - Windows Configuration - Component - Huntress Managed EDR - WIN PVAL'
keywords: ['huntress', 'edr', 'datto', 'component', 'management']
description: 'This document outlines the management of the Huntress EDR agent, detailing installation, uninstallation, repair, and reinstallation processes within the Datto RMM environment. It includes necessary dependencies, implementation steps, usage instructions, and expected output for successful job execution.'
tags: ['datto', 'installation', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This component is used to manage the Huntress EDR agent and includes options to Install, Uninstall, Repair, and Reinstall.

## Dependencies

- [Vendor PowerShell Script](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1)
- A Huntress account key is required for installation. The partner can refer to this [article](https://support.huntress.io/hc/en-us/articles/4404012734227-Using-Account-Keys-Organization-Keys-and-Agent-Tags).
- An organization key is required but is automatically populated from the Datto Agent Variable: CS_PROFILE_NAME (the name of the site where this device is located).

## Implementation

Export the component from ProVal's Datto RMM instance.  
**Name:** Huntress Managed EDR - [WIN] [PVAL]  
![Export Component](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_1.png)  
The export will download the necessary component (cpt) file.  
![Component Download](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_2.png)  
Import this component file into the partner's Datto RMM instance.  
![Import Component](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_3.png)  

Proval Plug & Play: This component requires no configuration once imported.

## Usage

The component will prompt for several variables during a job.  
![Job Prompt](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_4.png)  

**acctkey:** Enter your account secret key (from your Huntress portal's "download agent" section).  
This can be pre-filled for the partner by providing a default value for the variable within the component in the partner's RMM.  
![Account Key](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_5.png)  

- **reregister:** Force the agent to re-register (useful if previously deployed with the incorrect account key, orphaned agent, or performing a full repair).
- **reinstall:** Reinstall the agent (useful for a quick repair of an agent).
- **uninstall:** Uninstall the agent aggressively (useful for agents struggling to uninstall normally).
- **repair:** Checks the Huntress services and attempts repair.

## Output

A job status of Success is expected.  
![Job Status](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_6.png)  

**StdOut**  
![StdOut](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_7.png)  
![StdOut Log](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_8.png)  
StdOut may require you to scroll to view the complete log; you can alternatively download the txt.  
![Download Log](../../../static/img/EPM---Windows-Configuration---Component---Huntress-Managed-EDR---WIN-PVAL/image_9.png)  

**StdErr**  
StdErr is not expected.



