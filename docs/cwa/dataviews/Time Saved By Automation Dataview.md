---
id: '4b30f415-b15b-4dd5-b2cf-13a69dbeb538'
title: 'Time Saved By Automation Dataview'
title_meta: 'Time Saved By Automation Dataview'
keywords: ['automation', 'report', 'mysql', 'scripting', 'efficiency']
description: 'This document provides a detailed overview of the accumulated "Time Saved by Automation" for scripts configured with specific triggers and custom tables. It includes dependencies, a breakdown of relevant columns, and how to interpret the data for improved efficiency and performance in automation tasks.'
tags: ['mysql', 'report']
draft: false
unlisted: false
---

## Summary

This document displays the accumulated "Time Saved by Automation" for each script that has the setting configured based on triggers and custom tables created by [Time Saved By Automation MySQL](<../tables/plugin_proval_scripttimesaved_.md>).

## Dependencies

[Time Saved By Automation MySQL](<../tables/plugin_proval_scripttimesaved_.md>)

## Columns

| Column                         | Type    | Description                                                                                           |
|--------------------------------|---------|-------------------------------------------------------------------------------------------------------|
| GUID                           | VARCHAR | The GUID of the script.                                                                               |
| Script Name                   | VARCHAR | The name of the script.                                                                                |
| Average Daily Minutes Saved    | DOUBLE  | The average number of minutes that the script has saved per day since the beginning of data collection. |
| Average Weekly Minutes Saved    | DOUBLE  | The average number of minutes that the script has saved per week since the beginning of data collection. |
| Average Monthly Minutes Saved    | DOUBLE  | The average number of minutes that the script has saved per month since the beginning of data collection. |
| Average Yearly Minutes Saved     | DOUBLE  | The average number of minutes that the script has saved per year since the beginning of data collection. |




