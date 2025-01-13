---
id: 'rmm_drive_space_monitor'
title: 'Drive Space Monitoring for Endpoints'
title_meta: 'Drive Space Monitoring for Endpoints'
keywords: ['monitoring', 'drive', 'space', 'threshold', 'alert']
description: 'This document provides a comprehensive overview of a drive space monitoring solution designed for endpoints. It details the configured thresholds for alerts, dependencies, default values for disk space monitoring, and the SQL query used for monitoring drive space. The monitor is tailored for server environments and includes filtering for specific file systems and USB drives.'
tags: ['monitoring', 'disk', 'server', 'alert', 'configuration']
draft: true
unlisted: true
---
## Summary

This monitor reviews drive space on endpoints and will alert depending on the configured thresholds for the monitor.

Note: ProVal suggests reviewing the "Schedule" related to servers and how often they gather the Disk Inventory and Fragmentation scan. We recommend setting the "repeat every" value to < 4 hours for the Disk Inventory and Fragmentation Scan.

## Dependencies

System Properties: "proval_DiskThreshold16-100", "proval_DiskThreshold100-1024", "proval_DiskThreshold1024+"

NOTE: The monitor will insert these properties if they are missing.

Default Values:

| Name                       | Value                                                                                         |
|----------------------------|-----------------------------------------------------------------------------------------------|
| proval_DiskThreshold16-300 | 10 (This value indicates 10% remaining disk space for drives between 16GB and 300GB)       |
| proval_DiskThreshold300-1024 | 30720 (This value indicates 30GB remaining disk space for drives between 300GB and 1TB)   |
| proval_DiskThreshold16-1024+ | 51200 (This value indicates 50GB remaining disk space for drives larger than 1 TB)        |

## Target

This monitor is primarily designed for server drive space monitoring. It will work properly for drives on most systems.

The monitor filters out the following drive file systems: 'CDFS', 'UNKFS', 'DVDFS', 'FAT', 'FAT32', And 'NetFS'.

It also filters out drives where the SmartStatus is like USB, to attempt to filter out USB drives.

## Translated SQL

```
SELECT 
    drives.`Free` AS TestValue,
    drives.`size`,
    drives.letter AS IDentityField,
    c.computerid,
    c.Name AS ComputerName,
    CONVERT(CONCAT(clients.name,' ',locations.name) USING utf8) AS Location,
    a.noalerts, 
    a.uptimestart, 
    a.uptimeend
FROM drives
    JOIN computers c ON drives.ComputerID = c.ComputerID
    LEFT JOIN agentcomputerdata a ON c.computerid = a.computerid
    LEFT JOIN Locations ON Locations.LocationID = c.Locationid
    LEFT JOIN Clients ON Clients.ClientID = c.clientid
WHERE
    drives.`Free` < Drives.Size
    AND Drives.FileSystem NOT IN ('CDFS','UNKFS','DVDFS','FAT','FAT32','NetFS')
    AND Drives.missing = 0
    AND Drives.SmartStatus NOT LIKE '%usb%'
    AND (
        (
            (Drives.Size BETWEEN 16384 AND 307200)
            AND (Drives.free < (Drives.`Size` * ((SELECT VALUE FROM properties WHERE NAME = 'proval_DiskThreshold16-300') * 0.01)))
        )
        OR (
            (Drives.Size BETWEEN 307200 AND 1024000)
            AND (Drives.free < (SELECT VALUE FROM properties WHERE NAME = 'proval_DiskThreshold300-1024'))
        )
        OR (
            (Drives.Size > 1024000)
            AND (Drives.free < (SELECT VALUE FROM properties WHERE NAME = 'proval_DiskThreshold1024+'))
        )
    )
```



