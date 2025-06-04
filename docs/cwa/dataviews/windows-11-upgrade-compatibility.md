---
id: '36ca4c95-af9e-443b-8fe5-33e910107650'
slug: /36ca4c95-af9e-443b-8fe5-33e910107650
title: 'Windows 11 Upgrade Compatibility'
title_meta: 'Windows 11 Upgrade Compatibility'
keywords: ['windows', 'upgrade', 'compatibility', 'check', 'machine']
description: 'This document provides a detailed overview of a PowerShell script that checks which machines are eligible for an upgrade to Windows 11. It includes information on dependencies, column descriptions, and format control for compatibility checks.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Summary

This document shows which machines are eligible to upgrade to Windows 11 based on the PowerShell script provided by Microsoft.

## Dependencies

- [plugin_proval_windows11_readiness](/docs/74cca89e-effd-4af7-a73a-53a30b91c8a7)
- [Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c)
- [Execute Script - Windows - Check Windows 11 Compatibility](/docs/8aa2542c-c61f-43b8-a7ec-ec33558319e4)

## Columns

| Column                | Description                                                                                          |
|----------------------|------------------------------------------------------------------------------------------------------|
| ClientId         | ClientId (Hidden).                                                                                  |
| LocationId          | LocationId (Hidden).                                                                                  |
| ComputerId          | Computerid (Hidden).                                                                                  |
| Client Name          | Name of the Client.                                                                                  |
| Location Name        | Name of the Location.                                                                                |
| Computer Name        | Name of the Computer.                                                                                |
| Friendly Name        | Friendly Name of the Computer (Hidden).                                                               |
| Operating System     | Name of the Operating System.                                                                         |
| OS Version           | Build number of the Operating System.                                                                |
| Last Contact         | Last contact of the machine with the Automate Server.                                               |
| Compatibility Check   | Displays the Windows 11 compatibility status of the machine. Values can be Capable, Not Capable, Undetermined, or Script Failed. |
| Secure Boot Check    | Secure Boot status of the machine against the compatibility check. Values can be Fail or Pass.      |
| Memory Check         | Memory check of the machine against the compatibility check. Values can be Fail or Pass.            |
| CPU Check            | CPU check of the machine against the compatibility check. Values can be Fail or Pass.               |
| OS Drive Space Check | OS Drive Space check of the machine against the compatibility check. Values can be Fail or Pass.    |
| TPM Check            | TPM version check of the machine against the compatibility check. Values can be Fail or Pass.      |
| OS Drive Size GB            | Total Space in C:\ drive in GB.      |
| OS Drive Free Space GB           | Free Space available in C:\ drive in GB.      |
| Script Last Ran      | The last time the compatibility check script was run against the target device.                     |
| Last User            | Last user logged on to the machine according to Automate.                                          |

## Format Control

| Column Name          | Operator | Comparator     | Color  |
|---------------------|----------|----------------|--------|
| Compatibility Check  | Equals   | Not Capable    | Red    |
| Compatibility Check  | Equals   | Undetermined    | Orange |
| Compatibility Check  | Equals   | Capable        | Green  |
