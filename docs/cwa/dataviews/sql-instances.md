---
id: 'e470f3e6-0e69-4cd4-89c0-1d9f2bd93e00'
slug: /e470f3e6-0e69-4cd4-89c0-1d9f2bd93e00
title: 'SQL Instances'
title_meta: 'SQL Instances'
keywords: ['sql', 'instances', 'report', 'client', 'computer']
description: 'This document provides a comprehensive report on all installed SQL instances found on an endpoint, detailing client names, location names, computer names, detection status, and the versions and editions of SQL instances detected.'
tags: ['database', 'report']
draft: false
unlisted: false
---

## Summary

This document displays all installed SQL instances found on an endpoint.

## Dependencies

- [CWM - Automate - Role - SQL_Instances](/docs/9885cd22-64e9-4269-91e6-e43946430e13)

## Columns

| Column               | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| ClientName          | The name of the client.                                                    |
| LocationName        | The name of the location.                                                  |
| ComputerName        | The name of the computer.                                                  |
| CurrentlyDetected    | 0 if no SQL instances are detected, 1 if SQL instances are detected.       |
| Versions-Editions   | The found versions and editions separated by a comma.                      |
