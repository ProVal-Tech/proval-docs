---
id: 'cd3368d8-d0b0-4ca4-972e-4adc8c1cfcfa'
slug: /cd3368d8-d0b0-4ca4-972e-4adc8c1cfcfa
title: 'plugin_proval_dns_extradata'
title_meta: 'plugin_proval_dns_extradata'
keywords: ['dns', 'data', 'storage', 'computer', 'interface', 'settings', 'table']
description: 'This document outlines the structure and purpose of the DNS data storage table for target machines, detailing the columns, their types, and the SQL command to create the table. It provides insights into how DNS settings are recorded and managed for networked computers.'
tags: ['database', 'networking']
draft: false
unlisted: false
---

## Purpose

This table stores the DNS data for a target machine. This data includes the computer ID, interface ID, DNS type, and DNS setting.

## Dependencies

- [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](/docs/4bc996bc-1b11-4819-a7c9-73e7c61aa9db)

## Tables

#### plugin_proval_dns_extradata

| Column      | Type    | Explanation                                                |
|-------------|---------|-----------------------------------------------------------|
| ComputerID  | Int     | The computer ID that returned the DNS setting.            |
| InterfaceID | Varchar | The interface ID where the DNS settings were reported.    |
| DNSType     | Varchar | Manual or DHCP DNS setting.                               |
| DNSSetting  | Varchar | A comma-separated list of the actual settings configured for that computer and interface. |

## SQL

```sql
CREATE TABLE `plugin_proval_dns_extradata` (
    `ComputerID` INT(11) NOT NULL,
    `InterfaceID` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
    `DNSType` VARCHAR(25) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
    `DNSSetting` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    PRIMARY KEY (`ComputerID`, `InterfaceID`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
```


