---
id: 'afca866d-b468-437d-8555-5928d2bed089'
slug: /afca866d-b468-437d-8555-5928d2bed089
title: 'Admin - Missing Patches Total'
title_meta: 'Admin - Missing Patches Total'
keywords: ['patches', 'count', 'approval', 'missing', 'report', 'connectwise']
description: 'This document provides a detailed overview of patch counts in ConnectWise Automate, including missing patches and those without approval. It includes SQL representation for generating the report and insights into the status of Microsoft patches across servers and workstations.'
tags: ['connectwise', 'report', 'software', 'windows']
draft: false
unlisted: true
---

## Summary

This document contains counts of missing patches and patches that have no approval across the entire Automate instance.

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Server Missing            | Count of Microsoft patches missing for the servers.                                         |
| PerServer                 | Percentage of patches missing per server.                                                   |
| Workstation Missing        | Count of Microsoft patches missing for the workstations.                                    |
| PerWorkstation            | Percentage of patches missing per workstation.                                              |
| Total Missing             | Count of the total Microsoft missing patches.                                              |
| TotalPerMachine           | Percentage of total patches missing on total agent count.                                   |
| Total Missing Unfiltered   | Count of the total patches missing in the environment.                                      |
| Total Approved            | Count of total approved patches in the environment.                                         |
| Total Not Set            | Count of total "Not Set" patches, which have not been actioned by any approval policies.    |

## SQL Representation

```sql
SELECT 
  server.`Server Missing` as `Server Missing`, 
  ROUND(
    server.`Server Missing` /(
      SELECT 
        COUNT(computerid) 
      FROM 
        computerpatchpolicies 
      WHERE 
        installpolicy IN(
          SELECT 
            id 
          FROM 
            installsoftwarepolicies 
          WHERE 
            updatemode IN(5, 6)
        ) 
        AND computerid IN(
          SELECT 
            computerid 
          FROM 
            computers 
          WHERE 
            OS LIKE '%server%'
        )
    ), 
    2
  ) as PerServer, 
  workstation.`Workstation Missing` as `Workstation Missing`, 
  ROUND(
    workstation.`Workstation Missing` /(
      SELECT 
        COUNT(computerid) 
      FROM 
        computerpatchpolicies 
      WHERE 
        installpolicy IN(
          SELECT 
            id 
          FROM 
            installsoftwarepolicies 
          WHERE 
            updatemode IN(5, 6)
        ) 
        AND computerid IN(
          SELECT 
            computerid 
          FROM 
            computers 
          WHERE 
            OS NOT LIKE '%server%'
        )
    ), 
    2
  ) as PerWorkstation, 
  total.`Total Missing` as `Total Missing`, 
  ROUND(
    Total.`Total Missing` /(
      SELECT 
        COUNT(computerid) 
      FROM 
        computerpatchpolicies 
      WHERE 
        installpolicy IN(
          SELECT 
            id 
          FROM 
            installsoftwarepolicies 
          WHERE 
            updatemode IN(5, 6)
        ) 
        AND computerid IN(
          SELECT 
            computerid 
          FROM 
            computers
        )
    ), 
    2
  ) as TotalPerMachine, 
  `Total Missing unfiltered`.`Total Missing Unfiltered` as `Total Missing Unfiltered`, 
  CountApproved.`Total Approved`, 
  CountNotSet.`Total Not Set` 
FROM 
  (
    (
      (
        (
          (
            SELECT 
              COUNT(*) AS `Server Missing` 
            FROM 
              hotfix 
            WHERE 
              approved = 2 
              AND installed = 0 
              AND OS LIKE '%server%' 
              AND hotfixid IN(
                SELECT 
                  hotfixid 
                FROM 
                  `hotfixdata` 
                WHERE 
                  manufacturer = 'Microsoft'
              ) 
              AND computerid IN(
                SELECT 
                  computerid 
                FROM 
                  computerpatchpolicies 
                WHERE 
                  installpolicy IN(
                    SELECT 
                      id 
                    FROM 
                      `installsoftwarepolicies` 
                    WHERE 
                      updatemode IN('5', '6')
                  )
              )
          ) AS `Server`
        ) 
        JOIN (
          SELECT 
            COUNT(*) AS `Workstation Missing` 
          FROM 
            hotfix 
          WHERE 
            approved = 2 
            AND installed = 0 
            AND OS NOT LIKE '%server%' 
            AND hotfixid IN(
              SELECT 
                hotfixid 
              FROM 
                `hotfixdata` 
              WHERE 
                manufacturer = 'Microsoft'
            ) 
            AND computerid IN(
              SELECT 
                computerid 
              FROM 
                computerpatchpolicies 
              WHERE 
                installpolicy IN(
                  SELECT 
                    id 
                  FROM 
                    `installsoftwarepolicies` 
                  WHERE 
                    updatemode IN('5', '6')
                )
            )
        ) AS `Workstation`
      ) 
      JOIN (
        SELECT 
          COUNT(*) AS `Total Missing` 
        FROM 
          hotfix 
        WHERE 
          approved = 2 
          AND installed = 0 
          AND hotfixid IN(
            SELECT 
              hotfixid 
            FROM 
              `hotfixdata` 
            WHERE 
              manufacturer = 'Microsoft'
          ) 
          AND computerid IN(
            SELECT 
              computerid 
            FROM 
              computerpatchpolicies 
            WHERE 
              installpolicy IN(
                SELECT 
                  id 
                FROM 
                  `installsoftwarepolicies` 
                WHERE 
                  updatemode IN('5', '6')
              )
          )
      ) AS `Total`
    ) 
    JOIN (
      SELECT 
        COUNT(*) AS `Total Missing Unfiltered` 
      FROM 
        hotfix 
      WHERE 
        approved = 2 
        AND installed = 0 
        AND hotfixid IN(
          SELECT 
            hotfixid 
          FROM 
            `hotfixdata` 
          WHERE 
            manufacturer = 'Microsoft'
        )
    ) AS `Total Missing Unfiltered`
  ) 
  JOIN (
    (
      SELECT 
        COUNT(*) AS `Total Approved` 
      FROM 
        (
          (
            `patchapprovalsettings` 
            JOIN `hotfixdata` ON (
              (
                (
                  `patchapprovalsettings`.`HotFixID` = `hotfixdata`.`LTProductKey`
                ) 
                AND (
                  `patchapprovalsettings`.`OS` = `hotfixdata`.`OS`
                )
              )
            )
          ) 
          JOIN `approvalpolicies` ON (
            (
              `patchapprovalsettings`.`ApprovalPolicyID` = `approvalpolicies`.`ID`
            )
          )
        ) 
      WHERE 
        (
          ApprovalPolicyID =(
            SELECT 
              id 
            FROM 
              approvalpolicies 
            WHERE 
              requiresapproval = 1
          )
        ) 
        AND (
          `hotfixdata`.`Manufacturer` IN ('Microsoft')
        )
    ) AS CountApproved
  ) 
  JOIN (
    SELECT 
      COUNT(*) AS `Total Not Set` 
    FROM 
      `hotfixdata` 
    WHERE 
      approvalpolicycount = 0
  ) AS CountNotSet
```