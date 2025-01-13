---
id: 'cwa-shared-folder-audit'
title: 'Shared Folder Audit'
title_meta: 'Shared Folder Audit'
keywords: ['audit', 'permissions', 'shares', 'access', 'resource']
description: 'This document provides a detailed overview of the Shared Folder Audit, including its dependencies, the information it collects about file shares and permissions, and the specific columns used in the dataview for reporting.'
tags: ['audit', 'permissions', 'shares', 'access', 'resource', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

This dataview pulls from the script information regarding file shares and permissions. This is populated by the script.

## Dependencies

- [Shared Folder Audit](https://proval.itglue.com/DOC-5078775-8047493)

## Columns

| Column                  | Description                                      |
|------------------------|--------------------------------------------------|
| Client Name            | Client Name                                      |
| Location Name          | Location Name                                    |
| Computer Name          | Computer Name                                    |
| Share Name             | The Share Name                                   |
| Shared Resource Path   | The full path to the share folder                |
| Remark                 | Type of share                                    |
| User Having Access     | Group or Users that have access to this share    |
| Permission Type        | Either Allow or Deny                             |
| Permission Right       | Full, Read, Change or No Access                  |



