---
id: 'c3e9e7df-9e35-46ab-bca6-a182331ca211'
slug: /c3e9e7df-9e35-46ab-bca6-a182331ca211
title: 'Execute Script - Get - DNS Assignments'
title_meta: 'Execute Script - Get - DNS Assignments'
keywords: ['dns', 'network', 'script', 'assignments', 'dataview']
description: 'This document outlines the execution of the EPM - Network - Script - Get - DNS Assignments script, which runs weekly to update the DNS Assignments dataview for managed Windows servers and workstations. It includes dependencies and alert template information.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) script once per week to keep the data updated in the [DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c) dataview.

## Dependencies

- [Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d)  
- [Custom Table - pvl_network_Adapter](/docs/5a5463d0-0ce3-4c09-bd41-39da28e16d0f)  
- [Solution - DNS Assignments](/docs/6b898ed0-2dfd-447c-9a40-5cc9ce05ea9b)

## Target

Managed Windows Servers and Workstations

## Alert Template

`△ Custom - Execute Script - Get - DNS Assignments`