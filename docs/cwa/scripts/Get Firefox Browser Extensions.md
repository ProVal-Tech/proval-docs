---
id: 'cwa-epm-data-collection-firefox-extensions'
title: 'EPM - Data Collection - Firefox Extensions'
title_meta: 'EPM - Data Collection - Firefox Extensions Implementation'
keywords: ['automate', 'firefox', 'extensions', 'data', 'collection', 'json', 'sql', 'logging']
description: 'This document outlines the implementation of the agnostic script for collecting data on Firefox extensions within ConnectWise Automate. It details the dependencies, process steps, and the expected output including script logs and a custom table.'
tags: ['configuration', 'database', 'notification', 'report', 'security', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](https://proval.itglue.com/DOC-5078775-11791154).

## Sample Run

![Sample Run](..\..\..\static\img\Get-Firefox-Browser-Extensions\image_1.png)

## Dependencies

- [Get Installed Browsers Extensions [DV]](https://proval.itglue.com/DOC-5078775-11896860)
- [OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355)

## Process

- Creates the [Plugin_ProVal_Browsers_Extensions](https://proval.itglue.com/DOC-5078775-11896865) script if it does not exist.
- Defines the necessary variables.
- Executes the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](https://proval.itglue.com/DOC-5078775-11791154) and stores the data into a JSON file.
- Clears the stale data.
- Executes the [OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355) script to parse through the JSON file and insert the data into the [Plugin_ProVal_Browsers_Extensions](https://proval.itglue.com/DOC-5078775-11896865) table.
- Logs the Success/Failures.

## Output

- Script logs
- Custom Table
- Dataview


