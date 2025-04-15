---
id: 'ff2827dd-bd64-4437-8783-4b576e6cfb81'
slug: /ff2827dd-bd64-4437-8783-4b576e6cfb81
title: 'Get Chromium Browsers Extensions'
title_meta: 'Get Chromium Browsers Extensions'
keywords: ['data', 'collection', 'chromium', 'extensions', 'json', 'sql', 'logging']
description: 'This document outlines the implementation of the EPM - Data Collection script for gathering data on Chromium extensions. It details the process of creating necessary scripts, executing the agnostic script to collect data, and logging the results for analysis.'
tags: ['database', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

This script is an Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](/docs/8828a709-4424-48f9-a5bf-dfc81a40bb97).

## Sample Run

![Sample Run](../../../static/img/Get-Chromium-Browsers-Extensions/image_1.png)

## Dependencies

- [Get Installed Browsers Extensions [DV]](/docs/f0a2db8c-92b6-4584-a70c-209263d46511)
- [OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)

## Process

- Creates the [Plugin_ProVal_Browsers_Extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376) script if it does not exist.
- Defines the necessary variables.
- Executes the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](/docs/8828a709-4424-48f9-a5bf-dfc81a40bb97) and stores the data into a JSON file.
- Clears the stale data.
- Executes the [OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) script to parse through the JSON file and insert the data into the [Plugin_ProVal_Browsers_Extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376) table.
- Logs the successes and failures.

## Output

- Script Log
- Custom Table
- Dataview


