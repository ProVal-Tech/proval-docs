---
id: 'c3e9e7df-9e35-46ab-bca6-a182331ca211'
slug: /c3e9e7df-9e35-46ab-bca6-a182331ca211
title: 'EPM - Network - Internal Network - Execute Script - Get - DNS Assignments'
title_meta: 'EPM - Network - Internal Network - Execute Script - Get - DNS Assignments'
keywords: ['dns', 'network', 'script', 'assignments', 'dataview']
description: 'This document outlines the execution of the EPM - Network - Script - Get - DNS Assignments script, which runs weekly to update the DNS Assignments dataview for managed Windows servers and workstations. It includes dependencies and alert template information.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) script once per week to keep the data updated in the [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c) dataview.

## Dependencies

- [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d)  
- [EPM - Network - Custom Table - pvl_network_Adapter](/docs/5a5463d0-0ce3-4c09-bd41-39da28e16d0f)  

## Target

Managed Windows Servers and Workstations

## Alert Template

**Name:** `△ Custom - Execute Script - Get - DNS Assignments`



