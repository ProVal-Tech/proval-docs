---
id: 'b3141fc4-14f1-41a7-ba67-61b3a4e29fd5'
slug: /b3141fc4-14f1-41a7-ba67-61b3a4e29fd5
title: 'M365TenantId'
title_meta: 'M365TenantId'
keywords: ['m365', 'tenant', 'id', 'onedrive', 'group', 'policies']
description: 'This document explains the managed variable used to store the partner Microsoft M365 tenant ID, which is essential for configuring various OneDrive group policies. It provides guidance on how partners can obtain their tenant ID and outlines the associated managed variable details.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This managed variable is used to store the partner's Microsoft M365 tenant ID. The tenant ID is required for several of the OneDrive group policies.  
![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
The value for this must be provided by the partner. The partner can get their M365 Tenant ID [here](https://learn.microsoft.com/en-us/sharepoint/find-your-office-365-tenant-id).

## Associated Content

[SWM - Software Management - Solution - Microsoft OneDrive - (Group Policies/Redirect Folder)](/docs/42fcda71-e3ed-40e2-92e0-c0eb80e42e2d)

## Details

| Managed Variable Name | Managed Variable Type | Description |
|-----------------------|-----------------------|-------------|
| M365TenantId          | Public                | Used by the agent procedure to specify the partner's M365 Tenant ID. The tenant ID is required for several of the group policies. |