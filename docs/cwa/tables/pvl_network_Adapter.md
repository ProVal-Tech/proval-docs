---
id: '5a5463d0-0ce3-4c09-bd41-39da28e16d0f'
title: 'DNS Assignments Data Storage'
title_meta: 'DNS Assignments Data Storage'
keywords: ['dns', 'network', 'data', 'storage', 'assignments']
description: 'This document outlines the structure of the table that stores data gathered by the DNS Assignments script, detailing its columns, types, and explanations for each field related to network interfaces.'
tags: ['database', 'networking', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

The table stores the data gathered by the [EPM - Network - Script - Get - DNS Assignments](https://proval.itglue.com/DOC-5078775-14378277) script.

## Dependencies

[EPM - Network - Script - Get - DNS Assignments](https://proval.itglue.com/DOC-5078775-14378277)

## Tables

#### pvl_network_Adapter

| Column                | Type          | Explanation                                                   |
|----------------------|---------------|---------------------------------------------------------------|
| computerid           | int           | Computer id of the machine                                    |
| Name                 | varchar(128)  | Name of the network interface                                  |
| PhysicalMediaType    | varchar(50)   | Physical Media Type of the Network interface                  |
| status               | varchar(16)   | Status of the Network interface                                |
| LinkSpeed            | varchar(16)   | Link Speed of the Network interface                            |
| PnpDeviceID          | varchar(256)  | PnpDeviceID of the Network interface                          |
| InterfaceName        | varchar(256)  | Type of the Network interface                                  |
| Hidden               | varchar(8)    | Is the network interface hidden?                              |
| index                | int           | index number of the DNS record                                |
| Description          | varchar(256)  | Description of the Network interface                           |
| DHCPEnabled          | varchar(8)    | Is DHCP enabled for the Network interface?                    |
| DHCPServer           | varchar(256)  | Name/Address of the DHCP server of the network interface      |
| DHCPLeaseObtained    | varchar(32)   | DHCP Lease start date for the network interface               |
| DHCPLeaseExpires      | varchar(32)   | DHCP Lease expiry date for the network interface              |
| DNSDomain            | varchar(64)   | Domain name of the DNS server for the network interface       |
| DNSHostName          | varchar(64)   | Name/Address of the DNS server of the network interface       |
| DNSServerSearchOrder | varchar(128)  | DNS Address(es) of the network interface                       |
| DefaultIPGateway     | varchar(32)   | Default Gateway of the network interface                       |
| IPSubnet             | varchar(64)   | Subnet of the network interface                                 |
| IPAddress            | varchar(255)  | IPAddress(es) of the network interface (both IPv4 and IPv6 if available) |
| Interfaceindex       | int           | index number of the network interface                          |
| MacAddress           | varchar(32)   | Mac Address of the network interface                           |
| SettingID            | varchar(64)   | interface id of the network interface                          |
| DataCollectionTime    | datetime      | Data Collection Time                                          |











