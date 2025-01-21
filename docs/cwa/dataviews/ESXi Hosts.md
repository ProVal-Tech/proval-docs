---
id: '556a609f-b0e6-401b-afc0-17932fde35c7'
title: 'ESXi Hosts Dataview'
title_meta: 'ESXi Hosts Dataview'
keywords: ['esxi', 'dataview', 'virtualization', 'hosts', 'infrastructure']
description: 'This document provides a comprehensive overview of the ESXi hosts dataview, detailing the necessary dependencies, available columns, and the information displayed for each host, including CPU, memory, and storage metrics.'
tags: ['cpu', 'memory', 'storage', 'update', 'virtualization']
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
| Client Name                     | Name of the client.                                              |
| Location Name                   | Name of the location.                                           |
| Device Name                     | Displays the host device name.                                   |
| FQDN                            | IP address/FQDN of the ESXi host.                              |
| Product Name                    | Displays the device's product name.                             |
| Product Full Version            | Displays the device product version.                             |
| Vendor                          | Displays the device vendor name.                                 |
| Model                           | Displays the device model name.                                  |
| CPU                             | Displays the device CPU information.                             |
| Number of Cores                 | Displays the number of cores on the device.                     |
| Overall CPU Usage (GHz)        | Displays the device CPU usage information in GHz.               |
| Total Memory (GB)              | Displays the device's total memory.                              |
| Overall Memory Usage (GB)      | Displays the device's current memory in use.                    |
| Storage Name                    | Displays the names of the disks attached to the host.           |
| Disk Total Space (GB)          | Displays the total storage space used on the host.              |
| Disk Free Space (GB)           | Displays the total storage space available on the host.         |
| Is SSD                          | Indicates whether the attached storage device is SSD or not.    |
| Storage Last Update             | Displays the last time the storage information of the host was updated in Automate. |
| Last Update                     | Displays the last time the host's information was updated in Automate. |
