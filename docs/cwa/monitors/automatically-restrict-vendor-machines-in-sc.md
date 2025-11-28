---
id: '4a4b5a11-8087-4e0a-b2b1-629d07326dd2'
slug: /4a4b5a11-8087-4e0a-b2b1-629d07326dd2
title: 'Automatically Restrict/Unrestrict Vendor Machines in SC'
title_meta: 'Automatically Restrict/Unrestrict Vendor Machines in SC'
keywords: ['monitor', 'vendor', 'access', 'restriction', 'automate']
description: 'This document outlines the setup and dependencies for the Restrict Vendor Access monitor in ConnectWise Automate, ensuring that when specific EDFs are checked, machines in the system are automatically restricted from vendor access.'
tags: ['security', 'setup']
draft: false
unlisted: false
---

## Summary

The purpose of this monitor is to ensure that when the `Restrict Vendor Access` EDFs are checked within Automate, it automatically restricts the machines in both Automate and ScreenConnect. And if the EDF is unchecked but the custom property `Vendor Restricted` in ScreenConnect is set to `Restricted`, this will unrestrict the computer both in Automate and ScreenConnect.

## Dependencies

The following EDFs must be created before importing the monitor:

- **Client EDF**: `Restrict Vendor Access`   
Enables the vendor restriction for whole client  
  ![Image](../../../static/img/docs/4a4b5a11-8087-4e0a-b2b1-629d07326dd2/image_1.webp)

- **Location EDF**: `Restrict Vendor Access`  
Enables the vendor restriction for whole location  
  ![Image](../../../static/img/docs/4a4b5a11-8087-4e0a-b2b1-629d07326dd2/image_2.webp)

- **Computer EDF**: `Restrict Vendor Access`  
Enables the vendor restriction for the computer
  ![Image](../../../static/img/docs/4a4b5a11-8087-4e0a-b2b1-629d07326dd2/image_3.webp)

## Target

All operating systems

## Alert Template

- `△ Custom - Execute Script - Update Vendor Restricted Property`