---
id: '112efa12-e6aa-4086-b235-23b17193e1e0'
slug: /112efa12-e6aa-4086-b235-23b17193e1e0
title: 'Senteon - Install'
title_meta: 'Senteon - Install'
keywords: ['senteon', 'agent', 'install', 'endpoint', 'procedure']
description: 'This document outlines the procedure for downloading and installing the Senteon Agent on endpoints. It includes details on dependencies, implementation steps, and expected output upon successful installation.'
tags: ['installation', 'software']
draft: false
unlisted: false
---

## Summary

This document describes how to download and run the installer for the Senteon Agent on the endpoint. It also details how to update the custom field if the installation is successful.

## Dependencies

| Content | Type | Function |
|---------|------|----------|
| [cPVAL Senteon Installed](/docs/bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241) | Custom Field | This custom field is used to determine if the Senteon Agent is installed on the endpoint. |
| [Senteon_Org](/docs/547c90df-abff-46a8-9e02-aec45b265672) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the partner's organization. |
| [Senteon_Tenant](/docs/58ce658a-6821-4420-9685-5ed8c963c2b1) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the tenant the partner wishes to register the agent/endpoint to. |
| [Senteon_Reg_Code](/docs/2c7e719e-7654-47e6-9ff0-d5261ae67eb8) | Managed Variable | This managed variable is used to store the Senteon registration code of the tenant the partner wishes to register the agent/endpoint to. |

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](/docs/5cc5165d-4314-499b-9357-299f3b04f402)

## Implementation

Export the agent procedure from the ProVal VSA and import it into the partner VSA.  
**Name:** Senteon - Install  
![Image](../../../static/img/docs/112efa12-e6aa-4086-b235-23b17193e1e0/image_1.png)  
![Image](../../../static/img/docs/112efa12-e6aa-4086-b235-23b17193e1e0/image_2.png)  

**ProVal Plug & Play:** No agent procedure configuration is required. Ensure dependencies exist prior to usage.

## Output

### Agent Procedure Log Entry

**Successful Install**  
![Image](../../../static/img/docs/112efa12-e6aa-4086-b235-23b17193e1e0/image_3.png)  

**Existing Install**  
![Image](../../../static/img/docs/112efa12-e6aa-4086-b235-23b17193e1e0/image_4.png)  

