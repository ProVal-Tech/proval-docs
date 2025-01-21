---
id: '5028b9c1-b787-4e98-801f-efc670c0d662'
title: 'Optimize Ticket Routing in ConnectWise Automate'
title_meta: 'Optimize Ticket Routing in ConnectWise Automate'
keywords: ['ticket', 'routing', 'automate', 'categories', 'sql']
description: 'This document details a script designed to optimize ticket routing in ConnectWise Automate by creating descriptive and exact categories based on imported boards. It outlines the process, dependencies, and global parameters necessary for effective use, as well as providing insights into the expected output and time savings achieved through automation.'
tags: ['connectwise', 'database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script is for clients who would like to optimize their ticket routing from Automate. Instead of having vague ticket categories in Automate, such as 'backups' or 'server,' which do not clearly indicate where the ticket should go, we at ProVal prefer to create categories that are descriptive and precise. The script can be run against the Automate Server, although any system will work since this script only runs SQL.

**Time Saved by Automation:** 30 Minutes

## Sample Run

![Sample Run](../../../static/img/Build-and-Map-Information-Base-Categories-from-CWM(board-Type)/image_1.png)

## Dependencies

The CW Manage Plugin should be configured.

## Variables

| **Variable Name**        | **Description**                                                                                       |
|--------------------------|-------------------------------------------------------------------------------------------------------|
| InfoCats                 | This variable will store the value of the SQL statement, including (CategoryName, Related, Keywords, Description, image, listhide). |
| UpdateExistingInfoCats   | This variable will hold the values of the SQL statement that updates the names of the categories.    |

#### Global Parameters

| Name                       | Example | Required | Description                                                                                             |
|----------------------------|---------|----------|---------------------------------------------------------------------------------------------------------|
| I have backed up the db    | 1       | True     | This indicates that the database has been backed up prior to making any changes to the ticket categories. |

## Process

This script will create Information Base Categories based on the boards imported in the ConnectWise Manage Plugin. These categories will be named 'AA - Board - Type - Priority.' For example:

![Process Example](../../../static/img/Build-and-Map-Information-Base-Categories-from-CWM(board-Type)/image_2.png)

There is another option for clients who have subtypes and are using them; this option will create all the categories for Board, Type, and Subtype at each priority. **NOTE:** This script will create a significant number of entries if you use the Board Type SubType option, so be warned. In our test environment, it resulted in approximately 2000 entries.

It is highly recommended, if you have not already done so, to set your priorities in Manage to 'P1'-'P5' instead of 'Low Priority 5' or another long string. A number system maps more easily and is simpler to read briefly in the UI. If you plan to use this script, it is also recommended to organize the types (or subtypes) for all your boards in Manage, cleaning up options that are not in use.

**BEFORE running this script after making changes in Manage, run 'system checks' from the Manage Plugin to update the boards, status, types, and subtypes that the Manage Plugin recognizes.**

![System Checks](../../../static/img/Build-and-Map-Information-Base-Categories-from-CWM(board-Type)/image_3.png)

This script only runs SQL against the database. It is set up to dynamically attempt to update all existing mappings to use the new setup within plugins and other locations.

## Output

CW Manage Plugin

