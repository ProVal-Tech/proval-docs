---
id: 'cwa-dataview-audit'
title: 'Dataview Audit'
title_meta: 'Dataview Audit - Track User Access'
keywords: ['dataview', 'audit', 'tracking', 'users', 'access']
description: 'This document provides an overview of a Dataview that audits the most frequently accessed Dataviews by users, allowing for the tracking of valuable Dataviews for clients. It includes detailed information on the columns used in the audit, such as Dataview ID, name, folder, and access statistics.'
tags: ['database', 'report', 'performance', 'tracking']
draft: false
unlisted: false
---
## Summary

This Dataview audits the Dataviews most frequently accessed by users. It can be used to track the most valuable Dataviews for our clients.

## Columns

| Column                        | Description                                                                                          |
|-------------------------------|------------------------------------------------------------------------------------------------------|
| DataviewID                   | Dataview ID                                                                                         |
| Dataview Name                | Name of the Dataview                                                                                |
| Folder Name                  | Name of the folder where Dataview resides                                                           |
| Total Viewers                | Total users who opened the Dataview in last (History Retention) Days                                |
| Total Open Count             | Number of times the dataview was opened in last (History Retention) Days                           |
| Recently Opened On           | Most recent date when Dataview was accessed                                                         |
| Duration Since Initial Opening(Days) | Number of Days when dataview was opened for the first time in last (History Retention) Days |
| History Retention(Days)      | It shows how many days old the data is that is displayed in Dataview (it totally depends on the data shown in the h_users table) |


