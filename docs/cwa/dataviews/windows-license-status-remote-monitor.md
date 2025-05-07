---
id: 'a7c4b9ab-0216-4d04-8480-9e9eac8c4c07'
slug: /a7c4b9ab-0216-4d04-8480-9e9eac8c4c07
title: 'Windows License Status Remote Monitor'
title_meta: 'Windows License Status Remote Monitor'
keywords: ['windows', 'license', 'monitoring', 'status', 'client', 'location', 'computer', 'operating', 'contact', 'data', 'collection']
description: 'This document provides an overview of how to monitor the status of Windows licenses using remote monitoring tools. It outlines the necessary dependencies, the columns used for reporting, and how to interpret the license status of Windows installations across various clients and locations.'
tags: ['report', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays the status of the Windows License fetched by the remote monitor [EPM - Windows Configuration - Monitor - Windows License Status](/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e).

## Dependencies

[EPM - Windows Configuration - Monitor - Windows License Status](/docs/7c6678ef-12c5-4e21-a2d2-9fd84a21191e).

## Columns

| Column                  | Description                                                       |
|------------------------|-------------------------------------------------------------------|
| ClientID               | Client ID of the computer                                          |
| LocationID             | Location ID of the computer                                        |
| ComputerID             | Computer ID of the computer                                        |
| Client                 | Name of the client                                                |
| Location               | Name of the location                                              |
| Computer               | Name of the computer                                              |
| Operating System       | Operating System of the computer                                   |
| Last Contact           | Last contact time of the computer                                  |
| Data Collection Time    | The time when the Windows License Status was fetched              |
| Windows License Status  | The status of the Windows license, indicating if it has expired, is about to expire, or is licensed. |


