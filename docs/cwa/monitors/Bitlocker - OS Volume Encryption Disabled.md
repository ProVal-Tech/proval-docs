---
id: 'cwa-bitlocker-monitoring-check'
title: 'Bitlocker Monitoring Check for Target Machines'
title_meta: 'Bitlocker Monitoring Check for Target Machines'
keywords: ['bitlocker', 'monitoring', 'encryption', 'security', 'compliance']
description: 'This document outlines a monitoring solution for identifying target machines with specific Bitlocker settings, ensuring that only compliant machines are flagged for further action. It includes SQL queries and dependencies for effective implementation.'
tags: ['encryption', 'security', 'compliance', 'database', 'report']
draft: false
unlisted: false
---
## Summary

This monitor will return any target machine whose client has the 'Bitlocker Monitoring' EDF checked, and the target's 'Bitlocker Monitoring Exclusion' is not checked, and its 'C' drive is listed as a mount point in 'plugin_proval_bitlocker_audit' and the drive's encryption method is 'NONE'.

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](https://proval.itglue.com/DOC-5078775-8943520)
- [SEC - Encryption - Solution - Bitlocker](https://proval.itglue.com/DOC-5078775-8953721)

## Target

Please follow the recommended target for the bitlocker solution.

## Translated SQL

```
SELECT IFNULL(IFNULL(edfAssigned1.Value, edfDefault1.value), '0') AS TestValue,
    computers.NAME AS IdentityField,
    computers.computerid,
    clients.NAME AS `Client Name`,
    computers.domain AS `Computer Domain`,
    computers.username AS `Computer User`,
    IFNULL(IFNULL(edfAssigned2.Value, edfDefault2.value), '0') AS `Computer - Extra Data Field - Security Compliance - Bitlocker Monitoring Exclusion`,
    a.noalerts,
    a.uptimestart,
    a.uptimeend,
    computers.DateAdded
FROM Computers
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId = inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId = Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId = Locations.LocationID)
LEFT JOIN plugin_proval_bitlocker_audit ppba ON computers.ComputerID = ppba.ComputerID
LEFT JOIN agentcomputerdata a ON computers.computerid = a.computerid
LEFT JOIN ExtraFieldData edfAssigned1 ON (
        edfAssigned1.id = Clients.ClientId
        AND edfAssigned1.ExtraFieldId = (
            SELECT ExtraField.id
            FROM ExtraField
            WHERE LTGuid = '1e005883-98be-4325-b374-e0538a744efa'
            )
        )
LEFT JOIN ExtraFieldData edfDefault1 ON (
        edfDefault1.id = 0
        AND edfDefault1.ExtraFieldId = (
            SELECT ExtraField.id
            FROM ExtraField
            WHERE LTGuid = '1e005883-98be-4325-b374-e0538a744efa'
            )
        )
LEFT JOIN ExtraFieldData edfAssigned2 ON (
        edfAssigned2.id = Computers.ComputerId
        AND edfAssigned2.ExtraFieldId = (
            SELECT ExtraField.id
            FROM ExtraField
            WHERE LTGuid = '45a37cb2-d1d0-44eb-b359-22630a61a2c2'
            )
        )
LEFT JOIN ExtraFieldData edfDefault2 ON (
        edfDefault2.id = 0
        AND edfDefault2.ExtraFieldId = (
            SELECT ExtraField.id
            FROM ExtraField
            WHERE LTGuid = '45a37cb2-d1d0-44eb-b359-22630a61a2c2'
            )
        )
WHERE (
        (
            (
                (IFNULL(IFNULL(edfAssigned1.Value, edfDefault1.value), '0') <> 0)
                AND (IFNULL(IFNULL(edfAssigned2.Value, edfDefault2.value), '0') = 0)
                )
            )
        )
    AND (
        (ppba.MountPoint = 'C:')
        AND (ppba.`EncryptionMethod` = 'NONE')
        ) AND (
              computers.DateAdded < DATE_SUB(NOW(), INTERVAL 7 DAY )
              )
```

## Ticketing

![Ticketing Image](..\..\..\static\img\Bitlocker---OS-Volume-Encryption-Disabled\image_1.png)


