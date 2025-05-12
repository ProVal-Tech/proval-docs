---
id: 'fe210a09-4182-4917-9eea-c9e2f028c8ec'
slug: /fe210a09-4182-4917-9eea-c9e2f028c8ec
title: 'Snapshot Audit'
title_meta: 'Snapshot Audit'
keywords: ['audit', 'snapshots', 'esxi', 'virtual', 'machines']
description: 'This document provides a detailed overview of a dataview that helps audit snapshots of virtual machines hosted on an ESXi server. It includes a comprehensive breakdown of columns, each describing specific attributes of the virtual machines and their corresponding snapshots.'
tags: ['esxi', 'performance', 'report', 'storage', 'virtualization']
draft: false
unlisted: false
---

## Summary

This dataview helps you audit snapshots of the virtual machines that exist on an ESXi server.

## Columns

| Column                          | Description                                          |
|---------------------------------|------------------------------------------------------|
| Client ID                       | Displays the ID of the client                        |
| Client Name                     | Displays the name of the client                      |
| Location Name                   | Displays the name of the location                    |
| Location ID                     | Displays the ID of the location                      |
| Host Name                       | Displays the name of the host server                 |
| Product Name                    | Displays the name of the product                     |
| Product Full Version            | Displays the full version of the product             |
| Host Vendor                     | Displays the vendor name of the host server          |
| Host Model                      | Displays the model name of the host server           |
| Host RAM                        | Displays the total RAM of the host                   |
| Host Processor                  | Displays the host processor information               |
| Host Number of Cores            | Displays the number of cores present                 |
| Host CPU GHz                    | Displays the host CPU details                         |
| Total Virtual Machines on Host   | Displays the total virtual machines on the host      |
| Host FQDN                      | Displays the host FQDN                               |
| VM Name                         | Displays the virtual machine name that resides on the host |
| VM Operating System             | Displays the VM operating system name                |
| VM Version                      | Displays the VM version details                      |
| VM IP Address                   | Displays the VM IP address                           |
| VM MAC Address                  | Displays the VM MAC address                          |
| Provisioned Storage to VM       | Displays the storage provisioned to the VM          |
| Unshared Storage of VM          | Displays the unshared storage of the VM             |
| Used Storage of VM              | Displays the storage used by the VM                  |
| Snapshot Name                   | Displays the name of the snapshot                    |
| Snapshot Age                    | Displays the age of the snapshot                     |
| Creation Age                    | Displays the creation age of the snapshot            |
| Creation Date                   | Displays the creation date of the snapshot           |
| Snapshot ID                     | Displays the ID of the snapshot                      |
| Snapshot Parent ID              | Displays the parent ID of the snapshot               |
| Estimated Disk Usage            | Displays the estimated disk usage by the snapshot    |
| Estimated Disk Max Usage        | Displays the maximum disk usage by the snapshot      |
| Snapshot Description             | Displays the description of the snapshot             |
| Is Current Snapshot             | Displays whether the snapshot is current or not      |