---
id: '8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638'
slug: /8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638
title: 'cPVAL Windows Office Version'
title_meta: 'cPVAL Windows Office Version'
keywords: ['microsoft','365','Version','Office']
description: 'This group contains machines where office version is detected by `Get Office Version` Script.'
tags:  ['office365', 'software', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Summary

This device group displays an audit of Office versions when the following custom fields are populated: `cPVAL Office Bitness`, `cPVAL Office Install Type`, `cPVAL Office Edition`, `cPVAL Office Version`, and `cPVAL M365 Apps Installed`.

## Dependencies

- [Solution - Get Office Version](/docs/19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04) 
- [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)
- [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)
- [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1) 
- [cPVAL Office Install Type](/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba)  
- [cPVAL M365 Apps Installed](/docs/20fb97b5-2032-4f47-ad06-584799c6f192)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/cpval-windows-office-version.toml)

### Group View

Please follow the steps below to add the necessary custom fields to the view.

- Create the group and ensure it is saved successfully.
- Open the newly created group for editing.
- Navigate to the Table Settings option.
- Update the table layout to include the required custom fields.
- Save the changes to apply the updated group view.

### URL TO THE GUIDE

- [How-to Guide URL](/docs/71f3f71d-d6d1-4563-8476-92bbe9df55fa)

Add the below custom fields under the Group View:
 
- [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)
- [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)
- [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1) 
- [cPVAL Office Install Type](/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba)  
- [cPVAL M365 Apps Installed](/docs/20fb97b5-2032-4f47-ad06-584799c6f192)

### Group Screenshot

This is how the group should looks like after adding the custom fields:

![Group View](../../../static/img/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638/group.webp)

## Changelog

### 2026-05-27

- Added 2 new custom fields to the group view: 
  - cPVAl M365 Apps Installed
  - cPVAL Office Install Type

### 2025-12-12

- Initial version of the document
