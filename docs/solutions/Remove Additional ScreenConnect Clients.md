---
id: '237065e9-8db3-4932-9ba8-1588cc6a7d3c'
title: 'Remove Additional ScreenConnect Clients'
title_meta: 'Remove Additional ScreenConnect Clients'
keywords: ['screenconnect', 'clients', 'remove', 'windows', 'solution']
description: 'This document outlines the procedure for removing unwanted ScreenConnect clients from Windows machines, including associated scripts, monitors, and SQL queries for auditing purposes.'
tags: ['software', 'sql', 'windows']
draft: false
unlisted: false
---

## Purpose

The objective of this solution is to remove any additional and unwanted ScreenConnect clients from Windows computers.

## Associated Content

| Content                                                                                             | Type            | Function                                                             |
|-----------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------|
| [Script - Remove - All But My - ScreenConnect Client Installations](<../cwa/scripts/Remove - All But My - ScreenConnect Client Installations.md>) | Script          | Remove additional ScreenConnect installations from the machines.     |
| [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649) | Internal Monitor | Detects the computers with additional ScreenConnect clients where Auto-Removal is enabled. |
| △ Custom - Remove Additional ScreenConnect Clients                                                   | Alert Template   | Executes the script against the computers detected by the internal monitor. |

## Implementation

1. **Import the following content from the `ProSync` plugin:**
   - Script: [Script - Remove - All But My - ScreenConnect Client Installations](<../cwa/scripts/Remove - All But My - ScreenConnect Client Installations.md>)
   - Internal Monitor: [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649)
   - Alert Template: △ Custom - Remove Additional ScreenConnect Clients

2. **Reload the system cache.**  
   ![Reload Cache](../../static/img/Remove-Additional-ScreenConnect-Clients/image_1.png)

3. **Configure the Extra Data Fields as explained in the [script's](<../cwa/scripts/Remove - All But My - ScreenConnect Client Installations.md>) document.**  
   - Auto removal for a client can be enabled by flagging the Client-Level EDF `Remove Additional SC Clients`.
   - A location and computer can be excluded from the Auto-Removal by marking the location-level and computer-level EDF `Exclude - Additional SC Removal`, respectively.

4. **Configure the solution as follows:**
   - [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649)  
     - Configure with the alert template: `△ Custom - Remove Additional ScreenConnect Clients`
     - Right-click and Run Now to start the monitor.

#### Audit SQL

Below is some SQL that will grab all of the unique instance IDs of ScreenConnect found within Automate, so partners can quickly assess what instance IDs may need to be excluded from this solution:

```sql
SELECT software.name, COUNT(software.computerid), GROUP_CONCAT(DISTINCT clients.name) AS Clients 
FROM software
LEFT JOIN computers c ON c.computerid = software.computerid
LEFT JOIN clients ON clients.clientid = c.clientid
WHERE software.name LIKE '%screenconnect%' 
GROUP BY software.name
```

