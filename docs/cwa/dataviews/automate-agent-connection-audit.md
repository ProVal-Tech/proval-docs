---
id: '1c5558e1-70a3-4b38-bdc0-e3eb8cf29d43'
slug: /1c5558e1-70a3-4b38-bdc0-e3eb8cf29d43
title: 'Automate Agent Connection Audit'
title_meta: 'Automate Agent Connection Audit'
keywords: ['status', 'online', 'offline', 'computer', 'audit', 'data', 'report']
description: 'This document provides a comprehensive overview of the online and offline status of computers over the past 30 days, including detailed insights for the last 7 days and 24 hours. It explains how data is collected and displayed, along with the dependencies and columns used in the dataview.'
tags: ['database', 'performance', 'report']
draft: false
unlisted: false
---

## Summary

The dataview compares the time a computer was online versus offline over the past 30 days. It also provides detailed status updates for the past 7 days and the past 24 hours.

This information is calculated and displayed using data from the [pvl_automate_connection_audit_daily](/docs/da608773-1677-4247-a161-ea62b3b3ba23) table. Therefore, the `- 7 Days` and `- 30 Days` columns will only be accurate once the `Days Since Data Collection` reaches 7 and 30 days, respectively. Until then, calculations are based on the available data in the [pvl_automate_connection_audit_daily](/docs/da608773-1677-4247-a161-ea62b3b3ba23) table.

Additionally, the `Days Since Data Collection` column may not be precise, with a possible variance of up to ±23 hours from the actual data saved time. It shows rounded-off information.

As a result, it is normal for the `Online - 30 Days` or other columns to display `6 days 23 hours 39 minutes` while the `Days Since Data Collection` column shows `6 days`.

## Dependencies

- [CWM - Automate - Custom Table - pvl_automate_connection_audit_daily](/docs/da608773-1677-4247-a161-ea62b3b3ba23)
- [CWM - Automate - Custom Table - pvl_automate_connection_audit](/docs/ec679801-c86a-4127-9b62-46be10207909)
- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](/docs/6dfa2f6b-02bb-4ccb-b69f-e23bc8d75b5d)
- [CWM - Automate - script - Automate Agent Connection Audit](/docs/ef69cef8-da15-46b7-94a4-697431a87929)

## Columns

| Column                          | Description                                                                                          |
|---------------------------------|------------------------------------------------------------------------------------------------------|
| clientid                        | clientid (Hidden)                                                                                   |
| locationid                      | locationid (Hidden)                                                                                 |
| computerid                      | computerid                                                                                          |
| Client                          | Client Name                                                                                         |
| Location                        | Location Name                                                                                       |
| Computer                        | Computer Name                                                                                       |
| Operating System                | Operating System                                                                                    |
| Last Contact                    | Last Contact time with Automate                                                                     |
| Last LoggedIn User              | Last LoggedIn User on the computer                                                                   |
| Minutes Since Last Contact      | Minutes since it last contacted Automate                                                            |
| Form Factor                     | Computer type (Physical Server/Virtual Server/Laptop/Desktop)                                       |
| Online Minutes - 24 Hours       | Number of minutes the computer was online in the past 24 hours                                      |
| Offline Minutes - 24 Hours      | Number of minutes the computer was offline in the past 24 hours                                     |
| Online - 24 Hours               | Amount of time for which the computer was online in the past 24 hours (Format: 'xxhr xxmin'; example: '10hr 38min') |
| Offline - 24 Hours              | Amount of time for which the computer was offline in the past 24 hours (Format: 'xxhr xxmin'; example: '10hr 38min') |
| Online Percentage - 24 Hours    | Percentage of time the computer was online in the past 24 hours                                     |
| Offline Percentage - 24 Hours   | Percentage of time the computer was offline in the past 24 hours                                    |
| Online Minutes - 7 Days         | Number of minutes the computer was online in the past 7 days (Hidden)                               |
| Offline Minutes - 7 Days        | Number of minutes the computer was offline in the past 7 days (Hidden)                              |
| Online - 7 Days                 | Amount of time for which the computer was online in the past 7 days (Format: 'xday xxhr xxmin'; example: '4day 10hr 38min') (Hidden) |
| Offline - 7 Days                | Amount of time for which the computer was offline in the past 7 days (Format: 'xday xxhr xxmin'; example: '4day 10hr 38min') (Hidden) |
| Online Percentage - 7 Days      | Percentage of time the computer was online in the past 7 days (Hidden)                              |
| Offline Percentage - 7 Days     | Percentage of time the computer was offline in the past 7 days (Hidden)                             |
| Online Minutes - 30 Days        | Number of minutes the computer was online in the past 30 days                                       |
| Offline Minutes - 30 Days       | Number of minutes the computer was offline in the past 30 days                                      |
| Online - 30 Days                | Amount of time for which the computer was online in the past 30 days (Format: 'xxday xxhr xxmin'; example: '14day 10hr 38min') |
| Offline - 30 Days               | Amount of time for which the computer was offline in the past 30 days (Format: 'xxday xxhr xxmin'; example: '14day 10hr 38min') |
| Online Percentage - 30 Days     | Percentage of time the computer was online in the past 30 days                                      |
| Offline Percentage - 30 Days    | Percentage of time the computer was offline in the past 30 days                                     |
| Days Since Data Collection       | Number of days the current calculations displayed in the dataview are based upon. It may not be precise, with a possible variance of up to ±23 hours from the actual data saved time. It shows rounded-off information. It is normal for the `Online - 30 Days` or other columns to display `6 days 23 hours 39 minutes` while the `Days Since Data Collection` column shows `6 days`. |