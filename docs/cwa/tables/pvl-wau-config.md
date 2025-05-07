---
id: 'be117f3c-0af2-4edb-8fcc-06da1a4db062'
slug: /be117f3c-0af2-4edb-8fcc-06da1a4db062
title: 'pvl_wau_config'
title_meta: 'pvl_wau_config'
keywords: ['configuration', 'whitelist', 'blacklist', 'notification', 'updateinterval', 'updatetime', 'windows']
description: 'This document outlines the purpose and structure of the custom table used for storing the configuration settings related to the Winget Auto Update feature. It details the dependencies, the table structure, and the significance of each column in managing the auto-update settings for client computers.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This document stores the current configuration set for the computer from the client-level EDFs defined in the [Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55) script document. The data stored in this custom table is used by the [Execute Script - Configure Winget Auto Update](/docs/a2fa065f-6f76-4442-a0e0-a64365f6c331) internal monitor to detect the computers after making any changes to the associated EDFs.

## Dependencies

[SWM - Software Update - Script - Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55)

## Tables

#### pvl_wau_config

| Column                   | Type      | Explanation                                                                                           |
|-------------------------|-----------|-------------------------------------------------------------------------------------------------------|
| computerid              | int       | Computer ID of the computer.                                                                          |
| enabled                 | tinyint   | Is the Winget auto-update solution enabled for the computer? (0/1)                                   |
| whitelist               | text      | Whitelisted applications set in the client-level EDF `WAU - Whitelist`.                              |
| blacklist               | text      | Blacklisted applications set in the client-level EDF `WAU - Whitelist`.                              |
| usercontext             | tinyint   | Are the updates enabled for user-level applications too? (0/1)                                       |
| notification            | varchar   | Notification level as set in the client-level EDF `WAU - NotificationLevel`.                         |
| updateinterval          | varchar   | Update interval as set in the client-level EDF `WAU - UpdateInterval`.                               |
| updatetime              | varchar   | Update time as set in the client-level EDF `WAU - UpdatesAtTime`.                                   |
| updatesatlogon         | tinyint   | Are the updates enabled at user login too? (0/1)                                                    |
| donotrunafterinstallation| tinyint   | Is the WAU allowed to run after installation? (0/1)                                                 |
| remotemonitor           | tinyint   | Is the [Winget Auto Update Errors](/docs/68a14948-368f-4064-97a3-d1928e122013) remote monitor creation enabled? (0/1) |


