---
id: '2688bbd1-7e0c-4bc9-9bb9-a2c3977f3239'
title: 'Dataview for Local Caching Detection'
title_meta: 'Dataview for Local Caching Detection'
keywords: ['dataview', 'caching', 'offline', 'files', 'detection']
description: 'This document provides a dataview that detects whether a machine allows local caching of files for offline access based on role detection. It includes details on dependencies, columns, and the status of offline files.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview detects if the machine allows local caching of files for offline access based on role detection.

## Dependencies

- @Windows - Offline Files Enabled (Role)

## Columns

| Column                | Description                                                  |
|----------------------|--------------------------------------------------------------|
| Client               | Client Name                                                 |
| Location             | Location Name                                               |
| Computer             | Computer Name                                               |
| OS                   | OS installed on the agent                                   |
| Offline Files Status  | Enabled / Disabled for offline file status (based on role detection) |

