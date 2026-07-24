---
id: 'b896cc1a-061f-454a-acf6-0eb9b2563d6e'
slug: /b896cc1a-061f-454a-acf6-0eb9b2563d6e
title: 'Search Audit'
title_meta: 'Search Audit'
keywords: ['search', 'automate', 'object', 'group', 'monitor']
description: 'This document provides an overview of the various searches used in ConnectWise Automate, detailing the columns and their descriptions for effective search application across different object types.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Summary

This document provides an overview of the searches that are used in Automate at various locations.

## Columns

## Columns

| Column | Description |
|--------|-------------|
| Search ID | Unique ID of the search. |
| Search Name | Name of the search. |
| Total Machines in Search | Total number of machines currently included in the search. |
| Is Legacy Search | Indicates whether the search is likely a legacy search (`Yes`/`No`). |
| Object Type | Type of object that uses the search (e.g., Group, Remote Monitor). |
| Object Name | Name of the object that uses the search (e.g., Group name, Remote Monitor name). |
| Group Path | Full path of the group where the search is being used. |

**Note**: The **Is Legacy Search** column identifies searches that are likely to be legacy searches based on the available detection logic. Since there is no definitive method to identify legacy searches, the results may occasionally include false positives or false negatives.

## Changelog

### 2026-07-23

- Added columns `Total Machines in Search` and `Is Legacy Search` in the dataview

### 2025-04-10

- Initial version of the document
