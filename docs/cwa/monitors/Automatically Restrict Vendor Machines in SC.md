---
id: 'cwa-restrict-vendor-access-monitor'
title: 'Restrict Vendor Access Monitor in ConnectWise Automate'
title_meta: 'Restrict Vendor Access Monitor in ConnectWise Automate'
keywords: ['monitor', 'vendor', 'access', 'restriction', 'automate']
description: 'This document outlines the setup and dependencies for the Restrict Vendor Access monitor in ConnectWise Automate, ensuring that when specific EDFs are checked, machines in the system are automatically restricted from vendor access.'
tags: ['configuration', 'notification', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor is to ensure that when the EDFs "Restrict Vendor Access" EDFs are checked within automate, it automatically restricts the machines in SC.

## Dependencies

Below EDFs must be created before importing the monitor:

- Select Client EDF "Restrict Vendor Access" to select Whole client for Vendor Restriction  
  ![Image](5078775/docs/15436510/images/22463667)

- Select Location EDF "Restrict Vendor Access" to select the Whole location for Vendor Restriction  
  ![Image](5078775/docs/15436510/images/22463747)

- Select Computer EDF "Restrict Vendor Access" to select a machine for Vendor Restriction  
  ![Image](5078775/docs/15436510/images/22765852)

## Target

All Operating Systems

## Alert Template

- `△ Custom - Execute Script - Update Vendor Restricted Property`

