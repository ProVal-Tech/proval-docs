---
id: '3e0ab351-497a-4e39-96d7-a7bec5fc92d8'
slug: /3e0ab351-497a-4e39-96d7-a7bec5fc92d8
title: 'plugin_proval_scripttimesaved_'
title_meta: 'plugin_proval_scripttimesaved_'
keywords: ['queries', 'connectwise', 'automate', 'scripttime', 'database']
description: 'This document provides detailed information on SQL queries used to create tables and triggers that track the total time saved by scripts in a ConnectWise Automate instance. It explains the structure and purpose of each table generated, including daily, weekly, monthly, and yearly tracking of script execution and time savings.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

These queries are used to generate tables and triggers to retain information about the total time saved per script in an Automate instance. Below are the explanations of the tables generated and their contents that are filled by the triggers.

## Dependencies

N/A - These tables are populated with the associated triggers.

## Tables

#### plugin_proval_scripttimesaved_daily

| Column       | Type    | Explanation                                                      |
|--------------|---------|------------------------------------------------------------------|
| ScriptGUID   | VARCHAR | The GUID of the script that is being measured.                  |
| Date         | DATE    | The current full date of the measurement.                        |
| TimeSaved    | INT     | The total number of minutes saved by this script for the current date. |
| Count        | INT     | The total number of script runs for this script for the current date. |

#### plugin_proval_scripttimesaved_weekly

| Column       | Type    | Explanation                                                      |
|--------------|---------|------------------------------------------------------------------|
| ScriptGUID   | VARCHAR | The GUID of the script that is being measured.                  |
| Week         | INT     | The current week of the year (1 - 52) of the measurement.      |
| Year         | INT     | The current year of the measurement.                            |
| TimeSaved    | INT     | The total number of minutes saved by this script for the current week/year combination. |
| Count        | INT     | The total number of script runs for this script for the current week/year combination. |

#### plugin_proval_scripttimesaved_monthly

| Column       | Type    | Explanation                                                      |
|--------------|---------|------------------------------------------------------------------|
| ScriptGUID   | VARCHAR | The GUID of the script that is being measured.                  |
| Month        | INT     | The current month of the year (1 - 12) of the measurement.     |
| Year         | INT     | The current year of the measurement.                            |
| TimeSaved    | INT     | The total number of minutes saved by this script for the current month/year combination. |
| Count        | INT     | The total number of script runs for this script for the current month/year combination. |

#### plugin_proval_scripttimesaved_yearly

| Column       | Type    | Explanation                                                      |
|--------------|---------|------------------------------------------------------------------|
| ScriptGUID   | VARCHAR | The GUID of the script that is being measured.                  |
| Year         | INT     | The current year of the measurement.                            |
| TimeSaved    | INT     | The total number of minutes saved by this script for the current year. |
| Count        | INT     | The total number of script runs for this script for the current year. |

## SQL

[Download SQL Queries](https://proval.itglue.com/attachments/6824289)

