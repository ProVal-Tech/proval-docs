---
id: 'd401a54a-5bff-4d37-8fdf-001220f73fb5'
slug: /d401a54a-5bff-4d37-8fdf-001220f73fb5
title: 'Office C2R set Channel'
title_meta: 'Office C2R set Channel'
keywords: ['microsoft', 'update', 'click2run', 'office', 'installation']
description: 'This document provides a detailed guide on how to set the Microsoft Update Channel for a Click2Run Office installation on an endpoint using an agent procedure that contains a PS1 and it will ask for the variable at the scritp run time. It includes a summary, example agent procedure logs, and expected output for successful execution.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Summary

This document provides a detailed guide on how to set the Microsoft Update Channel for a Click2Run Office installation on an endpoint using an agent procedure that contains a PS1 and it will ask for the variable at the script run time. 


## Dependencies

- PowerShell 5.0+
- [Custom Field - cPVAL Office Channel Status](/docs/880a8d01-fc10-4ea9-94d8-7b2bb87c01a5)
- [Solution - Microsoft365 Click-to-Run Solution](/docs/f8deaddc-02c1-492d-b9dc-381a653de0e5) 

## Process

This script will modify the registry to set the Update Channel for Microsoft 365 products to the value specified in the variable(*Beta Channel* OR *Current Channel* OR *Monthly Enterprise Channel* OR *Semi-Annual Enterprise Channel* and *None*). At the time of script execution on the VSA agent procedure, it will ask for the required channel settings and will check the current configured channel. It will then update the result into the custom field accordingly.


## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** `Office C2R set Channel`   
   ![Image](../../../static/img/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5/E.webp)    
   The export will download the necessary XML file.  
  
   
2. Import this XML file into the partner's VSA RMM instance.    
   ![Image](../../../static/img/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5/3.webp)  

3. Export the PS1 from the ProVal's Internal VSA  
   ![Image](../../../static/img/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5/51.webp)  

4. Mapped it into the script in the client environment  
   ![Image](../../../static/img/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5/52.webp)   

5. Execute the agent procedure in the partner's VSA RMM and put the channel details that you want to set:  
   ![Image](../../../static/img/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5/Execution.webp)  

6. After execution, the script validates the device’s channel status and updates the associated custom field accordingly.  

## Output

- Agent procedure log 