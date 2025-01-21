---
id: '5721d83a-3303-4dc2-97ca-118683da0690'
title: 'Offboarding Monitor for Client, Location, and Computer'
title_meta: 'Offboarding Monitor for Client, Location, and Computer'
keywords: ['offboarding', 'monitor', 'edf', 'client', 'location', 'computer']
description: 'This document outlines the functionality of the Offboarding Monitor, which detects machines opted for offboarding based on selected client, location, or computer level EDFs. It includes dependencies and alert templates for effective monitoring.'
tags: []
draft: false
unlisted: false
---

## Summary

The purpose of this monitor is to detect the machines opted for offboarding. The monitor will detect the online machine if the client-level EDF **`Offboard Client`**, the location-level EDF **`Offboard Location`**, or the computer-level EDF **`Offboard Computer`** is selected.

## Dependencies

- [CWM - Automate - Script - Offboarding Wrapper](<../scripts/Offboarding Wrapper.md>)

- Select **`Offboard Client`** EDF to select the whole client for offboarding  
  ![](../../../static/img/Offboarding/image_1.png)

- Select **`Offboard Location`** EDF to select the whole location for offboarding  
  ![](../../../static/img/Offboarding/image_2.png)

- Select **`Offboard Computer`** EDF to select the machine for offboarding  
  ![](../../../static/img/Offboarding/image_3.png)

## Target

All Operating Systems

## Alert Template

- **`△ Custom - Execute Script - Offboarding Wrapper`**

