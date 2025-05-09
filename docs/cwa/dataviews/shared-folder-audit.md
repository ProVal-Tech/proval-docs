---
id: '1f703da4-d3a2-4a39-9549-58c280665eeb'
slug: /1f703da4-d3a2-4a39-9549-58c280665eeb
title: 'Shared Folder Audit'
title_meta: 'Shared Folder Audit'
keywords: ['audit', 'permissions', 'shares', 'access', 'resource']
description: 'This document provides a detailed overview of the Shared Folder Audit, including its dependencies, the information it collects about file shares and permissions, and the specific columns used in the dataview for reporting.'
tags: ['permissions', 'report']
draft: false
unlisted: false
---

## Summary

This dataview pulls information regarding file shares and permissions from the script. This data is populated by the script.

## Dependencies

- [Shared Folder Audit](/docs/dc9e4596-2cce-49b2-9f64-d6dfd46ac1ec)

## Columns

| Column                  | Description                                      |
|------------------------|--------------------------------------------------|
| Client Name            | Client Name                                      |
| Location Name          | Location Name                                    |
| Computer Name          | Computer Name                                    |
| Share Name             | The Share Name                                   |
| Shared Resource Path   | The full path to the share folder                |
| Remark                 | Type of share                                    |
| User Having Access     | Groups or Users that have access to this share   |
| Permission Type        | Either Allow or Deny                             |
| Permission Right       | Full, Read, Change, or No Access                 |