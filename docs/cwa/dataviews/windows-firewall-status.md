---
id: '328695bc-c79f-4f18-a679-7c451c8cc272'
slug: /328695bc-c79f-4f18-a679-7c451c8cc272
title: 'Windows - Firewall Status'
title_meta: 'Windows - Firewall Status'
keywords: ['firewall', 'windows', 'configuration', 'endpoints', 'status']
description: 'This document provides a detailed overview of a dataview that displays information related to the configuration of the Windows firewall on endpoints, including the status of domain, private, and public firewalls.'
tags: ['firewall', 'networking', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays information related to Windows firewall configuration on endpoints.

## Dependencies

Roles:  
- [Windows Firewall Public](/docs/984edd72-ce3d-4817-9628-74100ef83865)  
- [Windows Firewall Domain](/docs/ce87a5e8-cc0f-43a5-8cd8-fc551002f618)  
- [Windows Firewall Private](/docs/372dfa84-9e1d-4e86-9a1b-8c8904d3a489)  

## Columns

| Column                     | Description                                                                  |
|---------------------------|------------------------------------------------------------------------------|
| Client                     | The name of the client                                                       |
| Location                   | The name of the location                                                     |
| Computer                   | The name of the endpoint                                                     |
| Domain Firewall Status     | The status (Enabled | Disabled) for the "Domain" network firewall            |
| Private Firewall Status    | The status (Enabled | Disabled) for the "Private" network firewall           |
| Public Firewall Status     | The status (Enabled | Disabled) for the "Public" network firewall            |


