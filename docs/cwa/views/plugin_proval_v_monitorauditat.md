---
id: '7f064a98-679c-4e7c-a8da-499c269b551f'
title: 'Monitor Audit View Creation for AutoTask Plugins'
title_meta: 'Monitor Audit View Creation for AutoTask Plugins'
keywords: ['monitor', 'autotask', 'view', 'sql', 'audit']
description: 'This document provides a detailed SQL script to create a monitor audit view for clients utilizing AutoTask plugins. The script includes necessary joins and conditions to retrieve relevant monitoring information, ensuring effective management and oversight of monitoring activities.'
tags: ['audit', 'sql', 'monitoring', 'autotask', 'database']
draft: false
unlisted: false
---
## Dependencies

- AutoTask Plugin - Enabled and Setup

## Description

Creates a monitor audit view for clients with the AutoTask plugins.

**Notes**: If the script doesn't work, run the SELECT statement down and export from a RAWSQL monitor.

## SQL

```
CREATE VIEW `plugin_proval_v_monitorauditat` AS 
SELECT 
  `ga`.`AgentID` AS `AgentID`, 
  `ga`.`Name` AS `Monitor`, 
  `mg`.`FullName` AS `Group Path`, 
  'N/A' AS `Next Scan`, 
  'N/A' AS `Disabled`, 
  'Remote' AS `Monitor Type`, 
  `ga`.`AlertMessage` AS `AlertMessage`, 
  `alt`.`Name` AS `Alert Template`, 
  `alts`.`alertid` AS `AlertID`, 
  IF(
    (
      (1024 & `alts`.`alertaction`) = 1024
    ), 
    'True', 
    'False'
  ) AS `Alert Ticket Creation`, 
  IF(
    (
      (512 & `alts`.`alertaction`) = 512
    ), 
    IFNULL(
      (
        SELECT 
          `labtech`.`lt_scripts`.`ScriptName` 
        FROM 
          `labtech`.`lt_scripts` 
        WHERE 
          (
            `labtech`.`lt_scripts`.`ScriptId` = `alts`.`scriptid`
          )
      ), 
      'N/A'
    ), 
    'N/A'
  ) AS `Script Assigned`, 
  `cat`.`CategoryName` AS `CategoryName`, 
  IF(
    ISNULL(`sb`.`atQueueName`), 
    CONCAT(
      (
        SELECT 
          `labtech`.`plugin_at_queues`.`AtQueueName` 
        FROM 
          `labtech`.`plugin_at_queues` 
        WHERE 
          (
            `labtech`.`plugin_at_queues`.`ATQueueID` = (
              SELECT 
                `labtech`.`properties`.`value` 
              FROM 
                `labtech`.`properties` 
              WHERE 
                (
                  `labtech`.`properties`.`name` = 'plugin_at_dbqueue'
                )
            )
          )
      ), 
      '(Default)'
    ), 
    `sb`.`AtQueueName`
  ) AS `AT Queue` 
FROM 
  (
    (
      (
        (
          (
            (
              `labtech`.`groupagents` `ga` 
              JOIN `labtech`.`mastergroups` `mg` ON(
                (`mg`.`GroupID` = `ga`.`GroupID`)
              )
            ) 
            LEFT JOIN `labtech`.`alerttemplate` `alt` ON(
              (
                `alt`.`AlertActionID` = `ga`.`AlertAction`
              )
            )
          ) 
          LEFT JOIN (
            SELECT 
              `labtech`.`alerttemplates`.`AlertActionID` AS `alertactionid`, 
              `labtech`.`alerttemplates`.`AlertAction` AS `alertaction`, 
              `labtech`.`alerttemplates`.`AlertID` AS `alertid`, 
              `labtech`.`alerttemplates`.`ScriptID` AS `scriptid` 
            FROM 
              `labtech`.`alerttemplates` 
            WHERE 
              (
                `labtech`.`alerttemplates`.`AlertActionID` = 2
              ) 
            GROUP BY 
              `labtech`.`alerttemplates`.`AlertActionID`
          ) `alts` ON(
            (
              `alt`.`AlertActionID` = `alts`.`alertactionid`
            )
          )
        ) 
        LEFT JOIN `labtech`.`infocategory` `cat` ON(
          (
            `cat`.`ID` = `ga`.`TicketCategory`
          )
        )
      ) 
      LEFT JOIN `labtech`.`plugin_at_categorymapping` `map` ON(
        (`map`.`CategoryID` = `cat`.`ID`)
      )
    ) 
    LEFT JOIN `labtech`.`plugin_at_queues` `sb` ON(
      (
        `sb`.`AtQueueID` = `map`.`AtQueueID`
      )
    )
  ) 
UNION ALL 
SELECT 
  `a`.`AgentID` AS `AgentID`, 
  `a`.`Name` AS `Monitor`, 
  `mgs`.`FullName` AS `Group Path`, 
  `a`.`LastScan` AS `Next Scan`, 
  IF(
    (
      TIMESTAMPDIFF(SECOND, `a`.`LastScan`, NOW()) < -(
        (`a`.`interval` * 4)
      )
    ), 
    'Yes', 
    'No'
  ) AS `Disabled`, 
  'Internal' AS `Monitor Type`, 
  `a`.`AlertMessage` AS `AlertMessage`, 
  `alt`.`Name` AS `Alert Template`, 
  `alts`.`alertid` AS `AlertID`, 
  IF(
    (
      (1024 & `alts`.`alertaction`) = 1024
    ), 
    'True', 
    'False'
  ) AS `Alert Ticket Creation`, 
  IF(
    (
      (512 & `alts`.`alertaction`) = 512
    ), 
    IFNULL(
      (
        SELECT 
          `labtech`.`lt_scripts`.`ScriptName` 
        FROM 
          `labtech`.`lt_scripts` 
        WHERE 
          (
            `labtech`.`lt_scripts`.`ScriptId` = `alts`.`scriptid`
          )
      ), 
      'N/A'
    ), 
    'N/A'
  ) AS `Script Assigned`, 
  `cat`.`CategoryName` AS `CategoryName`, 
  IF(
    ISNULL(`sb`.`ATQueueName`), 
    CONCAT(
      (
        SELECT 
          `labtech`.plugin_at_queues.`AtQueueName` 
        FROM 
          `labtech`.`plugin_at_queues` 
        WHERE 
          (
            `labtech`.`plugin_at_queues`.`ATQueueID` = (
              SELECT 
                `labtech`.`properties`.`value` 
              FROM 
                `labtech`.`properties` 
              WHERE 
                (
                  `labtech`.`properties`.`name` = 'plugin_at_dbqueue'
                )
            )
          )
      ), 
      '(Default)'
    ), 
    `sb`.`ATQueueName`
  ) AS `At Queue` 
FROM 
  (
    (
      (
        (
          (
            (
              (
                `labtech`.`agents` `a` 
                JOIN `labtech`.`groupdagents` `gda` ON(
                  (`gda`.`AgentID` = `a`.`AgentID`)
                )
              ) 
              LEFT JOIN `labtech`.`mastergroups` `mgs` ON(
                (
                  `mgs`.`GroupID` = `gda`.`GroupID`
                )
              )
            ) 
            LEFT JOIN `labtech`.`alerttemplate` `alt` ON(
              (
                `alt`.`AlertActionID` = `gda`.`AlertAction`
              )
            )
          ) 
          LEFT JOIN (
            SELECT 
              `labtech`.`alerttemplates`.`AlertActionID` AS `alertactionid`, 
              `labtech`.`alerttemplates`.`AlertAction` AS `alertaction`, 
              `labtech`.`alerttemplates`.`AlertID` AS `alertid`, 
              `labtech`.`alerttemplates`.`ScriptID` AS `scriptid` 
            FROM 
              `labtech`.`alerttemplates` 
            WHERE 
              (
                `labtech`.`alerttemplates`.`AlertActionID` = 2
              ) 
            GROUP BY 
              `labtech`.`alerttemplates`.`AlertActionID`
          ) `alts` ON(
            (
              `alt`.`AlertActionID` = `alts`.`alertactionid`
            )
          )
        ) 
        LEFT JOIN `labtech`.`infocategory` `cat` ON(
          (
            `cat`.`ID` = `gda`.`TicketCategory`
          )
        )
      ) 
      LEFT JOIN `labtech`.`plugin_at_categorymapping` `map` ON(
        (`map`.`CategoryID` = `cat`.`ID`)
      )
    ) 
    LEFT JOIN `labtech`.`plugin_at_queues` `sb` ON(
      (
        `sb`.`ATQueueID` = `map`.`ATQueueID`
      )
    )
  ) 
UNION ALL 
SELECT 
  `a`.`AgentID` AS `AgentID`, 
  `a`.`Name` AS `Monitor`, 
  'Global' AS `Group Path`, 
  `a`.`LastScan` AS `Next Scan`, 
  IF(
    (
      TIMESTAMPDIFF(SECOND, `a`.`LastScan`, NOW()) < -(
        (`a`.`interval` * 4)
      )
    ), 
    'Yes', 
    'No'
  ) AS `Disabled`, 
  'Global' AS `Monitor Type`, 
  `a`.`AlertMessage` AS `AlertMessage`, 
  IF(
    ISNULL(`alt`.`Name`), 
    'Not Set', 
    `alt`.`Name`
  ) AS `Alert Template`, 
  `alts`.`alertid` AS `AlertID`, 
  IF(
    (
      (1024 & `alts`.`alertaction`) = 1024
    ), 
    'True', 
    'False'
  ) AS `Alert Ticket Creation`, 
  IF(
    (
      (512 & `alts`.`alertaction`) = 512
    ), 
    IFNULL(
      (
        SELECT 
          `labtech`.`lt_scripts`.`ScriptName` 
        FROM 
          `labtech`.`lt_scripts` 
        WHERE 
          (
            `labtech`.`lt_scripts`.`ScriptId` = `alts`.`scriptid`
          )
      ), 
      'N/A'
    ), 
    'N/A'
  ) AS `Script Assigned`, 
  IF(
    ISNULL(`cat`.`CategoryName`), 
    'Not Set', 
    `cat`.`CategoryName`
  ) AS `CategoryName`, 
  IF(
    ISNULL(`sb`.`ATQueueName`), 
    CONCAT(
      (
        SELECT 
          `labtech`.`plugin_at_queues`.`AtQueueName` 
        FROM 
          `labtech`.`plugin_at_queues` 
        WHERE 
          (
            `labtech`.`plugin_at_queues`.`ATQueueID` = (
              SELECT 
                `labtech`.`properties`.`value` 
              FROM 
                `labtech`.`properties` 
              WHERE 
                (
                  `labtech`.`properties`.`name` = 'plugin_at_dbqueue'
                )
            )
          )
      ), 
      '(Default)'
    ), 
    `sb`.`ATQueueName`
  ) AS `AT Queue` 
FROM 
  (
    (
      (
        (
          (
            `labtech`.`agents` `a` 
            LEFT JOIN `labtech`.`alerttemplate` `alt` ON(
              (
                `alt`.`AlertActionID` = `a`.`AlertAction`
              )
            )
          ) 
          LEFT JOIN (
            SELECT 
              `labtech`.`alerttemplates`.`AlertActionID` AS `alertactionid`, 
              `labtech`.`alerttemplates`.`AlertAction` AS `alertaction`, 
              `labtech`.`alerttemplates`.`AlertID` AS `alertid`, 
              `labtech`.`alerttemplates`.`ScriptID` AS `scriptid` 
            FROM 
              `labtech`.`alerttemplates` 
            WHERE 
              (
                `labtech`.`alerttemplates`.`AlertActionID` = 2
              ) 
            GROUP BY 
              `labtech`.`alerttemplates`.`AlertActionID`
          ) `alts` ON(
            (
              `alt`.`AlertActionID` = `alts`.`alertactionid`
            )
          )
        ) 
        LEFT JOIN `labtech`.`infocategory` `cat` ON(
          (
            `cat`.`ID` = `a`.`TicketCategory`
          )
        )
      ) 
      LEFT JOIN `labtech`.`plugin_at_categorymapping` `map` ON(
        (`map`.`CategoryID` = `cat`.`ID`)
      )
    ) 
    LEFT JOIN `labtech`.`plugin_at_queues` `sb` ON(
      (
        `sb`.`ATQueueID` = `map`.`ATQueueID`
      )
    )
  ) 
WHERE 
  (
    (
      (`a`.`DriveID` = '') 
      OR (`a`.`DriveID` = '0')
    ) 
    AND (`a`.`ComputerID` < 1)
  )
```






