---
id: '15acbab3-e89e-4cac-8b1a-8f863911ac99'
slug: /15acbab3-e89e-4cac-8b1a-8f863911ac99
title: 'Dot NET 7 Desktop Runtime Uninstallation'
title_meta: 'Dot NET 7 Desktop Runtime Uninstallation'
keywords: ['dotnet', 'runtime', 'uninstallation', 'agent', 'procedure']
description: 'This document outlines the procedure for uninstalling the Dot NET 7 Desktop Runtime application from endpoints, including detailed logs and steps for verification of successful uninstallation.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to uninstall the Dot NET 7 Desktop Runtime application from the endpoint.

#### Example Agent Procedure Log

```
5:49:43 am 25-Nov-24   Dot NET 7 Desktop Runtime Uninstallation   Success THEN   kunal.kumar  
5:49:43 am 25-Nov-24   Dot NET 7 Desktop Runtime Uninstallation-0002   Windows Desktop Runtime 7 is successfully uninstalled from the machine   kunal.kumar  
5:49:43 am 25-Nov-24   Dot NET 7 Desktop Runtime Uninstallation-0001       kunal.kumar  
5:49:43 am 25-Nov-24   Execute Powershell Command   Success THEN   kunal.kumar  
5:49:43 am 25-Nov-24   Execute Powershell Command-0012   Results returned to global variable #global:psresult# and saved in Documents tab of server.   kunal.kumar  
```

## Process

| Date/Time           | Procedure                                     | Status          | User         |
|---------------------|-----------------------------------------------|-----------------|--------------|
| 11/25/2024 5:49     | Dot NET 7 Desktop Runtime Uninstallation      | Success THEN    | kunal.kumar  |
| 11/25/2024 5:49     | Dot NET 7 Desktop Runtime Uninstallation-0002 | Windows Desktop Runtime 7 is successfully uninstalled from the machine | kunal.kumar  |
| 11/25/2024 5:49     | Dot NET 7 Desktop Runtime Uninstallation-0001 |                 | kunal.kumar  |
| 11/25/2024 5:49     | Execute Powershell Command                    | Success THEN    | kunal.kumar  |
| 11/25/2024 5:49     | Execute Powershell Command-0012               | Results returned to global variable #global:psresult# and saved in Documents tab of server. | kunal.kumar  |

1. Define the variables in the agent procedure.
2. Map the PS1 with the agent procedure.
3. Run the agent procedure.
4. Verify with agent logs if the software was successfully uninstalled.

## Output

Agent Procedure Log

## Export Attachment

Attach the XML VSA Export content to this document.