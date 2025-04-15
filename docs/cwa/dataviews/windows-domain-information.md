---
id: '18505efc-1e3d-4d75-97d9-6c10e5de540f'
slug: /18505efc-1e3d-4d75-97d9-6c10e5de540f
title: 'Windows - Domain Information'
title_meta: 'Windows - Domain Information'
keywords: ['domain', 'azure', 'hybrid', 'drs', 'on-prem', 'status']
description: 'This document provides a comprehensive overview of how a computer is domain joined, detailing the different types of domain join statuses including Azure AD, Hybrid, DRS Joined, On-Prem, and Not Joined. It includes dependencies and a detailed column description for better understanding.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document provides an overview of how a computer is domain joined (or not domain joined), including statuses such as Azure AD, Hybrid, DRS Joined, On-Prem, and Not Joined.

## Dependencies

- @Microsoft – Azure AD Joined (Role)
- @Microsoft – AD Joined (Role)
- @Microsoft – Hybrid AD Joined (Role)
- @Microsoft – On-Premises DRS Joined (Role)

## Columns

| Column                             | Description                                                       |
|------------------------------------|-------------------------------------------------------------------|
| Client                             | Client Name                                                       |
| Location                           | Location Name                                                     |
| Computer                           | Computer Name                                                     |
| OS                                 | OS version installed on the machine                               |
| Last Contact                       | Last time the machine checked into Automate                       |
| Microsoft - Azure AD Joined        | Joined | Not Joined if the machine is Azure AD joined               |
| Microsoft - Domain Joined          | Joined | Not Joined if the machine is On-Prem AD joined              |
| Microsoft - Hybrid AD Joined       | Joined | Not Joined if the machine is Hybrid AD joined                 |
| Microsoft - On-Premises DRS Joined | Joined | Not Joined if the machine is Device Registration Service (DRS) AD joined |
| Microsoft - Not Domain Joined      | Domain Joined | Not Domain Joined if the machine is joined to a domain     |


