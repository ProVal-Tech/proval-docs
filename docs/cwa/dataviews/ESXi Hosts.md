---
id: 'cwa-esxi-hosts-dataview'
title: 'ESXi Hosts Dataview'
title_meta: 'ESXi Hosts Dataview'
keywords: ['esxi', 'dataview', 'virtualization', 'hosts', 'infrastructure']
description: 'This document provides a comprehensive overview of the ESXi hosts dataview, detailing the necessary dependencies, available columns, and the information displayed for each host, including CPU, memory, and storage metrics.'
tags: ['virtualization', 'infrastructure', 'cpu', 'memory', 'storage', 'update']
draft: false
unlisted: false
---
## Summary

This dataview shows useful information about ESXi hosts.

## Dependencies

- The virtualization manager plugin needs to be installed and configured.

## Columns

| Column                          | Description                                                       |
|---------------------------------|-------------------------------------------------------------------|
| Client Name                     | Name of the Client.                                              |
| Location Name                   | Name of the Location.                                          |
| Device Name                     | Display the Host device name.                                   |
| FQDN                            | IP Address/FQDN of the Esxi Host.                              |
| Product Name                    | Display the device's product name.                             |
| Product Full Version            | Display the device product version.                             |
| Vendor                          | Display the device vendor name.                                 |
| Model                           | Display the device model name.                                  |
| CPU                             | Display the device CPU information.                             |
| Number Of Cores                 | Display the number of cores on the device.                     |
| Overall Cpu Usage (Ghz)        | Display the device CPU Usage information in Ghz.               |
| Total Memory (GB)              | Display the Device Total Memory.                                |
| Overall Memory Usage (GB)      | Display the device's current memory in use.                    |
| Storage Name                    | Display the Name of the Disks attached to the Host.            |
| Disk Total Space (GB)          | Display the Total Storage Space Used on the Host.              |
| Disk Free Space (GB)           | Display the Total Storage Space available on the Host.         |
| IsSSD                           | Display's whether the attached Storage Device is SSD or not.   |
| StorageLastUpdate               | Display the last time the Storage information of the host is updated in Automate. |
| LastUpdate                      | Display the last time the Host's information was updated in Automate. |




