---
id: '8f74652a-f8c3-4321-8fba-76921048c280'
title: 'Webroot Stale Agents Detection'
title_meta: 'Webroot Stale Agents Detection'
keywords: ['webroot', 'agents', 'monitor', 'detection', 'ticketing']
description: 'This document outlines the process for detecting machines that are active in ConnectWise Automate but are not checking in with the Webroot portal for a specified number of days. It includes setup instructions, dependencies, and ticketing templates for alerting purposes.'
tags: ['monitoring', 'alert', 'ticket', 'plugin', 'global']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to detect the machines that are active in Automate but are not checking in with the Webroot portal for **X** number of days.  
**X** should be defined in the **Webroot SecureAnywhere with Unity** Plugin's settings.  
![Image](../../../static/img/Stale-Agents/image_1.png)  

Preferred Alert template: △ Custom - Ticket Creation - Computer

## Dependencies

**Webroot SecureAnywhere with Unity Plugin**  
![Image](../../../static/img/Stale-Agents/image_2.png)  

## Target

Global

## Ticketing

**Subject:**  
```
Webroot - Stale Agents detected on %COMPUTERNAME%
```

**Message on Failure:**  
```
A stale webroot agent has been detected on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%. A webroot stale agent means that although the machine is online and functioning, it is not reporting into the webroot console like it is expected. 

Last Seen by Webroot: %FIELDNAME%
Last Seen by Automate: %RESULT%
```

**Message on Success:**  
```
The computer %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% has cleared the webroot stale agent detection monitor. This either means the machine has been offline for 7+ days or the problem is completely resolved. Closing ticket.
```






