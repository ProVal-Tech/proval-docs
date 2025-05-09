---
id: '0de90f98-d7ae-4a79-a851-30829a596846'
slug: /0de90f98-d7ae-4a79-a851-30829a596846
title: 'Vssadmin List Storage Audit'
title_meta: 'Vssadmin List Storage Audit'
keywords: ['vssadmin', 'storage', 'audit', 'volume', 'details']
description: 'This document provides a comprehensive guide on using a script to audit VSSAdmin storage details across all volumes. It identifies whether VSS storage is enabled and reports relevant information for volumes with enabled storage, while also indicating if no storage is configured for any volume.'
tags: ['backup', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This script will help audit the VSSAdmin storage details. It will report for all volumes where VSS storage is enabled; if it is not enabled for any volume, it will report "No Drive."

## Sample Run

![Sample Run](../../../static/img/docs/0de90f98-d7ae-4a79-a851-30829a596846/image_1.webp)

## Dependencies

- [VSS Resize](/docs/0600e89c-06a5-42da-9ed8-41e43d9cfd7d)  
- [plugin_proval_vssadminstorage](/docs/165f6290-8932-459b-9bfe-18c86f7a61d6)  
- [VSSAdmin Storage Audit](/docs/7f7e7d3b-047d-41dc-acc2-5083adcaaf39)  

## Variables

| Name   | Description                               |
|--------|-------------------------------------------|
| output | Contains the output of the VSSAdmin size audit |

## Process

This script runs PowerShell to check whether the VSSAdmin storage is placed on the drive. If it is placed, the script detects the volume letter, total size, allocated size for storage, maximum storage size, and script run time, storing these details in a table for auditing.

## Output

The location and method by which this script returns data:

- Script log
- plugin_proval_vssadminstorage
- Dataview