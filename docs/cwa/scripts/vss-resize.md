---
id: '0600e89c-06a5-42da-9ed8-41e43d9cfd7d'
slug: /0600e89c-06a5-42da-9ed8-41e43d9cfd7d
title: 'VSS Resize'
title_meta: 'VSS Resize'
keywords: ['vssadmin', 'resize', 'storage', 'script', 'parameter']
description: 'This document provides a detailed overview of a PowerShell script designed to reset the vssadmin size and update the storage table with the latest size details. It includes sample runs, dependencies, user parameters, and output information.'
tags: ['performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script resets the vssadmin size and updates the table with the latest size details.

## Sample Run

![Sample Run](../../../static/img/docs/0600e89c-06a5-42da-9ed8-41e43d9cfd7d/image_1.webp)

## Dependencies

- [VSSAdmin Storage Audit](/docs/7f7e7d3b-047d-41dc-acc2-5083adcaaf39) 
- [Vssadmin List Storage Audit](/docs/0de90f98-d7ae-4a79-a851-30829a596846) 
- [plugin_proval_vssadminstorage](/docs/165f6290-8932-459b-9bfe-18c86f7a61d6) 

## Variables

| Name  | Description                                                                                   |
|-------|-----------------------------------------------------------------------------------------------|
| psout | This contains the complete PowerShell output of the vssadmin storage resize state.          |

### User Parameters

| Name             | Example | Required | Description                                                                                      |
|------------------|---------|----------|--------------------------------------------------------------------------------------------------|
| Drives           | 1       | False    | 1 - Resize all drives with vssadmin; leave blank or put anything for only C: Drive.           |
| MaxSize          | 10      | False    | Set the vss max size for the volume in a fixed specific size.                                   |
| MaxSizePercent   | 10      | False    | Set the vss max size for the volume as a percentage of its total size.                         |

## Process

This script resets the vssadmin size and updates the table with the latest size details using PowerShell. It resizes the storage based on user parameters and validates the scope and resize success.

## Output

- Script log
- Table
- Dataview