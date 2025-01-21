---
id: 'c3e9e7df-9e35-46ab-bca6-a182331ca211'
title: 'EPM - Network - Internal Network - Execute Script - Get - DNS Assignments'
title_meta: 'EPM - Network - Internal Network - Execute Script - Get - DNS Assignments'
keywords: ['dns', 'network', 'script', 'assignments', 'dataview']
description: 'This document outlines the execution of the EPM - Network - Script - Get - DNS Assignments script, which runs weekly to update the DNS Assignments dataview for managed Windows servers and workstations. It includes dependencies and alert template information.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [EPM - Network - Script - Get - DNS Assignments](<./Get - DNS Assignments.md>) script once per week to keep the data updated in the [EPM - Network - Dataview - DNS Assignments](https://proval.itglue.com/DOC-5078775-12184160) dataview.

## Dependencies

- [EPM - Network - Script - Get - DNS Assignments](<./Get - DNS Assignments.md>)  
- [EPM - Network - Custom Table - pvl_network_Adapter](<../tables/pvl_network_Adapter.md>)  

## Target

Managed Windows Servers and Workstations

## Alert Template

**Name:** `△ Custom - Execute Script - Get - DNS Assignments`



