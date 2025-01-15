---
id: '328695bc-c79f-4f18-a679-7c451c8cc272'
title: 'Windows Firewall Configuration Dataview'
title_meta: 'Windows Firewall Configuration Dataview'
keywords: ['firewall', 'windows', 'configuration', 'endpoints', 'status']
description: 'This document provides a detailed overview of a dataview that displays information related to the configuration of Windows firewall on endpoints, including the status of domain, private, and public firewalls.'
tags: ['configuration', 'firewall', 'windows', 'networking', 'status']
draft: false
unlisted: false
---
## Summary

This dataview will display information related to Windows firewall configuration on endpoints.

## Dependencies

Roles:  
- [Windows Firewall Public](https://proval.itglue.com/DOC-5078775-7920828)  
- [Windows Firewall Domain](https://proval.itglue.com/DOC-5078775-8014764)  
- [Windows Firewall Private](https://proval.itglue.com/DOC-5078775-7970600)  

## Columns

| Column                     | Description                                                                  |
|---------------------------|------------------------------------------------------------------------------|
| Client                     | The name of the client                                                       |
| Location                   | The name of the location                                                     |
| Computer                   | The name of the endpoint                                                     |
| Domain Firewall Status     | The status (Enabled|Disabled) for the "Domain" network firewall             |
| Private Firewall Status    | The status (Enabled|Disabled) for the "Private" network firewall            |
| Public Firewall Status     | The status (Enabled|Disabled) for the "Public" network firewall             |







