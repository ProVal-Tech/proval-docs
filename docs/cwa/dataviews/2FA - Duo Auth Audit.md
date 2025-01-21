---
id: '81b5f220-8cfc-4a52-bbf2-e6606eebf822'
title: 'Duo Multifactor Authentication Overview for Automate Agents'
title_meta: 'Duo Multifactor Authentication Overview for Automate Agents'
keywords: ['duo', 'mfa', 'authentication', 'automate', 'agents']
description: 'This document provides an overview of agents configured with Duo Multifactor Authentication within the ConnectWise Automate environment. It details the necessary dependencies, describes the relevant data columns, and includes the SQL representation for querying this information.'
tags: ['database', 'report', 'security']
draft: false
unlisted: false
---

## Summary

This dataview provides an overview of the agents configured with Duo Multifactor Authentication. This data is specifically related to the Duo plugin for Automate. Please note that this audit will not work for any SSO accounts.

## Dependencies

The DUO Plugin must be installed and configured.

## Columns

| Column              | Description                                                                                       |
|---------------------|---------------------------------------------------------------------------------------------------|
| Username            | The username of the Automate user                                                                |
| Duo Auth Enabled    | A Yes/No column indicating whether the Automate user account is using Duo MFA.                   |
| Userid             | User ID of the users.                                                                             |

## SQL Representation

```sql
SELECT 
  t.userid, 
  t.username, 
  t.`DUO Auth Enabled` 
FROM 
  ( 
    SELECT 
      users.userid AS `userid`, 
      users.name AS `UserName`, 
      CASE 
        WHEN ( 
          SELECT 
            value 
          FROM 
            plugin_duo_settings 
          WHERE 
            settingname = 'duoenabledcc' 
        ) = 'false' THEN 'false' 
        WHEN ( 
          SELECT 
            value 
          FROM 
            plugin_duo_settings 
          WHERE 
            settingname = 'duotoggleallusers' 
        ) = '1' THEN 'true' 
        WHEN FIND_IN_SET( 
          CONVERT(users.`userid`, CHAR), 
          ( 
            SELECT 
              value 
            FROM 
              plugin_duo_settings 
            WHERE 
              settingname = 'duouserlist' 
          ) 
        ) > 0 THEN 'true' 
        ELSE 'false' 
      END AS `Duo Auth Enabled` 
    FROM 
      Users 
    WHERE 
      users.Name <> 'root' 
      AND users.userid > 0 
  ) t
```
