---
id: '112efa12-e6aa-4086-b235-23b17193e1e0'
title: 'Senteon Agent Installation Procedure'
title_meta: 'Senteon Agent Installation Procedure'
keywords: ['senteon', 'agent', 'install', 'endpoint', 'procedure']
description: 'This document outlines the procedure for downloading and installing the Senteon Agent on endpoints. It includes details on dependencies, implementation steps, and expected output upon successful installation.'
tags: ['installation', 'software', 'endpoint', 'senteon', 'configuration']
draft: false
unlisted: false
---
## Summary

Downloads and runs the installer for Senteon Agent on the endpoint. Updates the custom field if install is successful. 

## Dependencies

| Content | Type | Function |
|---------|------|----------|
| [cPVAL Senteon Installed](https://proval.itglue.com/DOC-5078775-16540467) | Custom Field | This custom field is used to determine if the Senteon Agent is installed on the endpoint or not. |
| [Senteon_Org](https://proval.itglue.com/DOC-5078775-16540933) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the partner's Organization. |
| [Senteon_Tenant](https://proval.itglue.com/DOC-5078775-16541049) | Managed Variable | This managed variable is used to store the Senteon ID/Name of the Tenant the partner wishes to register the agent/endpoint to. |
| [Senteon_Reg_Code](https://proval.itglue.com/DOC-5078775-16541285) | Managed Variable | This managed variable is used to store the Senteon registration code of the Tenant the partner wishes to register the agent/endpoint to. |

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](https://proval.itglue.com/DOC-5078775-16541168)

## Implementation

Export the agent procedure from the ProVal VSA, and import into the partner VSA.  
Name: Senteon - Install  
![Image](../../../static/img/Senteon---Install/image_1.png)  
![Image](../../../static/img/Senteon---Install/image_2.png)  

ProVal Plug & Play: No agent procedure configuration is required. Ensure dependencies exist prior to usage.  

## Output

Agent Procedure Log Entry  

Successful Install  
![Image](../../../static/img/Senteon---Install/image_3.png)  

Existing Install  
![Image](../../../static/img/Senteon---Install/image_4.png)  






