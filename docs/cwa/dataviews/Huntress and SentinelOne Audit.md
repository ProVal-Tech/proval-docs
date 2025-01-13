---
id: 'cwa-sentinel-huntress-status-report'
title: 'Sentinel One and Huntress Installation Status Report'
title_meta: 'Sentinel One and Huntress Installation Status Report'
keywords: ['sentinelone', 'huntress', 'installation', 'status', 'report', 'agents']
description: 'This document provides a detailed report on the installation status of Sentinel One and Huntress for various locations. It includes information on whether the installations are allowed, the count of agents installed, and the count of missing agents for both Sentinel One and Huntress at each location.'
tags: ['installation', 'report', 'security', 'software', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview will show Sentinel One and Huntress installation status (allowed or not) for a location, it will also show the count of agents per location where Sentinel and Huntress are installed and missing.

## Dependencies

- Huntress Deployment -- EDF
- SentinelOne_Site_Token -- EDF

## Columns

| Column                      | Description                                               |
|-----------------------------|-----------------------------------------------------------|
| Client Name                 | Client Name                                              |
| Location Name               | Location Name                                            |
| SentinelOne Status          | SentinelOne token detected or not                        |
| Huntress Status             | Huntress deployment allowed or not                       |
| Huntress Install Count      | Huntress agent install count on agents of each location  |
| Huntress Missing Count      | Huntress agent missing count on each location            |
| SentinelOne Install Count   | SentinelOne install count on agents of each location     |
| SentinelOne Missing Count   | SentinelOne missing count on agents of each location     |



