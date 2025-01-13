---
id: 'cwa-duo-auth-overview'
title: 'Duo Multifactor Authentication Overview for Automate Agents'
title_meta: 'Duo Multifactor Authentication Overview for Automate Agents'
keywords: ['duo', 'mfa', 'authentication', 'automate', 'agents']
description: 'This document provides an overview of agents configured with Duo Multifactor Authentication within the ConnectWise Automate environment. It details the necessary dependencies, describes the relevant data columns, and includes the SQL representation for querying this information.'
tags: ['authentication', 'security', 'configuration', 'database', 'report']
draft: false
unlisted: false
---
## Summary

This dataview will provide an overview of the agents configured with Duo Multifactor Authentication. This data is specifically related to the Duo plugin for Automate. This audit will not work for any SSO accounts.

## Dependencies

DUO Plugin must be installed and configured.

## Columns

| Column              | Description                                                                                       |
|---------------------|---------------------------------------------------------------------------------------------------|
| Username            | The username of the Automate user                                                                |
| Duo Auth Enabled    | A Yes|No column indicating whether or not the Automate user account is using Duo MFA.             |
| Userid             | User id of the users.                                                                             |

## SQL Representation

```
SELECT 
  t.userid, 
  t.username, 
  t.`DUO Auth Enabled` 
from 
  ( 
    Select 
      users.userid as `userid`, 
      users.name as `UserName`, 
      case when ( 
        select 
          value 
        from 
          plugin_duo_settings 
        where 
          settingname = 'duoenabledcc' 
      ) = 'false' then 'false' when ( 
        select 
          value 
        from 
          plugin_duo_settings 
        where 
          settingname = 'duotoggleallusers' 
      )= '1' then 'true' when find_in_set( 
        convert(users.`userid`, char), 
        ( 
          select 
            value 
          from 
            plugin_duo_settings 
          where 
            settingname = 'duouserlist' 
        ) 
      ) > 0 then 'true' else 'false' end as `Duo Auth Enabled` 
    FROM 
      Users 
    WHERE 
      users.Name <> 'root' 
      and users.userid > 0 
  ) t
```


