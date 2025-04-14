---
id: 'ac16bf53-5607-4ea9-8a5f-1f44f732ca1b'
slug: /ac16bf53-5607-4ea9-8a5f-1f44f732ca1b
title: 'Huntress and SentinelOne Audit'
title_meta: 'Huntress and SentinelOne Audit'
keywords: ['sentinelone', 'huntress', 'installation', 'status', 'report', 'agents']
description: 'This document provides a detailed report on the installation status of Sentinel One and Huntress for various locations. It includes information on whether the installations are allowed, the count of agents installed, and the count of missing agents for both Sentinel One and Huntress at each location.'
tags: ['installation', 'performance', 'report', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This dataview will show the installation status (allowed or not) of Sentinel One and Huntress for each location. It will also display the count of agents installed and missing for both Sentinel One and Huntress at each location.

## Dependencies

- Huntress Deployment -- EDF
- SentinelOne Site Token -- EDF

## Columns

| Column                      | Description                                               |
|-----------------------------|-----------------------------------------------------------|
| Client Name                 | Name of the client                                        |
| Location Name               | Name of the location                                      |
| SentinelOne Status          | Indicates whether the SentinelOne token is detected or not|
| Huntress Status             | Indicates whether Huntress deployment is allowed or not   |
| Huntress Install Count      | Count of Huntress agents installed at each location       |
| Huntress Missing Count      | Count of missing Huntress agents at each location         |
| SentinelOne Install Count   | Count of SentinelOne agents installed at each location    |
| SentinelOne Missing Count   | Count of missing SentinelOne agents at each location      |



