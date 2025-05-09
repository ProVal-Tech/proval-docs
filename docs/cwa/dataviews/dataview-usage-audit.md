---
id: '99dfcda4-d0ce-49db-baac-bbe2d41c9e85'
slug: /99dfcda4-d0ce-49db-baac-bbe2d41c9e85
title: 'Dataview Usage Audit'
title_meta: 'Dataview Usage Audit'
keywords: ['dataview', 'audit', 'tracking', 'users', 'access']
description: 'This document provides an overview of a Dataview that audits the most frequently accessed Dataviews by users, allowing for the tracking of valuable Dataviews for clients. It includes detailed information on the columns used in the audit, such as Dataview ID, name, folder, and access statistics.'
tags: ['database', 'performance', 'report']
draft: false
unlisted: false
---

## Summary

This Dataview audits the Dataviews most frequently accessed by users. It can be used to track the most valuable Dataviews for our clients.

## Columns

| Column                               | Description                                                                                          |
|--------------------------------------|------------------------------------------------------------------------------------------------------|
| Dataview ID                          | Dataview ID                                                                                         |
| Dataview Name                        | Name of the Dataview                                                                                |
| Folder Name                          | Name of the folder where the Dataview resides                                                       |
| Total Viewers                        | Total users who opened the Dataview in the last (History Retention) days                            |
| Total Open Count                     | Number of times the Dataview was opened in the last (History Retention) days                        |
| Recently Opened On                   | Most recent date when the Dataview was accessed                                                     |
| Duration Since Initial Opening (Days) | Number of days since the Dataview was opened for the first time in the last (History Retention) days |
| History Retention (Days)            | Indicates how many days old the data displayed in the Dataview is (it depends on the data shown in the h_users table) |

