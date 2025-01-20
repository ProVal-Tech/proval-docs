---
id: 'cd3368d8-d0b0-4ca4-972e-4adc8c1cfcfa'
title: 'DNS Data Storage for Target Machines'
title_meta: 'DNS Data Storage for Target Machines'
keywords: ['dns', 'data', 'storage', 'computer', 'interface', 'settings', 'table']
description: 'This document outlines the structure and purpose of the DNS data storage table for target machines, detailing the columns, their types, and the SQL command to create the table. It provides insights into how DNS settings are recorded and managed for networked computers.'
tags: ['database', 'networking']
draft: false
unlisted: false
---
## Purpose

This table stores the dns data for a target machine. This data includes the computer id, interface id, dns type, and dns setting.

## Dependencies

- [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](<../scripts/Create and Populate plugin_proval_dns_extradata.md>)

## Tables

#### plugin_proval_dns_extradata

| Column      | Type    | Explanation                                                |
|-------------|---------|-----------------------------------------------------------|
| ComputerID  | Int     | The computer id that returned the dns setting.            |
| InterfaceID | Varchar | The interface id where the dns settings were reported.    |
| DNSType     | Varchar | Manual or DHCP dns setting.                               |
| DNSSetting  | Varchar | A comma separated list of the actual setting set for that computer and interface. |

## SQL

```
CREATE TABLE `plugin_proval_dns_extradata` (
    `ComputerID` INT(11) NOT NULL,
    `InterFaceID` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
    `DNSType` VARCHAR(25) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
    `DNSSetting` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    PRIMARY KEY (`ComputerID`, `InterFaceID`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
```












