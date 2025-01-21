---
id: 'dab4d9d4-0e2c-40ae-8c95-12e00762c496'
title: 'Possible Brute Force Attacks Dataview'
title_meta: 'Possible Brute Force Attacks Dataview'
keywords: ['brute', 'force', 'attacks', 'dataview', 'event', 'logs', 'login', 'windows']
description: 'This document outlines a dataview designed to display potential brute force attacks against Windows devices by counting failed login attempts recorded in the ConnectWise Automate database. It provides insights into the accounts experiencing these attempts and highlights the importance of monitoring such events for security.'
tags: ['networking', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will display potential "Brute Force" attacks against devices. It counts the number of event logs in the CW Automate database related to failed login attempts for Windows devices. The count is split by the username of the account that experienced the failed logon attempt.

The dataview is named "Possible" because there are several different methods that can cause brute force-type behavior, such as service accounts attempting to log in. This information may not indicate a brute force attempt, but it is still a potentially actionable item to address the cause of the failed login attempts.

This dataview will not display accounts that have failed to log in fewer than 10 times.

**Note:** ProVal also has the monitor @ProVal - Production - Security - Possible Brute Force Attack that can create tickets if desired.

## Dependencies

CW Automate must be configured to gather event logs; otherwise, this dataview will not have data to display.

NetworkInfo will not display unless advanced logon/logoff activity is being tracked on the endpoint/domain.

## Columns

| Column             | Description                                                                                                       |
|--------------------|-------------------------------------------------------------------------------------------------------------------|
| Client Name        | The name of the client associated with the data                                                                  |
| Location Name      | The name of the location associated with the data                                                                |
| Computer Name      | The name of the machine where the possible brute force attack is happening                                        |
| Brute Attack Count  | The total count of event 4625, with the event source "Microsoft-Windows-Security-Auditing," within the last day, for the account name specified in the next column |
| Account Name       | The account name associated with the failed login attempt                                                        |
| Network Info       | This information will not display unless advanced logon/logoff is enabled on the endpoint or domain. This column will attempt to show the network address and source port used to attempt the latest logon. It is highly recommended to review the logs, as there may be several different network addresses attempting to log in. |
| Time Generated     | The time recorded in Automate for the most recent event log instance                                             |
