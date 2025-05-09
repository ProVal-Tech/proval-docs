---
id: '30279ec0-cbb0-40f5-95ea-fb8052cb093a'
slug: /30279ec0-cbb0-40f5-95ea-fb8052cb093a
title: 'Microsoft Outlook - OSTPST Audit'
title_meta: 'Microsoft Outlook - OSTPST Audit'
keywords: ['dataview', 'outlook', 'audit', 'ost', 'pst', 'windows']
description: 'This document provides a detailed overview of the Dataview that displays the path and size of OST and PST files for users on a Windows machine. It includes dependencies, column descriptions, and data collection details essential for monitoring Outlook files.'
tags: ['database', 'performance', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This Dataview displays the path and size of the OST and PST files for users on a Windows machine.

## Dependencies

- [EPM - Data Collection - Script - Microsoft Outlook - OST/PST - Audit](/docs/2029ecbe-c5f8-431e-9643-7aed63bec6d8)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](/docs/d801eb05-05a3-4271-aa8c-a8ea4941f4eb)
- [EPM - Data Collection - Custom Table - pvl_outlook_pst_ost_audit](/docs/bea56cbb-3761-452a-9493-08a88bc6dbab)

## Columns

| Column                     | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| Client ID                 | Client ID (Hidden)                                          |
| Location ID               | Location ID (Hidden)                                        |
| Computer ID               | Computer ID (Hidden)                                        |
| Client Name               | Client Name                                                |
| Location Name             | Location Name                                              |
| Computer Name             | Computer Name                                              |
| File Name                 | Name of the file                                           |
| Path                      | Path to the OST/PST file                                   |
| Type                      | Type of the file (OST/PST)                                 |
| Size (MB)                | Size of the file in Megabytes                              |
| Size (GB)                | Size of the file in Gigabytes                              |
| Last Modified Time        | Most recent modification time of the file                  |
| Data Collection Time      | Data Collection Time                                        |
| Operating System          | Operating System                                            |
| Last Contact              | Last Contact with RMM                                      |
| Last Logged In User       | Last Logged In User                                        |