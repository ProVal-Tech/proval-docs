---
id: '728ba6ee-7886-4a56-98c6-40ca55dceeba'
title: 'Webroot - Uninstall'
title_meta: 'Webroot - Uninstall'
keywords: ['webroot', 'uninstall', 'endpoint', 'procedure', 'agent']
description: 'This document outlines the steps required to uninstall the Webroot application from endpoints using Kaseya VSA. It includes implementation details, required dependencies, and expected output logs for both successful and failed uninstallation attempts.'
tags: ['security', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the process for uninstalling the Webroot application on the endpoint.

## Implementation

1. Export the agent procedure from the ProVal VSA and import it into the partner VSA.  
   **Name:** Webroot - Uninstall  
   ![Webroot Uninstall](../../../static/img/Webroot---Uninstall/image_1.png)  

   ![Image](../../../static/img/Webroot---Uninstall/image_2.png)  

2. Proval Plug & Play Procedure: The agent procedure requires no configuration.

   ![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
   **Note:** Tamper Protection must be disabled. If the uninstall fails, removal in safe mode may be required.

## Dependencies

- Vendor Uninstaller ([Download](http://anywhere.webrootcloudav.com/zerol/wsasme.msi))

## Output

### Agent Procedure Log Entry

- **Success**  
  ![Success Log](../../../static/img/Webroot---Uninstall/image_3.png)  

- **Failure**  
  ![Failure Log](../../../static/img/Webroot---Uninstall/image_4.png)  



