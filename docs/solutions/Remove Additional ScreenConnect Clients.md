---
id: 'cwa-remove-additional-screenconnect-clients'
title: 'Remove Additional ScreenConnect Clients'
title_meta: 'Remove Additional ScreenConnect Clients'
keywords: ['screenconnect', 'clients', 'remove', 'windows', 'solution']
description: 'This document outlines the procedure for removing unwanted ScreenConnect clients from Windows machines, including associated scripts, monitors, and SQL queries for auditing purposes.'
tags: ['configuration', 'software', 'windows', 'alert', 'monitor', 'sql']
draft: false
unlisted: false
---
## Purpose

The objective of this solution is to remove any additional and unwanted ScreenConnect clients from Windows computers.

## Associated Content

| Content                                                                                             | Type          | Function                                                             |
|-----------------------------------------------------------------------------------------------------|---------------|----------------------------------------------------------------------|
| [Script - Remove - All But My - ScreenConnect Client Installations](https://proval.itglue.com/DOC-5078775-14767921) | Script        | Remove Additional ScreenConnect installations from the machines.     |
| [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649) | Internal Monitor | Detects the computers with Additional ScreenConnect clients; where Auto-Removal is enabled. |
| △ Custom - Remove Additional ScreenConnect Clients                                                   | Alert Template | Executes the Script against the computers detected by the internal monitor. |

## Implementation

1. **Import the following content from the `ProSync` plugin:**
   - Script: [Script - Remove - All But My - ScreenConnect Client Installations](https://proval.itglue.com/DOC-5078775-14767921)
   - Internal Monitor: [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649)
   - Alert Template: △ Custom - Remove Additional ScreenConnect Clients

2. **Reload the system cache.**  
   ![Reload Cache](5078775/docs/15274668/images/22176883)

3. **Configure the Extra Data Fields as explained in the [script's](https://proval.itglue.com/DOC-5078775-14767921) document.**  
   - Auto removal for a client can be enabled by flagging the Client-Level EDF `Remove Additional SC Clients`.
   - A location and computer can be excluded from the Auto-Removal by marking the location-level and computer-level EDF `Exclude - Additional SC Removal` respectively.

4. **Configure the solution as follows:**
   - [Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649)  
     - Configure with the alert template: `△ Custom - Remove Additional ScreenConnect Clients`
     - Right-click and Run Now to start the monitor.

#### Audit SQL

Below is some SQL that will grab all of the unique instance IDs of ScreenConnect found within Automate so partners can quickly assess what instance IDs may need to be excluded from this solution:

```sql
select software.name,count(software.computerid),group_concat(Distinct clients.name) as Clients 
from software
left join computers c on c.computerid=software.computerid
left join clients on clients.clientid=c.clientid
where software.name like '%screenconnect%' 
group by software.name
```

