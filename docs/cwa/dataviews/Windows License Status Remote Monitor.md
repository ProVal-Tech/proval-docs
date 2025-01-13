---
id: 'cwa-windows-license-status'
title: 'Windows License Status Monitoring'
title_meta: 'Windows License Status Monitoring'
keywords: ['windows', 'license', 'monitoring', 'status', 'client', 'location', 'computer', 'operating', 'contact', 'data', 'collection']
description: 'This document provides an overview of how to monitor the status of Windows licenses using remote monitoring tools. It outlines the necessary dependencies, the columns used for reporting, and how to interpret the license status of Windows installations across various clients and locations.'
tags: ['monitoring', 'report', 'status', 'windows', 'client', 'location']
draft: false
unlisted: false
---
## Summary

This will display the status of the Windows License fetched by the remote monitor [EPM - Windows Configuration - Monitor - Windows License Status](https://proval.itglue.com/DOC-5078775-8269011).

## Dependencies

[EPM - Windows Configuration - Monitor - Windows License Status](https://proval.itglue.com/DOC-5078775-8269011).

## Columns

| Column                  | Description                                                       |
|------------------------|-------------------------------------------------------------------|
| ClientID               | ClientID of the computer                                          |
| LocationID             | LocationID of the computer                                        |
| ComputerID             | ComputerID of the computer                                        |
| Client                 | Name of the client                                               |
| Location               | Name of the location                                             |
| Computer               | Name of the computer                                             |
| Operating System       | Operating System of the computer                                  |
| Last Contact           | Last Contact of the computer                                      |
| Data Collection Time    | The time when the Windows License Status was fetched             |
| Windows License Status  | The status of the windows license if it is got expired or about to expired or is licensed. |




