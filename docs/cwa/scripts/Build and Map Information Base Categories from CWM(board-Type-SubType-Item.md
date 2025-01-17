---
id: 'ff2075a4-f6a2-4ac1-b548-286276aa35d8'
title: 'Create Information Base Categories for Manage Boards'
title_meta: 'Create Information Base Categories for Manage Boards'
keywords: ['categories', 'manage', 'ticket', 'database', 'insert', 'cw', 'service', 'plugin']
description: 'This document outlines a script that automates the creation of information base categories for every imported manage board, saving approximately 60 minutes of manual work. It details the process, user parameters, and dependencies required for successful execution.'
tags: ['database', 'setup']
draft: false
unlisted: false
---
## Summary

This script will create information base categories (ticket categories) for every imported manage board.

Time Saved by Automation: 60 Minutes

## Sample Run

![Sample Run](../../../static/img/Build-and-Map-Information-Base-Categories-from-CWM(board-Type-SubType-Item/image_1.png)

## Dependencies

CW Manage Plugin Setup and Service Board import must be completed

#### User Parameters

| Name                        | Example | Required | Description                                 |
|-----------------------------|---------|----------|---------------------------------------------|
| I have backed up the db     | YES     | True     | Confirm MySQL DB backup has been done       |

## Process

Script executes several SQL queries.

Generates list of the insert statements based on the CW Service boards & Type / Subtype / Items.

Executes the insert statements to create new Information Base Categories.

Maps those new info base categories in the CW Manage plugin tables.

## Output

No script output, reload cache and view info base categories in system dashboard & review the CW Manage plugin Ticket category area.











