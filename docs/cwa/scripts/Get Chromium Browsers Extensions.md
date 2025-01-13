---
id: 'cwa-epm-data-collection-chromium-extensions'
title: 'EPM - Data Collection - Chromium Extensions'
title_meta: 'EPM - Data Collection - Chromium Extensions'
keywords: ['data', 'collection', 'chromium', 'extensions', 'json', 'sql', 'logging']
description: 'This document outlines the implementation of the EPM - Data Collection script for gathering data on Chromium extensions. It details the process of creating necessary scripts, executing the agnostic script to collect data, and logging the results for analysis.'
tags: ['configuration', 'database', 'notification', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

This script is an Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](https://proval.itglue.com/DOC-5078775-11791153).

## Sample Run

![Sample Run](../../../static/img/Get-Chromium-Browsers-Extensions/image_1.png)

## Dependencies

- [Get Installed Browsers Extensions [DV]](https://proval.itglue.com/DOC-5078775-11896860)
- [OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355)

## Process

- Creates the [Plugin_ProVal_Browsers_Extensions](https://proval.itglue.com/DOC-5078775-11896865) script if it does not exist.
- Defines the necessary variables.
- Executes the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](https://proval.itglue.com/DOC-5078775-11791153) and stores the data into a JSON file.
- Clears the stale data.
- Executes the [OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355) script to parse through the JSON file and insert the data into the [Plugin_ProVal_Browsers_Extensions](https://proval.itglue.com/DOC-5078775-11896865) table.
- Logs the Success/Failures.

## Output

- Script Log
- Custom Table
- Dataview



