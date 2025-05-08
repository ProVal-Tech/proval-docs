---
id: dcf0c0e1-7201-4008-a1ad-98fd0a80c138
slug: /dcf0c0e1-7201-4008-a1ad-98fd0a80c138
title: 'Plugin_ProVal_ClusterSharedVolume'
title_meta: 'Plugin_ProVal_ClusterSharedVolume'
keywords: ['cluster', 'volume', 'audit', 'dataview', 'script']
description: 'Describes a table used to store data collected by the Cluster Volume Disk Space Audit script, which is then used to populate a dataview for monitoring and reporting purposes.'
tags: ['cluster', 'windows']
draft: false
unlisted: false
---

## Purpose

To store the data grabbed by [CWM - Automate - script - Cluster Volume Disk Space Audit [DV]](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490) script in order to feed into the [CWM - Automate - Dataview - Cluster Volume Disk Space Audit [Script]](/docs/99dc53c5-ca74-4988-815a-0a1ad3fad8eb) dataview.

## Dependencies

- [CWM - Automate - script - Cluster Volume Disk Space Audit [DV]](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490)
- [CWM - Automate - Dataview - Cluster Volume Disk Space Audit [Script]](/docs/99dc53c5-ca74-4988-815a-0a1ad3fad8eb)
- [CWM - Automate - Solution - Cluster Shared Volume - Get Drive Space Information](/docs/957a288b-c81e-48a5-aa41-ed071e755fb5)

## Tables

### Plugin_ProVal_ClusterSharedVolume

| Column                 | Type        | Explanation                                                                                |
| ---------------------- | ----------- | ------------------------------------------------------------------------------------------ |
| SerialNumber           | int(10)     | An Auto Incremental Column to serve as a primary key for the table                         |
| Computerid             | int(10)     | Computerid                                                                                 |
| VolumeID               | varchar(30) | VolumeID                                                                                   |
| VolumeName             | varchar(50) | Volume Name                                                                                |
| OwnerNode              | varchar(50) | Computer Name of the Owner Host Server                                                     |
| State                  | varchar(10) | State (Up/Down)                                                                            |
| DriveLetter            | varchar(5)  | Drive Letter (if any)                                                                      |
| DriveLetterMask        | varchar(20) | Drive Letter Mask                                                                          |
| FileSystem             | varchar(20) | File System ([NTFS or ReFS](https://www.partitionwizard.com/clone-disk/refs-vs-ntfs.html)) |
| FreeSpaceGB            | varchar(15) | Free Space in GB                                                                           |
| HasDriveLetter         | varchar(10) | Has Drive Letter (True or False)                                                           |
| IsCompressed           | varchar(10) | Is Compressed (True or False)                                                              |
| IsDirty                | varchar(10) | Is Dirty (True or False)                                                                   |
| IsFormatted            | varchar(10) | Is Formatted (True or False)                                                               |
| IsNtfs                 | varchar(10) | Is Ntfs (True or False)                                                                    |
| IsPartitionNumberValid | varchar(10) | Is Partition Number Valid (True or False)                                                  |
| IsPartitionSizeValid   | varchar(10) | Is Partition Size Valid (True or False)                                                    |
| PartitionNumber        | int(5)      | Partition Number of the Disk                                                               |
| PercentFree            | varchar(5)  | Disk Space Free Percentage                                                                 |
| SizeGB                 | varchar(15) | Disk Size in GB                                                                            |
| UsedSpaceGB            | varchar(15) | Used Space in GB                                                                           |
| ScriptRunTime          | varchar(20) | Date and time the data was retrieved                                                       |

## SQL

```
CREATE TABLE `plugin_proval_clustersharedvolume` (
  `SerialNumber` int(10) NOT NULL AUTO_INCREMENT,
  `Computerid` int(10) DEFAULT NULL,
  `VolumeID` varchar(30) DEFAULT NULL,
  `VolumeName` varchar(50) DEFAULT NULL,
  `OwnerNode` varchar(50) DEFAULT NULL,
  `State` varchar(10) DEFAULT NULL,
  `DriveLetter` varchar(5) DEFAULT NULL,
  `DriveLetterMask` varchar(20) DEFAULT NULL,
  `FileSystem` varchar(20) DEFAULT NULL,
  `FreeSpaceGB` varchar(15) DEFAULT NULL,
  `HasDriveLetter` varchar(10) DEFAULT NULL,
  `IsCompressed` varchar(10) DEFAULT NULL,
  `IsDirty` varchar(10) DEFAULT NULL,
  `IsFormatted` varchar(10) DEFAULT NULL,
  `IsNtfs` varchar(10) DEFAULT NULL,
  `IsPartitionNumberValid` varchar(10) DEFAULT NULL,
  `IsPartitionSizeValid` varchar(10) DEFAULT NULL,
  `PartitionNumber` int(5) DEFAULT NULL,
  `PercentFree` varchar(5) DEFAULT NULL,
  `SizeGB` varchar(15) DEFAULT NULL,
  `UsedSpaceGB` varchar(15) DEFAULT NULL,
  `ScriptRunTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `Plugin_ProVal_ClusterSharedVolume_Computer` (`Computerid`),
  CONSTRAINT `Plugin_ProVal_ClusterSharedVolume_Computer` FOREIGN KEY (`Computerid`) REFERENCES `computers` (`ComputerID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
```