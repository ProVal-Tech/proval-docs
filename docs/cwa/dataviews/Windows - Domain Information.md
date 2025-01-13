---
id: 'cwa-domain-joined-status'
title: 'Domain Joined Status Overview'
title_meta: 'Domain Joined Status Overview'
keywords: ['domain', 'azure', 'hybrid', 'drs', 'on-prem', 'status']
description: 'This document provides a comprehensive overview of how a computer is domain joined, detailing the different types of domain join statuses including Azure AD, Hybrid, DRS Joined, On-prem, and not joined. It includes dependencies and a detailed column description for better understanding.'
tags: ['configuration', 'networking', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This dataview shows you how a computer is domain joined (or not domain joined) to include: Azure AD, Hybrid, DRS Joined, On-prem and not joined.

## Dependencies

- @Microsoft – Azure AD Joined (Role)
- @Microsoft – AD Joined (Role)
- @Microsoft – Hybrid AD Joined (Role)
- @Microsoft – On Premises DRS Joined (Role)

## Columns

| Column                             | Description                                                       |
|------------------------------------|-------------------------------------------------------------------|
| Client                             | Client Name                                                       |
| Location                           | Location Name                                                     |
| Computer                           | Computer Name                                                     |
| OS                                 | OS version installed on the machine                               |
| LastContact                        | Last time the machine checked into Automate                       |
| Microsoft - Azure AD Joined        | Joined | Not Joined if the machine is Azure AD joined               |
| Microsoft - Domain Joined          | Joined | Not Joined if the machine is On-Prem AD joined              |
| Microsoft - Hybrid AD Joined       | Joined | Not Joined if the machine is Hybrid AD joined                 |
| Microsoft - On-premises DRS Joined | Joined | Not Joined if the machine is Device Registration Service (DRS) AD joined |
| Microsoft - Not Domain Joined      | Domain Joined | Not Domain Joined if the machine is joined to a domain     |


