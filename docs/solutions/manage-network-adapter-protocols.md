---
id: 'f04b8cf8-4dd2-4d7e-b9ea-5971d2168ffe'
slug: /f04b8cf8-4dd2-4d7e-b9ea-5971d2168ffe
title: 'Manage Network Adapter Protocols'
title_meta: 'Manage Network Adapter Protocols'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'This solution manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP'
tags: ['windows','networking']
draft: False
unlisted: false
---

## Purpose
This solution manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP.

## Associated Content
| Content                                                      | Type             | Function                                                                                                          |
| ------------------------------------------------------------ | ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| Manage-NetworkAdapterProtocols                      | Script           | Manages Network Adpater Protocols                                                                                 |
| ProVal - Production - Manage Network Adapters       | Internal Monitor | Detects machines selected for Network Adapters Protocol Solution                                                  |
| `△ Custom - Execute Script - Manage-NetworkAdapterProtocols` | Alert Template   | Execute the script Manage-NetworkAdapterProtocols against the machines detected by the internal monitor. |



## Implementation
1. Import the following content using the ProSync Plugin:
   - Manage-NetworkAdapterProtocols  
   - ProVal - Production - Manage Network Adapters
   -  `△ Custom - Execute Script - Manage-NetworkAdapterProtocols` 

2. Reload the system cache:  
 ![Image](../../static/img/docs/0af1bff2-a32a-442b-9322-a8a260d150ff/image_1.png)

1. Run the Manage-NetworkAdapterProtocols against any machine with the Set_Environment parameter set to '1':  
![Image](../../static/img/docs/c5d35def-c815-4d69-b015-9b083ec05edd/image1.png)

1. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - ProVal - Production - Manage Network Adapters
       - `△ Custom - Execute Script - Manage-NetworkAdapterProtocols` 
       - Right-click and Run Now to start the monitor.


