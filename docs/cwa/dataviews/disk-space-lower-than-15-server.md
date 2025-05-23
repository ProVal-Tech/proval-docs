---
id: '9d50d408-076d-4ed3-9a70-c2ff4f9c980b'
slug: /9d50d408-076d-4ed3-9a70-c2ff4f9c980b
title: 'Disk Space Lower Than 15% Server'
title_meta: 'Disk Space Lower Than 15% Server'
keywords: ['server', 'drives', 'free', 'space', 'monitoring']
description: 'This document outlines a dataview that displays server drives with less than 15% free space remaining. It includes filtering criteria, dependencies, and a detailed description of standard and available columns for effective monitoring of drive space usage.'
tags: ['disk-encryption', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will display server drives that have less than 15% free space remaining.

**Filters applied:**
- The drive must be larger than 16 GB (this is to filter out recovery drives).
- The file system cannot be 'CDFS', 'UNKFS', 'DVDFS', 'FAT', 'FAT32', or 'NetFS' (filtering out drives that are not relevant).
- The drive must not be a "missing" drive.

## Dependencies

None

## Columns

**Standard Columns**  
| Column                  | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| Client                 | The name of the associated client                                           |
| Location               | The name of the associated location                                         |
| Computer Name          | The name of the device                                                     |
| Drive Letter           | The drive letter on the device that has less than 15% free space remaining  |
| Drive Free Percent      | The calculated percentage of drive space remaining (Drive free space / drive total size) |
| Drive Size             | The total drive size for the drive letter                                   |
| Drive Free Space       | The remaining drive space for the drive letter                              |
| Drive File System      | The file system type for the drive letter                                   |
| Drive Type             | The type of drive (Virtual, Physical, SSD, etc.)                           |
| Drive Model            | The model of the drive                                                     |
| Agent Last Contact Date | The last time the agent checked in to CW Automate                          |

**Available Columns**  
| Column                  | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| Agent Comment          | The agent comment associated with this endpoint                             |
| Agent OS Version       | The version of the OS for that machine                                      |
| Agent Version          | The CW Automate agent version                                               |
| ClientID               | The numerical DB value of the client                                        |
| ComputerID             | The numerical DB value for the computer                                     |
| Drive Missing          | Will display if the drive is a missing drive (there should be none as these are filtered out) |
| DriveID                | The numerical DB value for the drive                                        |
| LocationID             | The numerical DB value for the location                                     |
| Operating System       | The name of the operating system on the computer                            |