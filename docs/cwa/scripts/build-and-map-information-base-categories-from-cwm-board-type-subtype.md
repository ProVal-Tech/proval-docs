---
id: 'f68801e5-ac94-4219-900c-15f9d2fb92d4'
slug: /f68801e5-ac94-4219-900c-15f9d2fb92d4
title: 'Build and Map Information Base Categories from CWM(board-Type-SubType)'
title_meta: 'Build and Map Information Base Categories from CWM(board-Type-SubType)'
keywords: ['script', 'manage', 'categories', 'ticket', 'automation']
description: 'This document describes a script that automates the creation of information base categories for every imported manage board in the CW Manage Plugin, saving approximately 30 minutes of manual work. It includes details on dependencies, variables, global parameters, and the process involved.'
tags: ['database', 'security', 'update']
draft: false
unlisted: false
---

## Summary

This script will create information base categories (ticket categories) for every imported manage board.

**Time Saved by Automation:** 30 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/f68801e5-ac94-4219-900c-15f9d2fb92d4/image_1.webp)

## Dependencies

The CW Manage Plugin should be configured.

## Variables

| **Variable Name**               | **Description**                                                                                     |
|----------------------------------|-----------------------------------------------------------------------------------------------------|
| InfoCats                        | This variable stores the results of the SQL query which fetches the info categories.               |
| UpdateExistingInfoCats         | This variable stores the results of the SQL query which updates the info base categories.          |

#### Global Parameters

| Name                           | Example | Required | Description                                                                                           |
|--------------------------------|---------|----------|-------------------------------------------------------------------------------------------------------|
| I have backed up the db       | 1       | True     | This indicates that the DB has been backed up prior to making any changes to the Infobase categories. |

## Process

This script will create information base categories (ticket categories) for every imported manage board. It runs three SQL queries to retrieve, ignore, and update the info base categories in the CW Manage Plugin.

## Output

CW Manage Plugin