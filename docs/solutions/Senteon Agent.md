---
id: '5cc5165d-4314-499b-9357-299f3b04f402'
title: 'Senteon Agent'
title_meta: 'Senteon Agent'
keywords: ['senteon', 'agent', 'install', 'uninstall', 'endpoint']
description: 'This document outlines the process for installing and uninstalling the Senteon Agent application on endpoints, including the necessary dependencies and associated content for effective implementation.'
tags: ['installation', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Purpose

This document allows for the installation and uninstallation of the Senteon Agent application, as well as displaying the results in a custom field.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [cPVAL Senteon Installed](<../unsorted/SWM - Software Management - Custom Field - cPVAL Senteon Installed.md>) | Custom Field | This custom field is used to determine if the Senteon Agent is installed on the endpoint. |
| [Senteon_Org](<../vsa/variables/Senteon_Org.md>) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the partner's organization. |
| [Senteon_Tenant](<../vsa/variables/Senteon_Tenant.md>) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the tenant the partner wishes to register the agent/endpoint to. |
| [Senteon_Reg_Code](<../vsa/variables/Senteon_Reg_Code.md>) | Managed Variable | This managed variable is used to store the Senteon registration code of the tenant the partner wishes to register the agent/endpoint to. |
| [Senteon - Install](<../vsa/procedures/Senteon - Install.md>) | Agent Procedure | This agent procedure is used to install the Senteon Agent application on the endpoint. |
| [Senteon - Uninstall](<../vsa/procedures/Senteon - Uninstall.md>) | Agent Procedure | This agent procedure is used to uninstall the Senteon Agent application on the endpoint. |
| [Check Senteon Installed CF](<../vsa/procedures/Check Senteon Installed CF.md>) | Agent Procedure | This agent procedure is used to check for the presence of Senteon on the endpoint and update a custom field with the status. |

## Implementation

1. Create the following dependencies in the partner's VSA:  
   - [Custom Field - cPVAL Senteon Installed](<../unsorted/SWM - Software Management - Custom Field - cPVAL Senteon Installed.md>)  
   - [Managed Variable - Senteon_Org](<../vsa/variables/Senteon_Org.md>)  
   - [Managed Variable - Senteon_Tenant](<../vsa/variables/Senteon_Tenant.md>)  
   - [Managed Variable - Senteon_Reg_Code](<../vsa/variables/Senteon_Reg_Code.md>)  

2. Export the following content from ProVal's VSA, and follow the necessary implementation steps within each document:  
   - [Agent Procedure - Senteon - Install](<../vsa/procedures/Senteon - Install.md>)  
   - [Agent Procedure - Senteon - Uninstall](<../vsa/procedures/Senteon - Uninstall.md>)  
   - [Agent Procedure - Check Senteon Installed CF](<../vsa/procedures/Check Senteon Installed CF.md>)  



