---
id: '37781bee-b7cd-448e-9d45-53e789a455b8'
slug: /37781bee-b7cd-448e-9d45-53e789a455b8
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
![Export Component](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_1.webp)  
The export will download the necessary component (cpt) file.  
![Component Download](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_2.webp)  
Import this component file into the partner's Datto RMM instance.  
![Import Component](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_3.webp)  

Proval Plug & Play: This component requires no configuration once imported.

## Usage

The component will prompt for several variables during a job.  
![Job Prompt](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_4.webp)  

**acctkey:** Enter your account secret key (from your Huntress portal's "download agent" section).  
This can be pre-filled for the partner by providing a default value for the variable within the component in the partner's RMM.  
![Account Key](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_5.webp)  

- **reregister:** Force the agent to re-register (useful if previously deployed with the incorrect account key, orphaned agent, or performing a full repair).
- **reinstall:** Reinstall the agent (useful for a quick repair of an agent).
- **uninstall:** Uninstall the agent aggressively (useful for agents struggling to uninstall normally).
- **repair:** Checks the Huntress services and attempts repair.

## Output

A job status of Success is expected.  
![Job Status](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_6.webp)  

**StdOut**  
![StdOut](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_7.webp)  
![StdOut Log](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_8.webp)  
StdOut may require you to scroll to view the complete log; you can alternatively download the txt.  
![Download Log](../../../static/img/docs/37781bee-b7cd-448e-9d45-53e789a455b8/image_9.webp)  

**StdErr**  
StdErr is not expected.