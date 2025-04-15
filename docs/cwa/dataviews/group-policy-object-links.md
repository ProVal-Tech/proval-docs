---
id: '45a9f461-fac0-4e5c-9a5f-819786e8ad21'
slug: /45a9f461-fac0-4e5c-9a5f-819786e8ad21
title: 'Group Policy Object Links'
title_meta: 'Group Policy Object Links'
keywords: ['gpo', 'audit', 'policy', 'link', 'dc', 'client', 'location', 'enabled', 'enforced', 'computer', 'user', 'created', 'modified', 'read']
description: 'This document provides a comprehensive overview of the GPO Audit Dataview, detailing information about Group Policy Objects (GPOs), their applied policies, and their linkage within Active Directory environments. It outlines the dependencies required for implementation and describes the columns used to present the data effectively.'
tags: ['active-directory', 'gpo', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows information about GPOs, their applied policies, and where they are linked.

## Dependencies

- [Group Policy Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)
- [plugin_proval_ad_gpo](/docs/c7cf649a-dd80-4e9d-8c80-eb95b813b7c9)
- [plugin_proval_ad_gpolinks](/docs/85f52c7c-84bc-488f-a4de-d3122fec1f42)

## Columns

| Column          | Description                                        |
|-----------------|----------------------------------------------------|
| Client          | Client name.                                      |
| Location        | Location name.                                    |
| Source DC       | DC Server Name.                                   |
| Domain          | Domain joined detail of DC.                       |
| GPO             | Applied GPO policy.                               |
| GPO GUID        | GPO GUID information.                             |
| Link Path       | The complete path of the linked GPO.             |
| Link Enabled    | Displays if the GPO link is enabled (True/False).|
| Enforced        | Displays if the GPO link is enforced (True/False).|
| ComputerEnabled  | Shows if the Computer section of the GPO is enabled. |
| UserEnabled     | Shows if the User section of the GPO is enabled. |
| Created Time    | GPO created date and time information.           |
| Modified Time   | GPO last modified date and time.                 |
| Read Time       | GPO last check time.                              |
