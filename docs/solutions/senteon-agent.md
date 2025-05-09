---
id: '5cc5165d-4314-499b-9357-299f3b04f402'
slug: /5cc5165d-4314-499b-9357-299f3b04f402
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
| [cPVAL Senteon Installed](/docs/bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241) | Custom Field | This custom field is used to determine if the Senteon Agent is installed on the endpoint. |
| [Senteon_Org](/docs/547c90df-abff-46a8-9e02-aec45b265672) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the partner's organization. |
| [Senteon_Tenant](/docs/58ce658a-6821-4420-9685-5ed8c963c2b1) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the tenant the partner wishes to register the agent/endpoint to. |
| [Senteon_Reg_Code](/docs/2c7e719e-7654-47e6-9ff0-d5261ae67eb8) | Managed Variable | This managed variable is used to store the Senteon registration code of the tenant the partner wishes to register the agent/endpoint to. |
| [Senteon - Install](/docs/112efa12-e6aa-4086-b235-23b17193e1e0) | Agent Procedure | This agent procedure is used to install the Senteon Agent application on the endpoint. |
| [Senteon - Uninstall](/docs/2603fc00-ac56-4466-b220-f2484ceef424) | Agent Procedure | This agent procedure is used to uninstall the Senteon Agent application on the endpoint. |
| [Check Senteon Installed CF](/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8) | Agent Procedure | This agent procedure is used to check for the presence of Senteon on the endpoint and update a custom field with the status. |

## Implementation

1. Create the following dependencies in the partner's VSA:  
   - [Custom Field - cPVAL Senteon Installed](/docs/bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241)  
   - [Managed Variable - Senteon_Org](/docs/547c90df-abff-46a8-9e02-aec45b265672)  
   - [Managed Variable - Senteon_Tenant](/docs/58ce658a-6821-4420-9685-5ed8c963c2b1)  
   - [Managed Variable - Senteon_Reg_Code](/docs/2c7e719e-7654-47e6-9ff0-d5261ae67eb8)  

2. Export the following content from ProVal's VSA, and follow the necessary implementation steps within each document:  
   - [Agent Procedure - Senteon - Install](/docs/112efa12-e6aa-4086-b235-23b17193e1e0)  
   - [Agent Procedure - Senteon - Uninstall](/docs/2603fc00-ac56-4466-b220-f2484ceef424)  
   - [Agent Procedure - Check Senteon Installed CF](/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8)  