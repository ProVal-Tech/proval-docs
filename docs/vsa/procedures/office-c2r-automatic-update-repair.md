---
id: 'c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c'
slug: /c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c
title: 'Office C2R Automatic Update Repair'
title_meta: 'Office C2R Automatic Update Repair'
keywords: ['office', 'update', 'repair', 'automatic', 'click2run']
description: 'This document outlines the process to repair the Office Click2Run Automatic Update on an endpoint using the PS1, it ask for the repair type from the script executor like QuickRepair OR FullRepair. It includes example logs and details on the execution of the repair procedure.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Summary

This document outlines the process to repair the Office Click2Run Automatic Update on an endpoint using the PS1, it ask for the repair type from the script executor like QuickRepair OR FullRepair. It includes example logs and details on the execution of the repair procedure.

## Dependencies

PowerShell 5.0+
PS1

## Process

This document outlines the process to repair the Office Click2Run Automatic Update on an endpoint and when anyone will execute the script on the endpoints then it will ask about the type of repair(Quick or Fullrepair).
Please note it will close all the office package open on the endppoints.


## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** Office C2R Update Channel Status 
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/11.webp)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/12.webp)  
   
2. Import this XML file into the partner's VSA RMM instance.  
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/3.webp)  

3. Export the PS1 from the Proval Internal VSA
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/61.webp)

4. Mapped it into the script in the client environment
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/62.webp) 

5. Execute the agent procedure in the partne's VSA RMM and put the Repair type that you want to do:
   ![Image](../../../static/img/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c/13.webp)

## Output

Agent Procedure History Log