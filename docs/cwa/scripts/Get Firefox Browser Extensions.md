---
id: '472a8d13-fd00-4a97-90dd-833a171eac40'
title: 'Get Firefox Browser Extensions'
title_meta: 'Get Firefox Browser Extensions'
keywords: ['automate', 'firefox', 'extensions', 'data', 'collection', 'json', 'sql', 'logging']
description: 'This document outlines the implementation of the agnostic script for collecting data on Firefox extensions within ConnectWise Automate. It details the dependencies, process steps, and the expected output including script logs and a custom table.'
tags: ['database', 'report', 'security', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](<../../powershell/Get-FirefoxExtensions.md>).

## Sample Run

![Sample Run](../../../static/img/Get-Firefox-Browser-Extensions/image_1.png)

## Dependencies

- [Get Installed Browsers Extensions [DV]](<./Get Installed Browsers Extensions DV.md>)
- [OverFlowedVariable - SQL Insert - Execute](<./OverFlowedVariable - SQL Insert - Execute.md>)

## Process

- Creates the [Plugin_ProVal_Browsers_Extensions](<../tables/Plugin_ProVal_Browsers_Extensions.md>) script if it does not exist.
- Defines the necessary variables.
- Executes the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](<../../powershell/Get-FirefoxExtensions.md>) and stores the data into a JSON file.
- Clears the stale data.
- Executes the [OverFlowedVariable - SQL Insert - Execute](<./OverFlowedVariable - SQL Insert - Execute.md>) script to parse through the JSON file and insert the data into the [Plugin_ProVal_Browsers_Extensions](<../tables/Plugin_ProVal_Browsers_Extensions.md>) table.
- Logs the successes and failures.

## Output

- Script logs
- Custom Table
- Dataview



