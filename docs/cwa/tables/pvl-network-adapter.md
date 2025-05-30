---
id: '5a5463d0-0ce3-4c09-bd41-39da28e16d0f'
slug: /5a5463d0-0ce3-4c09-bd41-39da28e16d0f
title: 'pvl_network_Adapter'
title_meta: 'pvl_network_Adapter'
keywords: ['dns', 'network', 'data', 'storage', 'assignments']
description: 'This document outlines the structure of the table that stores data gathered by the DNS Assignments script, detailing its columns, types, and explanations for each field related to network interfaces.'
tags: ['database', 'networking', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

The table stores the data gathered by the [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) script.

## Dependencies

[EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d)

## Tables

#### pvl_network_Adapter

| Column                | Type          | Explanation                                                   |
|----------------------|---------------|---------------------------------------------------------------|
| computerid           | int           | Computer ID of the machine                                    |
| Name                 | varchar(128)  | Name of the network interface                                  |
| PhysicalMediaType    | varchar(50)   | Physical Media Type of the network interface                  |
| status               | varchar(16)   | Status of the network interface                                |
| LinkSpeed            | varchar(16)   | Link Speed of the network interface                            |
| PnpDeviceID          | varchar(256)  | PnP Device ID of the network interface                        |
| InterfaceName        | varchar(256)  | Type of the network interface                                  |
| Hidden               | varchar(8)    | Is the network interface hidden?                              |
| index                | int           | Index number of the DNS record                                |
| Description          | varchar(256)  | Description of the network interface                           |
| DHCPEnabled          | varchar(8)    | Is DHCP enabled for the network interface?                    |
| DHCPServer           | varchar(256)  | Name/Address of the DHCP server of the network interface      |
| DHCPLeaseObtained    | varchar(32)   | DHCP Lease start date for the network interface               |
| DHCPLeaseExpires      | varchar(32)   | DHCP Lease expiry date for the network interface              |
| DNSDomain            | varchar(64)   | Domain name of the DNS server for the network interface       |
| DNSHostName          | varchar(64)   | Name/Address of the DNS server of the network interface       |
| DNSServerSearchOrder | varchar(128)  | DNS Address(es) of the network interface                       |
| DefaultIPGateway     | varchar(32)   | Default Gateway of the network interface                       |
| IPSubnet             | varchar(64)   | Subnet of the network interface                                 |
| IPAddress            | varchar(255)  | IP Address(es) of the network interface (both IPv4 and IPv6 if available) |
| InterfaceIndex       | int           | Index number of the network interface                          |
| MacAddress           | varchar(32)   | MAC Address of the network interface                           |
| SettingID            | varchar(64)   | Interface ID of the network interface                          |
| DataCollectionTime    | datetime      | Data Collection Time                                          |