---
id: 'f04b8cf8-4dd2-4d7e-b9ea-5971d2168ffe'
title: 'Manage Network Adapter Protocols'
title_meta: 'Manage Network Adapter Protocols'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'This solution manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP'
tags: ['DHCP', 'windows','networking']
draft: False
unlisted: false
---

## Purpose
This solution manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP.

## Associated Content
| Content                                                                                                               | Type           | Function                                           |
|-----------------------------------------------------------------------------------------------------------------------|----------------|----------------------------------------------------|
| [Manage-NetworkAdapterProtocols](<../cwa//scripts/Manage-NetworkAdapterProtocols.md>)                                      | Script         | Manages Network Adpater Protocols                  |
| [ProVal - Production - Manage Network Adapters](<../cwa/monitors/Manage-Network-Adapters.md>) | Internal Monitor | Detects machines selected for Network Adapters Protocol Solution      |
| `△ Custom - Execute Script - Manage-NetworkAdapterProtocols`                                                                    | Alert Template | Execute the script [Manage-NetworkAdapterProtocols](<../cwa//scripts/Manage-NetworkAdapterProtocols.md>) against the machines detected by the internal monitor. |



## Implementation
1. Import the following content using the ProSync Plugin:
   - [Manage-NetworkAdapterProtocols](<../cwa//scripts/Manage-NetworkAdapterProtocols.md>)   
   - [ProVal - Production - Manage Network Adapters](<../cwa/monitors/Manage-Network-Adapters.md>) 
   -  `△ Custom - Execute Script - Manage-NetworkAdapterProtocols` 

2. Reload the system cache:  
 ![Image](../../static/img/Get-Autopilot-Hash/image_1.png)

3. Run the [Manage-NetworkAdapterProtocols](<../cwa//scripts/Manage-NetworkAdapterProtocols.md>) against any machine with the Set_Environment parameter set to '1':  
![Image](../../static/img/Manage-NetworkProtocol/image1.png)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [ProVal - Production - Manage Network Adapters](<../cwa/monitors/Manage-Network-Adapters.md>) 
       - `△ Custom - Execute Script - Manage-NetworkAdapterProtocols` 
       - Right-click and Run Now to start the monitor.




