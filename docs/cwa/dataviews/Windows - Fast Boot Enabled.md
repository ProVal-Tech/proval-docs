---
id: '445b29bc-7665-4f85-a6b9-dfb68e75d70f'
title: 'Fast Boot Status Report'
title_meta: 'Fast Boot Status Report'
keywords: ['fastboot', 'report', 'status', 'client', 'computer', 'os']
description: 'This document provides a comprehensive report on the status of Fast Boot across various machines. It includes details on whether Fast Boot is enabled or not, along with client and computer names, and the operating system installed on each machine.'
tags: ['report', 'status', 'client', 'computer', 'os']
draft: false
unlisted: false
---
## Summary

This dataview pulls from the role detection of Fast Boot. This shows all machines where Fast Boot is enabled.

## Dependencies

- @Fast Boot Enabled (Role)  

## Columns

| Column          | Description                                                                               |
| --------------- | ----------------------------------------------------------------------------------------- |
| Client Name     | Client Name                                                                               |
| Computer Name   | Computer Name                                                                             |
| OS              | OS installed on the machine                                                               |
| FastBoot status | Shows FastBoot Enabled if the role is detected, or 'Not Detected' if FastBoot is disabled |







