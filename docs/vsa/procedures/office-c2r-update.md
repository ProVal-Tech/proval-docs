---
id: 'ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8'
slug: /ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8
title: 'Office C2R Update'
title_meta: 'Office C2R Update'
keywords: ['update', 'office', 'click2run', 'installation']
description: 'This document provides a detailed procedure for performing an on-demand update for Click2Run Office installations on endpoints using an agent procedure. It includes example logs, dependencies, and output details to assist in the execution and troubleshooting of the update process.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Summary

This agent procedure is for performing an on-demand update for Click2Run Office installations on endpoints using an agent procedure. It includes example logs, dependencies, and output details to assist in the execution and troubleshooting of the update process.

**Please note it will close all office packages open on the endpoints while performing an update.**

## Dependencies

- PowerShell 5.0+
- [Solution - Microsoft365 Click-to-Run Solution](/docs/f8deaddc-02c1-492d-b9dc-381a653de0e5) 

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** `Office C2R Update`   
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/21.webp)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/22.webp)  
   
2. Import this XML file into the partner's VSA RMM instance.   
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/3.webp)  

3. Export the PS1 from the ProVal Internal VSA   
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/91.webp)  

4. Map it into the script in the client's environment  
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/92.webp) 

5. Execute the agent procedure in the partner's VSA RMM:  
   ![Image](../../../static/img/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8/23.webp)

## Output

- Agent Procedure log