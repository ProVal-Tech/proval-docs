---
id: 'cwa-time-saved-by-automation'
title: 'Time Saved by Automation Report'
title_meta: 'Time Saved by Automation Report'
keywords: ['automation', 'report', 'mysql', 'scripting', 'efficiency']
description: 'This document provides a detailed overview of the accumulated "Time Saved by Automation" for scripts configured with specific triggers and custom tables. It includes dependencies, a breakdown of relevant columns, and how to interpret the data for improved efficiency and performance in automation tasks.'
tags: ['report', 'mysql', 'efficiency', 'scripting', 'automation']
draft: false
unlisted: false
---
## Summary

Displays the accumulated "Time Saved by Automation" for each script that has the setting set based on triggers and custom tables created by [Time Saved By Automation MySQL](https://proval.itglue.com/DOC-5078775-7142807).

## Dependencies

[Time Saved By Automation MySQL](https://proval.itglue.com/DOC-5078775-7142807)

## Columns

| Column                          | Type    | Description                                                                                           |
|---------------------------------|---------|-------------------------------------------------------------------------------------------------------|
| GUID                            | VARCHAR | The GUID of the script.                                                                               |
| Script Name                    | VARCHAR | The name of the script.                                                                                |
| Average Daily Minutes Saved     | DOUBLE  | The average number of minutes that the script has saved per day since the beginning of data collection. |
| Average Weekly Minutes Saved     | DOUBLE  | The average number of minutes that the script has saved per week since the beginning of data collection. |
| Average Monthly Minutes Saved     | DOUBLE  | The average number of minutes that the script has saved per month since the beginning of data collection. |
| Average Yearly Minutes Saved      | DOUBLE  | The average number of minutes that the script has saved per year since the beginning of data collection. |

