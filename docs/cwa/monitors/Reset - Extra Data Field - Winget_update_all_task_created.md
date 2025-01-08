---
id: 'cwa-launch-rawsql-monitor'
title: 'Launch RAWSQL Monitor'
title_meta: 'Launch RAWSQL Monitor'
keywords: ['rawsql', 'monitor', 'sql', 'client', 'environment', 'cache']
description: 'This document provides a step-by-step guide on launching a RAWSQL monitor, executing SQL queries for client and environment level changes, and reloading the system cache to ensure all changes are applied. It includes examples and images to assist users in the process.'
tags: ['monitor', 'sql', 'client', 'environment', 'cache', 'windows']
draft: false
unlisted: false
---
#### Launch RAWSQL Monitor

1. Launch a fresh RAWSQL monitor, wherein a RAWSQL monitor set is an internal monitor featuring the string `RAWSQL` in both the `Table to Check` and `Field to Check` fields.  
   ![Image](5078775/docs/14825940/images/21999468)

#### For Client Level Changes

2. Copy the provided SQL query and replace the `<Clientid(s)>` with the comma-separated list of clients to disable the user-level task.  

   ```sql
   REPLACE INTO extrafielddata 
   SELECT 
     c.computerid, 
     ( 
       SELECT 
         ID 
       FROM 
         extrafield 
       WHERE 
         `Name` = 'Winget_update_all_task_created' 
         AND Form = 1 
     ), 
     '0' 
   FROM 
     computers c 
   WHERE 
     c.os REGEXP 'Windows 1[01]' 
     AND c.clientid in (<strong>&lt;Clientid(s)&gt;</strong>); 
   CALL v_extradata(1, 'Computers'); 
   CALL v_extradatarefresh(1, 'Computers');
   ```

   **Example:**

   ```sql
   REPLACE INTO extrafielddata 
   SELECT 
     c.computerid, 
     ( 
       SELECT 
         ID 
       FROM 
         extrafield 
       WHERE 
         `Name` = 'Winget_update_all_task_created' 
         AND Form = 1 
     ), 
     '0' 
   FROM 
     computers c 
   WHERE 
     c.os REGEXP 'Windows 1[01]' 
     AND c.clientid in (2,3,4,45); 
   CALL v_extradata(1, 'Computers'); 
   CALL v_extradatarefresh(1, 'Computers');
   ```

   ![Image](5078775/docs/14825940/images/22089609)  
   ![Image](5078775/docs/14825940/images/22089615)

#### For Environment Level Changes

3. Run the provided SQL query using the RAWSQL monitor. Paste the query into the `Additional Condition` field and click the `Build and View Query` button to execute it.

   ```sql
   REPLACE INTO extrafielddata 
   SELECT 
     c.computerid, 
     ( 
       SELECT 
         ID 
       FROM 
         extrafield 
       WHERE 
         `Name` = 'Winget_update_all_task_created' 
         AND Form = 1 
     ), 
     '0' 
   FROM 
     computers c 
   WHERE 
     c.os REGEXP 'Windows 1[01]'; 
   CALL v_extradata(1, 'Computers'); 
   CALL v_extradatarefresh(1, 'Computers');
   ```

   ![Image](5078775/docs/14825940/images/21999401)  
   ![Image](5078775/docs/14825940/images/21999437)

#### Reload System Cache

4. Reload the system cache to ensure all changes are updated.  
   ![Image](5078775/docs/14825940/images/21999469)

