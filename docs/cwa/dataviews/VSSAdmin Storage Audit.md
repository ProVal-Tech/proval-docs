---
id: '7f7e7d3b-047d-41dc-acc2-5083adcaaf39'
title: 'VSS Admin Storage Detail for All Volumes'
title_meta: 'VSS Admin Storage Detail for All Volumes'
keywords: ['vss', 'storage', 'volume', 'audit', 'agent']
description: 'This document provides a detailed overview of the VSS admin storage for all volumes, including dependencies and columns that store essential information about each agent and its storage utilization.'
tags: ['backup', 'report', 'storage', 'virtualization', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview stores the details of VSS admin storage for all volumes.

## Dependencies

- [VSS Resize](<../scripts/VSS Resize.md>)
- [Vssadmin List Storage Audit](<../scripts/Vssadmin List Storage Audit.md>)
- [plugin_proval_vssadminstorage](<../tables/plugin_proval_vssadminstorage.md>)

## Columns

| Column                   | Description                                   |
|-------------------------|-----------------------------------------------|
| Client Name             | Client name of the agent                      |
| Location Name           | Location name of the agent                    |
| Computer Name           | Computer name of the agent                    |
| Operating System        | Operating system of the agent                 |
| Last Contact            | Last contact of the agent with the RMM       |
| Shadow Copy Volume      | Shadow copy volume letter                     |
| VSS Used Storage        | VSS storage occupied on the disk              |
| VSS Allocated Storage   | VSS storage allocated on the disk             |
| VSS Max Storage         | VSS max storage provided                      |
| Script Ran Date         | Date when the script last ran on the agent    |
